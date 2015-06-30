//
//  AppDelegate.m
//  Bugly-iOS-Demo
//
//  Created by Ben Xu on 15/6/30.
//  Copyright (c) 2015年 tencent.com. All rights reserved.
//

#import "AppDelegate.h"
#import <Bugly/CrashReporter.h>

//请替换成在bugly.qq.com申请到的appid
#define BUGLY_APPID @"900001055"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //Bugly 自定义设置,可选
    [self customConfig];
    
    // 使用AppID初始化SDK
    [[CrashReporter sharedInstance] installWithAppId:BUGLY_APPID];
    // ------
    // 注意: 在调试SDK的捕获上报功能时，请注意以下内容:
    // 1. Xcode断开编译器，否则Xcode编译器会拦截应用错误信号，让应用进程挂起，方便开发者调试定位问题。此时，SDK无法顺利进行崩溃的错误上报
    // 2. 请关闭项目存在第三方捕获工具，否则会相互产生影响。因为崩溃捕获的机制一致，系统只会保持一个注册的崩溃处理函数
    // ------
    return YES;
}

- (void)customConfig {
    // 调试阶段开启sdk日志打印, 发布阶段请务必关闭
#if DEBUG == 1
    [[CrashReporter sharedInstance] enableLog:YES];
#endif
    
    // SDK默认采用BundleShortVersion(BundleVersion)的格式作为版本,如果你的应用版本不是采用这样的格式，你可以通过此接口设置
    [[CrashReporter sharedInstance] setBundleVer:@"1.0.2"];
    
    // 如果你的App有对应的发布渠道(如AppStore),你可以通过此接口设置, 默认值为unknown,
    [[CrashReporter sharedInstance] setChannel:@"测试渠道"];
    
    // 你可以在初始化之前设置本地保存的用户身份, 也可以在用户身份切换后调用此接口即时修改
    [[CrashReporter sharedInstance] setUserId:[NSString stringWithFormat:@"测试用户:%@", @"tester"]];
    
    // 如果应用有自定义的设备标识、可以调用此接口设置, SDK默认通过UDID标识设备
    // [[CrashReporter sharedInstance] setDeviceId:@""];
    
    // 开启卡顿监测上报功能,
    [[CrashReporter sharedInstance] enableBlockMonitor:YES autoReport:YES];
    
    //设置崩溃处理回调函数, 开发者可以在回调函数中获取崩溃信息或为崩溃信息添加附加信息上报
    exp_call_back_func = &exception_callback_handler_test;
    // --- end ---
}

/**
 *    @brief  崩溃发生时的回调处理函数, 开发者可以在这里获取崩溃信息, 并为崩溃信息添加附带信息上报
 *
 *    @return value could be ignore
 */
static int exception_callback_handler_test() {
    NSLog(@"enter the exception callback");
    NSException *exception = [[CrashReporter sharedInstance] getCurrentException];
    if (exception) {
        NSLog(@"sdk catch an NSException: \n%@:%@\nRetrace stack:\n%@", [exception name], [exception reason], [exception callStackSymbols]);
    } else {
        NSString *type  = [[CrashReporter sharedInstance] getCrashType];
        NSString *stack = [[CrashReporter sharedInstance] getCrashStack];
        NSLog(@"sdk catch an exception: \nType:%@ \nTrace stack:\n%@", type, stack);
        
        NSString *crashLog = [[CrashReporter sharedInstance] getCrashLog];
        if (crashLog) {
            NSLog(@"sdk save a crash log: \n%@", crashLog);
        }
    }
    
    // 你可以通过此接口添加附带信息同崩溃信息一起上报, 以key-value形式组装
    [[CrashReporter sharedInstance] setUserData:@"测试用户" value:[NSString stringWithFormat:@"Bugly用户测试:%@", BUGLY_APPID]];
    
    // 你可以通过次接口添加附件信息同崩溃信息一起上报
    [[CrashReporter sharedInstance] setAttachLog:@"使用Bugly进行崩溃问题跟踪定位"];
    
    return 1;
}
@end
