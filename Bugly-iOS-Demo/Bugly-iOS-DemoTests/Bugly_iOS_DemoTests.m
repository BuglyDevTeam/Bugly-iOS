//
//  Bugly_iOS_DemoTests.m
//  Bugly-iOS-DemoTests
//
//  Created by Ben Xu on 15/6/30.
//  Copyright (c) 2015年 tencent.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

@interface Bugly_iOS_DemoTests : XCTestCase

@end

@implementation Bugly_iOS_DemoTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
