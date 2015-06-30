//
//  ViewController.m
//  Bugly-iOS-Demo
//
//  Created by Ben Xu on 15/6/30.
//  Copyright (c) 2015年 tencent.com. All rights reserved.
//

#import "ViewController.h"
#import <sys/sysctl.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *warningLabel;
@property (weak, nonatomic) IBOutlet UIButton *testCrashButton;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;

@end

@implementation ViewController

- (NSAttributedString *)warningString {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:@"当前处于 Xcode调试状态！\n请断开调试模式再次启动后触发测试崩溃\n\n "];
    NSTextAttachment *textAttachment = [[NSTextAttachment alloc] init];
    textAttachment.image = [UIImage imageNamed:@"BuglyDemoImage"];
    NSAttributedString *attrStringWithImage = [NSAttributedString attributedStringWithAttachment:textAttachment];
    [attributedString replaceCharactersInRange:NSMakeRange(attributedString.length - 1, 1) withAttributedString:attrStringWithImage];
    
    return [[NSAttributedString alloc] initWithAttributedString:attributedString];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    BOOL isDebug = debugger_should_exit();
    if (isDebug) {
        self.warningLabel.attributedText = [self warningString];
    }
    self.warningLabel.hidden = !isDebug;
    self.testCrashButton.enabled = !isDebug;
    self.infoLabel.attributedText = [[NSAttributedString alloc] initWithString:@"当点击 Crash 按钮后，App 将会崩溃\n崩溃后请到 http://bugly.qq.com 查看上报数据"];
}

- (IBAction)testCrash:(UIButton *)sender {
    NSLog(@"%@",@[][1]);
}

static bool debugger_should_exit (void) {
#if !TARGET_OS_IPHONE
    return false;
#endif
    
    struct kinfo_proc info;
    size_t info_size = sizeof(info);
    int name[4];
    
    name[0] = CTL_KERN;
    name[1] = KERN_PROC;
    name[2] = KERN_PROC_PID;
    name[3] = getpid();
    
    if (sysctl(name, 4, &info, &info_size, NULL, 0) == -1) {
        NSLog(@"sysctl() failed: %s", strerror(errno));
        return false;
    }
    
    if ((info.kp_proc.p_flag & P_TRACED) != 0)
        return true;
    
    return false;
}


@end
