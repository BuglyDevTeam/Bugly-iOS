//
//  AppDelegate.m
//  BuglySDKDemo
//
//  Created by mqq on 14/11/25.
//  Copyright (c) 2014年 Tencent. All rights reserved.
//

#import "AppDelegate.h"

#import <Bugly/CrashReporter.h>

#define BUGLY_APP_ID @"900001055"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    // 自定义Bugly参数配置
    // [self customizeBuglySDKConfig];
    
    // 初始化Bugly SDK，开启崩溃捕获上报功能及卡顿监听上报
    [[CrashReporter sharedInstance] installWithAppId:BUGLY_APP_ID];
    // ------
    // 注意: 在调试SDK的捕获上报功能时，请注意以下内容:
    // 1. Xcode断开编译器，否则Xcode编译器会拦截应用错误信号，让应用进程挂起，方便开发者调试定位问题。此时，SDK无法顺利进行崩溃的错误上报
    // 2. 请关闭项目存在第三方捕获工具，否则会相互产生影响。因为崩溃捕获的机制一致，系统只会保持一个注册的崩溃处理函数
    // ------
    
    return YES;
}

static int exception_callback_handler() {
    NSLog(@"bugly exception callback handler");
    
    NSException * exception = [[CrashReporter sharedInstance] getCurrentException];
    if (exception) {
        // 捕获的Obj-C异常
    }
    
    // 捕获的错误信号堆栈
    NSString * callStack = [[CrashReporter sharedInstance] getCrashStack];
    NSLog(@" %@", callStack);
    
    // 设置崩溃场景的附件
    [[CrashReporter sharedInstance] setUserData:@"用户身份" value:@"用户名"];
    
    [[CrashReporter sharedInstance] setAttachLog:@"业务关键日志"];
    
    return 1;
}

// 自定义Bugly配置
- (void)customizeBuglySDKConfig {
    // 调试阶段开启sdk日志打印, 发布阶段请务必关闭
#if DEBUG == 1
    [[CrashReporter sharedInstance] enableLog:YES];
#endif
    
    // SDK默认采用BundleShortVersion(BundleVersion)的格式作为版本,如果你的应用版本不是采用这样的格式，你可以通过此接口设置
//    [[CrashReporter sharedInstance] setBundleVer:@"1.0.2"];
    
    // 如果你的App有对应的发布渠道(如AppStore),你可以通过此接口设置, 默认值为unknown,
    [[CrashReporter sharedInstance] setChannel:@"测试渠道"];
    
    // 你可以在初始化之前设置本地保存的用户身份, 也可以在用户身份切换后调用此接口即时修改
    [[CrashReporter sharedInstance] setUserId:[NSString stringWithFormat:@"测试用户:%@", @"tester"]];
    
    // 关闭卡顿监听上报
    [[CrashReporter sharedInstance] enableBlockMonitor:NO autoReport:NO];
    
    // 关闭进程内符号化处理, SDK默认开启此功能, 如果开启, 请检查Xcode工程配置Strip Style不能为ALL Symbols
    [[CrashReporter sharedInstance] setEnableSymbolicateInProcess:NO];
    
    // 自定义崩溃处理回调函数
    exp_call_back_func = &exception_callback_handler;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
