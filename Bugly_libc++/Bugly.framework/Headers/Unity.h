//
//  BuglyUnity.h
//  unity3d
//
//  Created by ronniefeng on 14/11/5.
//  Copyright (c) 2014年 Tencent. All rights reserved.
//

//#ifdef UNITY_PLUGIN

#pragma mark - Interfaces for Unity

#ifdef __cplusplus
extern "C" {
#endif

extern void __enableLog(bool enable);

extern void __init(const char *appId);

extern void __setUserId(const char *userid);

extern void __setChannel(const char *channel);

extern void __setBundleVersion(const char *version);

extern void __enableCrashMergeUploadAndSymbolicateInProcess(bool isMerge, bool enable);

extern void __setUserData(const char *key, const char *value);

extern void __reportException(const char *errorClass, const char *errorMessage, const char *stackTrace);

extern void __setCrashUploadCallback(const char *observer, const char *callback);

extern void __setCrashHappenCallback(const char *observer, const char *callback);

extern void __setBundleId(const char *bundleId);
    
extern void __setDeviceId(const char *deviceId);

extern void __setCrashAutoThrow(bool autoThrow);
    
#ifdef __cplusplus
}
#endif

#pragma mark - Unity.h

@interface Unity : NSObject

@property (nonatomic, assign) BOOL crashAutoThrow;

+ (Unity *)sharedInstance;

- (void)initSDK:(NSString *)appId;

- (void)addCallback:(NSString *)callbackName forObject:(NSString *)objectName withKey:(NSString *)callbackKey;
- (NSArray *)callbackForKey:(NSString *)key;

@end

//#endif