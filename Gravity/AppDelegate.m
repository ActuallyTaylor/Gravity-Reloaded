//
//  AppDelegate.m
//  Gravity
//
//  Created by Ryan McLeod on 9/22/15.
//  Copyright © 2015 Ryan McLeod. All rights reserved.
//

#import "AppDelegate.h"
#import <Fabric/Fabric.h>
#import <Crashlytics/Crashlytics.h>
#import "Constants.h"
#import "iRate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    // User Defaults
    NSDictionary *userDefaultsDefaults = [NSDictionary dictionaryWithObjectsAndKeys:
                                          [NSNumber numberWithBool:NO], Gravity_InstructionsCompleted,
                                          [NSNumber numberWithInt:NSMassFormatterUnitGram], Gravity_DefaultMassDisplayUnits,
                                          nil];
    [[NSUserDefaults standardUserDefaults] registerDefaults:userDefaultsDefaults];
    
    // TODO: Is this actually doing anything
    [[UIWindow appearance] setTintColor:[UIColor gravityPurpleDark]];
    [[UIView appearance] setTintColor:[UIColor gravityPurpleDark]];

    // Fabric
    [Fabric with:@[[Crashlytics class]]];
    
    [iRate sharedInstance].appStoreID = 1042373594;
    [iRate sharedInstance].applicationName = @"Gravity";
    [iRate sharedInstance].daysUntilPrompt = 3;
    [iRate sharedInstance].usesUntilPrompt = 9000;//15;
    [iRate sharedInstance].eventsUntilPrompt = 1; // 1+ calibration
    [iRate sharedInstance].remindPeriod = 3;
    
    [iRate sharedInstance].promptAtLaunch = NO;
    
    #ifdef DEBUG
//    [iRate sharedInstance].previewMode = YES;
    #endif

    
    // Useful for debugging
    application.applicationSupportsShakeToEdit = YES;

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    [[NSUserDefaults standardUserDefaults] synchronize];
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
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
