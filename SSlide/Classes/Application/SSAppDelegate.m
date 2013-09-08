//
//  SSAppDelegate.m
//  SSlide
//
//  Created by iNghia on 8/21/13.
//  Copyright (c) 2013 S2. All rights reserved.
//

#import "SSAppDelegate.h"
#import "SSAppData.h"

@implementation SSAppDelegate

#pragma mark - UIApplicationDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // load data
    [SSAppData sharedInstance];
    // init window
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    if (IS_IPAD) {
        self.window.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bgipad.png"]];
    } else if (IS_IPHONE_5) {
        self.window.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bgip5.png"]];
    } else {
        self.window.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]];
    }
    // create root view controller
    self.rootViewController = [[SSRootViewController alloc] init];
    self.window.rootViewController = self.rootViewController;
    // make visible
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    [SSAppData saveAppData];
}

@end
