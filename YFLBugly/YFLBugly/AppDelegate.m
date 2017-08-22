//
//  AppDelegate.m
//  YFLBugly
//
//  Created by 杨丰林 on 2017/8/22.
//  Copyright © 2017年 杨丰林. All rights reserved.
//

#import "AppDelegate.h"
#import <Bugly/Bugly.h>
#define BUGLY_APP_ID @"f7e4f47c0c"

@interface AppDelegate ()<BuglyDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //为什么狗屁文档那么难看懂啊
    
    [self initBugly];
    
    return YES;
}

-(void)initBugly{
    // Get the default config
    BuglyConfig * config = [[BuglyConfig alloc] init];
    
    //SDK Debug信息开关, 默认关闭
    config.debugMode = YES;
    //卡顿监控开关，默认关闭
    config.blockMonitorEnable = YES;
    
    //卡顿监控判断间隔，单位为秒
    config.blockMonitorTimeout = 1.5;
    
    config.delegate = self;
    
    //控制台日志上报开关，默认开启
    config.consolelogEnable = NO;
    
    //页面信息记录开关，默认开启
    config.viewControllerTrackingEnable = YES;
    
#if DEBUG
    // 设置自定义渠道标识  开发环境
    config.channel = @"Development";
    [Bugly startWithAppId:BUGLY_APP_ID developmentDevice:YES config:config];

#else
    // 设置自定义渠道标识  线上环境
    config.channel = @"Product";
    [Bugly startWithAppId:BUGLY_APP_ID developmentDevice:NO config:config];

#endif

    
    [Bugly setUserIdentifier:[NSString stringWithFormat:@"User: %@", [UIDevice currentDevice].name]];

    [Bugly setUserValue:[NSProcessInfo processInfo].processName forKey:@"Process"];
    
    //[self performSelectorInBackground:@selector(testLogOnBackground) withObject:nil];
}

/**
 *    @brief TEST method for BuglyLog
 */
//- (void)testLogOnBackground {
//    int cnt = 0;
//    while (1) {
//        cnt++;
//        
//        switch (cnt % 5) {
//            case 0:
//                BLYLogError(@"Test Log Print %d", cnt);
//                break;
//            case 4:
//                BLYLogWarn(@"Test Log Print %d", cnt);
//                break;
//            case 3:
//                BLYLogInfo(@"Test Log Print %d", cnt);
//                BLYLogv(BuglyLogLevelWarn, @"BLLogv: Test", NULL);
//                break;
//            case 2:
//                BLYLogDebug(@"Test Log Print %d", cnt);
//                BLYLog(BuglyLogLevelError, @"BLLog : %@", @"Test BLLog");
//                break;
//            case 1:
//            default:
//                BLYLogVerbose(@"Test Log Print %d", cnt);
//                break;
//        }
//        
//        // print log interval 1 sec.
//        sleep(1);
//    }
//}

#pragma mark - BuglyDelegate
- (NSString *)attachmentForException:(NSException *)exception {
    NSLog(@"(%@:%d) %s %@",[[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, __PRETTY_FUNCTION__,exception);
    return @"This is an attachment";
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
