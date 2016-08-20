//
//  AppDelegate.m
//  SDProgressHUD Demo
//
//  Created by 许树铎 on 16/8/20.
//  Copyright © 2016年 XuShuduo. All rights reserved.
//

#import "AppDelegate.h"
#import "DemoViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window setRootViewController:[[UINavigationController alloc] initWithRootViewController:[[DemoViewController alloc] init]]];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
