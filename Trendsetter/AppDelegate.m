//
//  AppDelegate.m
//  Trendsetter
//
//  Created by William Gu on 11/8/14.
//  Copyright (c) 2014 William Gu. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"
#import "TabBarViewController.h"
#import "TableViewController.h"
#import "MyIdeasViewController.h"
#import "IntroViewController.h"
#import <Parse/Parse.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    [Parse setApplicationId:@"jRr2J6zFk7wSYVNYQGS2FXezhpTR4S7HB20lnW5E"
                  clientKey:@"kAd4pT9I7s03aUh9JiCmUq7ONGXLr3KZTyvL1i4Q"];
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    //TODO:
    //if Device ID is present in database, just login.
    //Otherwise, got to intro page, login w/ new username.
    
    NSString *username = [[NSUserDefaults standardUserDefaults] objectForKey:@"username"];
    
    if (username == nil)
    {
        //go to login
        IntroViewController *introVC = [[IntroViewController alloc] init];
        self.window.rootViewController = introVC;
        self.window.backgroundColor = [UIColor whiteColor];
        [self.window makeKeyAndVisible];
        return YES;

    }
    else
    {

        //go to app!
    }
    
    
    LoginViewController *loginVC = [[LoginViewController alloc] init];
    TableViewController *tableVC = [[TableViewController alloc] init];
    MyIdeasViewController *myVC = [[MyIdeasViewController alloc] init];
    
    loginVC.title = @"Swipe";
    tableVC.title = @"Trending";
    myVC.title = @"Ideas";
    
    UIImage *image1 = [UIImage imageNamed:@"Swipe.png"];
    UIImage *image2 = [UIImage imageNamed:@"Trend.png"];
    UIImage *image3 = [UIImage imageNamed:@"Ideas.png"];
    
    UIImage *image4 = [[UIImage imageNamed:@"Swipe.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *image5 = [[UIImage imageNamed:@"Trend.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *image6 = [[UIImage imageNamed:@"Ideas.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    loginVC.tabBarItem.image = image1;
    tableVC.tabBarItem.image = image2;
    myVC.tabBarItem.image = image3;
    loginVC.tabBarItem.selectedImage = image4;
    tableVC.tabBarItem.selectedImage = image5;
    myVC.tabBarItem.selectedImage = image6;
    
    TabBarViewController *tabBarVC = [[TabBarViewController alloc] init];
    tabBarVC.viewControllers = [NSArray arrayWithObjects:loginVC, tableVC, myVC, nil];
    tabBarVC.username = username;
    
    
    self.window.rootViewController = tabBarVC;
    self.window.backgroundColor = [UIColor whiteColor];
    
    
    [self.window makeKeyAndVisible];
    
    
    return YES;
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
