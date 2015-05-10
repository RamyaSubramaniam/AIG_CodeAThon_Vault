//
//  AppDelegate.m
//  AIG_CodeAThon_Vault
//
//  Created by Adam Bella on 2015. 05. 08..
//  Copyright (c) 2015. attrecto. All rights reserved.
//

#import "AppDelegate.h"
#import "KeyChainManager.h"
#import  <Parse/Parse.h>
#import "ViewControllerFactory.h"
#import "RootViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [Parse setApplicationId:@"EUmaEhQ1LBMzbwT3odzenI8UQbEEfgeRS6PjALWx" clientKey:@"jAbxsvYC5IpWCSkJZlMAu94yJszmeiU5CSVovGTR"];
    
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
    if([[KeyChainManager sharedManager] getLoggedInState] == 1){
        [[KeyChainManager sharedManager ] removeLoggedInState];
        AppDelegate *tmpDelegate = [[UIApplication sharedApplication] delegate];



        UINavigationController * nc = [[[[[[tmpDelegate window] rootViewController] childViewControllers] objectAtIndex:1] childViewControllers] firstObject];

        BOOL found = false;

        for(UIViewController *vc in [nc childViewControllers]){
            if(![vc isKindOfClass:[RootViewController class]]){
                [vc removeFromParentViewController];
            }else{
                found = YES;
            }
        }

        if(!found){
            RootViewController *vc = [[[[ViewControllerFactory sharedFactory] mainStreamNavigationController] childViewControllers] firstObject];

            [nc pushViewController:vc animated:NO];
            
        }
        else
        {

        [[[[[tmpDelegate window] rootViewController] childViewControllers] firstObject] viewWillAppear:YES];
        }

    }


}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
