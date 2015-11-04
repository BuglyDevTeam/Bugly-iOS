//
//  BuglyLog.h
//  Rqd
//
//  Created by Yeelik on 15/10/12.
//  Copyright © 2015年 tencent.com. All rights reserved.
//

#import <Foundation/Foundation.h>

// Log level for Bugly Logger
typedef NS_ENUM(NSUInteger, BLYLogLevel) {
    BLYLogLevelSilent  = 0,
    BLYLogLevelError   = 1 << 0, // 00001
    BLYLogLevelWarn    = 1 << 1, // 00010
    BLYLogLevelInfo    = 1 << 2, // 00100
    BLYLogLevelDebug   = 1 << 3, // 01000
    BLYLogLevelVerbose = 1 << 4, // 10000
};

#define BLOG_LEVEL_ERR     BLYLogLevelError
#define BLOG_LEVEL_WARN    BLYLogLevelWarn
#define BLOG_LEVEL_INFO    BLYLogLevelInfo
#define BLOG_LEVEL_DEBUG   BLYLogLevelDebug
#define BLOG_LEVEL_VERBOSE BLYLogLevelVerbose
#define BLOG_LEVEL_OFF     BLYLogLevelSilent

#define BLYLOG_MACRO(_level, fmt, ...) [BuglyLog level:_level tag:nil log:fmt, ##__VA_ARGS__]

#pragma mark - Replace to NSLog

#define BLogError(fmt, ...)   BLYLOG_MACRO(BLYLogLevelError, fmt, ##__VA_ARGS__)
#define BLogWarn(fmt, ...)    BLYLOG_MACRO(BLYLogLevelWarn,  fmt, ##__VA_ARGS__)
#define BLogInfo(fmt, ...)    BLYLOG_MACRO(BLYLogLevelInfo, fmt, ##__VA_ARGS__)
#define BLogDebug(fmt, ...)   BLYLOG_MACRO(BLYLogLevelDebug, fmt, ##__VA_ARGS__)
#define BLogVerbose(fmt, ...) BLYLOG_MACRO(BLYLogLevelVerbose, fmt, ##__VA_ARGS__)

#pragma mark - Interface
@interface BuglyLog : NSObject

/**
 *    @brief  初始化日志模块
 *
 *    @param level 设置默认日志级别，默认BLYLogLevelInfo
 *
 *    @param printConsole 是否打印到控制台，默认NO
 */
+ (void)initLogger:(BLYLogLevel) level consolePrint:(BOOL) printConsole;

/**
 *    @brief  获取默认的日志级别
 *
 *    @return BLYLogLevel
 */
+ (BLYLogLevel)logLevel;

/**
 *    @brief 打印BLYLogLevelInfo日志
 *
 *    @param format 日志内容
 */
+ (void)log:(NSString *)format, ...;

/**
 *    @brief  打印日志
 *
 *    @param level 日志级别
 *    @param fmt   日志内容
 */
+ (void)level:(BLYLogLevel) level log:(NSString *)format, ...;

/**
 *    @brief  打印日志
 *
 *    @param level  日志级别
 *    @param tag    日志模块分类
 *    @param format 日志内容
 */
+ (void)level:(BLYLogLevel)level tag:(NSString *) tag log:(NSString *)format, ...;

@end
