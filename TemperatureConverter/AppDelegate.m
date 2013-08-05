//
//  AppDelegate.m
//  TemperatureConverter
//
//  Created by Rakesh Sharma on 8/5/13.
//  Copyright (c) 2013 Yahoo. All rights reserved.
//

#import "AppDelegate.h"
#import "TempConverterViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    TempConverterViewController *tempViewController = [[TempConverterViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:tempViewController];
    self.window.rootViewController = navigationController;
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
