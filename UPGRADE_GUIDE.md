#Bugly 旧版本顺滑升级指引

为了SDK接口更加清晰明了，避免使用中的困惑，我们重新梳理调整了Bugly SDK中的接口，请旧版本(< 2.0)用户参照此指引进行升级。

###初始化

- 导入头文件

```objective-c
#import <Bugly/CrashReporter.h>
```
**改为**

```objective-c
#import <Bugly/Bugly.h>
```

- 初始化SDK

```objective-c
	[[CrashReporter sharedInstance] installWithAppkey:@"BUGLY_APP_ID"];
```
**改为**

```objective-c
	[Bugly startWithAppId:@"BUGLY_APP_ID"];
```

如需要配合Extension的使用，需要设置App Group Identifier 的，采用以下方式

```objective-c
	[[CrashReporter sharedInstance] installWithAppkey:@"BUGLY_APP_ID"
	                   applicationGroupIdentifier:@"APP_GROUP_ID"];
```
**改为**

```objective-c
	BuglyConfig *config = [[BuglyConfig alloc] init];
	config.applicationGroupIdentifier = @"APP_GROUP_ID";
	[Bugly startWithAppId:@"BUGLY_APP_ID" config:config];
```

###功能开关

**在新版本(2.0 +) Bugly接口中，所有的功能开关均在 BuglyConfig 中设置，请在初始化 Bugly 前先自定义 BuglyConfig**

```objective-c
	BuglyConfig *config = [[BuglyConfig alloc] init];
	// 自定义config
	// 如：config.unexpectedTerminatingDetectionEnable = YES;
	[Bugly startWithAppId:@"BUGLY_APP_ID" config:config];
```

- 非正常退出事件(SIGKILL) 

```objective-c
	[[CrashReporter sharedInstance] enableUnexpectedTerminatingDetection:YES];
```
**改为**

```objective-c
	config.unexpectedTerminatingDetectionEnable = YES;
```

- 卡顿监控

```objective-c
	[[CrashReporter sharedInstance] enableBlockMonitor:YES];
```
**改为**

```objective-c
	config.blockMonitorEnable = YES;
```

- 开启SDK日志

```objective-c
	[[CrashReporter sharedInstance] enableLog:YES];
```
**改为**

```objective-c
    config.debugMode = YES;
```

- App Transport Security ( 上报是否采用 HTTPS )

```objective-c
	[[CrashReporter sharedInstance] enableAppTransportSecurity:YES];
```
**改为**

```objective-c
	config.appTransportSecurityEnable = YES;
```

- App Transport Security ( 上报是否采用 HTTPS )

```objective-c
	[[CrashReporter sharedInstance] enableAppTransportSecurity:YES];
```
**改为**

```objective-c
	config.appTransportSecurityEnable = YES;
```

- 进程内还原符号

```objective-c
	[[CrashReporter sharedInstance] setEnableSymbolicateInProcess:YES];
```
**改为**

```objective-c
	config.symbolicateInProcessEnable = YES;
```

###自定义数据

**在新版本(2.0 +) Bugly接口中，部分自定义数据在 BuglyConfig 中设置，请在初始化 Bugly 前先自定义 BuglyConfig。**

- 渠道标识

```objective-c
	[[CrashReporter sharedInstance] setChannel:@"AppStore"];
```
**改为**

```objective-c
	config.channel = @"AppStore";
```

- 自定义版本号

```objective-c
	[[CrashReporter sharedInstance] setBundleVer:@"1.0"];
```
**改为**

```objective-c
	config.version = @"1.0";
```

- 设备标识

```objective-c
	[[CrashReporter sharedInstance] setDeviceId:@"DEVICE_ID"];
```
**改为**

```objective-c
	config.deviceId = @"DEVICE_ID";
```

- 卡顿阀值

*注意：旧接口中单位为毫秒(ms)，默认值3000ms，新接口中单位为秒(s)，默认值3s

```objective-c
	[[CrashReporter sharedInstance] setBlockMonitorJudgementLoopTimeout:1000];
```
**改为**

```objective-c
	config.blockMonitorTimeout = 1.0;
```

- 上报自定义KeyValue数据

```objective-c
	[[CrashReporter sharedInstance] setUserData:@"Test Key" value:@"Test Value"];
```
**改为**

```objective-c
	[Bugly setUserValue:@"Test Value" forKey:@"Test Key"];
```

- 设置Tag

```objective-c
	[[CrashReporter sharedInstance] setSceneTag:1];
```
**改为**

```objective-c
	[Bugly setTag:1];
```

- 设置用户标识

```objective-c
	[[CrashReporter sharedInstance] setUserId:@"USER_ID"];
```
**改为**

```objective-c
	[Bugly setUserIdentifier:@"USER_ID"];
```

- 主动上报异常

```objective-c
	NSException *exception = [NSException exceptionWithName:@"NAME"
	                                             reason:@"REASON"
	                                           userInfo:@{@"KEY":@"VALUE"}];
	[[CrashReporter sharedInstance] reportException:exception
	                                 reason:@"INFO"
	                              extraInfo:@{@"KEY":@"VALUE"}];
```
**改为**

```objective-c
	NSException *exception = [NSException exceptionWithName:@"NAME"
	                                         reason:@"REASON"
	                                       userInfo:@{@"KEY":@"VALUE"}];
	[Bugly reportException:exception];
```

