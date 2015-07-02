# Bugly iOS SDK 接入指南

## 1. SDK 集成

Bugly 提供两种集成 SDK 方式供 iOS 开发者选择

* CocoaPods  
* 手动集成 

### 1.1 CocoaPods 集成方式

在工程的 **Podfile** 里面添加以下代码

`
pod 'Bugly'
`

保存并运行`pod install`,然后用后缀为`.xcworkspace`的文件打开工程

关于`CocoaPods`的更多信息请查看 [CocoaPods官方网站](https://cocoapods.org "CocoaPods") 

### 1.2 手动集成方式

* 下载并解压 [iOS SDK](http://bugly.qq.com/sdkdown?id=05deedf8-796e-4e95-9d1d-3bb3d9890e78 "iOS SDK") 
* 拖拽`Bugly_libc++`目录下的`Bugly.framework`文件到 Xcode 工程内 （请勾选复制选项）
* 添加依赖库
	* `SystemConfiguration.framework`
	* `Security.framework`
	* `libz.dylib`
	* `libc++.dylib`

**如果你的 Xcode 工程的 `C++ Standard Library` 配置为`libstdc++`**

1. 请选择`Bugly_libstdc++`目录下的`Bugly.framework`
2. 并将`libc++.dylib`替换为`libstdc++.dylib`

## 2. 初始化SDK

### 1.导入头文件

在工程的`AppDelegate.m`中导入头文件

`
#import <Bugly/CrashReporter.h>
`

**如果是 Swift 工程，请在对应`bridging-header.h`中导入**

### 2.初始化 Bugly

在工程`AppDelegate`的`application didFinishLaunch...`方法中初始化 Bugly

**Objective-C**

	- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
		[[CrashReporter sharedInstance] installWithAppId:@"此处替换为你的AppId"];
		return YES;
	  }


**Swift**

	func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
		CrashReporter.sharedInstance().installWithAppId("此处替换为你的AppId")
		return true
    }


#### 至此，恭喜你的工程已经成功集成 Bugly，接下来编译并运行你的工程吧 ：）


----

##如何确认成功接入 Bugly ？

Bugly 会在 log 中输出关键步骤,为了完成接入检测,请在你的 App 代码中手动构建一个异常,如下

**Objective-C**

	- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    	[[CrashReporter sharedInstance] installWithAppId:@"此处替换为你的AppId"];
    	[self performSelector:@selector(crash) withObject:nil afterDelay:3.0];
    	return YES;
    	}

**Swift**

	func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    	CrashReporter.sharedInstance().installWithAppId("此处替换为你的AppId")
    	NSObject.performSelector("crash", withObject: nil, afterDelay: 2.0)
    	return true
	}


**请连接 iOS 设备编译并运行后，点击 Xcode 的中止按钮断开调试模式，然后重新启动 App 进行关键步骤确认**

*编译启动后，点击Xcode的中止按钮中断调试*

### 关键步骤 log 输出

**请在初始化Bugly 代码前打开 log 输出**

`- (void)enableLog:(BOOL)enabled;`

**Objective-C**

	- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
		[[CrashReporter sharedInstance] enableLog:YES];
		[[CrashReporter sharedInstance] installWithAppId:@"此处替换为你的AppId"];
		[self performSelector:@selector(crash) withObject:nil afterDelay:3.0];
		return YES;
	}
**Swift**

	func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    	CrashReporter.sharedInstance().enableLog(true)
    	CrashReporter.sharedInstance().installWithAppId("此处替换为你的AppId")
    	NSObject.performSelector("crash", withObject: nil, afterDelay: 2.0)
    	return true
	}

**请在 log 中查找以下关键字**

- 初始化成功

`<Notice>: <Working>: init sdk ..."}`

- 成功安装异常捕获模块

`<Notice>: <Working>: sdk install signal handler success`

- 成功向服务器发送策略请求

`<Notice>: <Working>: sdk send an request to server`

- 成功捕获异常的输出

`Bugly <INFO>: Catch uncaught exception:`

- 成功持久化异常信息

` Bugly <INFO>: save one crash`

- 成功将异常上报至服务器

`Bugly <INFO>:  CrashUploadHandler SUCC finish crash uploading. with 1 records and 1 crashes`

**如果上述关键步骤 log 都能找到，即可到 Bugly 官网 *崩溃列表* 处查看新上报的异常信息了**


## 高级功能

Bugly 提供了众多功能强大的模块供开发者开启，如

- 符号还原

- 卡顿监测

- 自动上传符号表

- 异常回调..等

#### 关于Bugly更多高级功能的使用，请移步 [Bugly高级功能使用指南](./advanced/ADVANCED.md"Bugly) "高级功能使用指南") 


