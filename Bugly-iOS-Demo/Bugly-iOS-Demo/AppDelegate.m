//
//  AppDelegate.m
//  Bugly-iOS-Demo
//
//  Created by Ben Xu on 15/6/30.
//  Copyright (c) 2015年 tencent.com. All rights reserved.
//

#import "AppDelegate.h"
#import <Bugly/Bugly.h>

//请替换成在 bugly.qq.com 申请到的 appid
#define BUGLY_APPID @"900001055"

@interface AppDelegate ()<BuglyDelegate>

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //Bugly 自定义设置,可选
    BuglyConfig *bConfig = [[BuglyConfig alloc] init];
    //设置渠道标识
    bConfig.channel = @"Github Demo";
    //开启卡顿功能
    bConfig.blockMonitorEnable = YES;
    //卡顿超时设为1秒
    bConfig.blockMonitorTimeout = 1;
    //开启非正常退出上报
    bConfig.unexpectedTerminatingDetectionEnable = YES;
    //开启页面追踪功能
    bConfig.viewControllerTrackingEnable = YES;
    //开启控制台日志上报
    bConfig.consolelogEnable = YES;
    //设置Bugly delegate
    bConfig.delegate = self;
    // 使用AppID初始化SDK
    [Bugly startWithAppId:BUGLY_APPID
#ifdef DEBUG
        developmentDevice:YES
#endif
                   config:bConfig];
    //设置用户标识
    [Bugly setUserIdentifier:[UIDevice currentDevice].name];
    return YES;
}

/**
 *    @brief  崩溃发生时的回调处理函数, 开发者可以在这里获取崩溃信息, 并为崩溃信息添加附带信息上报
 *
 *    @return 需要随着崩溃信息一起上报的数据
 */
- (NSString *)attachmentForException:(NSException *)exception {
    return @"DEMO:需要随着崩溃信息一起上报的数据";
}
@end
