//
//  AppDelegate.m
//  Diary
//
//  Created by PC GUARD on 2016. 6. 29..
//  Copyright © 2016년 mju12345. All rights reserved.
//

#import "AppDelegate.h"
#import "HelperTool.h"
#import "FootprintTool.h"
#import "PedometerTool.h"
#import "UserModel.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //[[HelperTool getInstance] removeDB]; //디비 초기화
    [[HelperTool getInstance] installDB]; //디비 재설치
    [[FootprintTool getInstance] start];
    [[PedometerTool getInstance] start];
    [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:nil];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message)or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    UserModel *modelUser = [[UserModel alloc] init];
    User *user = [modelUser select];
    
    if([user.u_lock isEqualToString:@"Y"]){
        NSLog(@"Lock!");
        UIViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"Lock"];
        self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        self.window.rootViewController = viewController;
        [self.window makeKeyAndVisible];
    } else {
        NSLog(@"Unlock");
    }
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
