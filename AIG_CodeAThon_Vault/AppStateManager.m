//
//  AppStateManager.m
//  B2Match
//
//  Created by Adam Bella on 2015. 02. 11..
//  Copyright (c) 2015 Bella Ádám. All rights reserved.
//

#import "AppStateManager.h"
#import "ViewControllerFactory.h"
#import "UserManager.h"

@interface AppStateManager ()

@property (nonatomic, assign) BOOL stateInTransition;
@property (nonatomic, strong) UIViewController *currentRootViewController;

@end

@implementation AppStateManager

static AppStateManager *_sharedInstance;

+ (instancetype)sharedManager
{
    if (_sharedInstance)
    {
        return _sharedInstance;
    }

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[AppStateManager alloc] init];
    });

    return _sharedInstance;
}


- (ApplicationState)determineAppLaunchState
{
    ApplicationState state = ApplicationStateUnknown;
    NSLog(@"%@",[[UserManager sharedManager] hasCachedLoginInformation] ? @"user" : @"nil");
    if ([[UserManager sharedManager] hasCachedLoginInformation])
    {

        state = ApplicationStateLoggedIn;
    }
    else
    {
        state = ApplicationStateNotLoggedIn;
    }
    NSLog(@"%@",[[UserManager sharedManager] hasCachedLoginInformation]? @"YES" : @"NO");
    return state;
    
}


- (UIViewController*)transitionToState:(ApplicationState)newState animated:(BOOL)animated
{
    if (self.currentState == newState)
    {
        return nil;
    }

    if (self.stateInTransition)
    {
        [self performSelector:@selector(transitionToStateWithStateWrapper:) withObject:@(newState) afterDelay:.2];

        return nil;
    }

    self.stateInTransition=YES;

    UIViewController *newController = [self viewControllerForApplicationState:newState];

    if (newController != self.currentRootViewController )
    {
        if (animated)
        {
            [self.window  insertSubview:newController.view belowSubview:self.window.rootViewController.view];

            [UIView transitionWithView:self.window
                              duration:0.8
                               options:UIViewAnimationOptionTransitionCrossDissolve
                            animations:^{
                                [self.window.rootViewController.view removeFromSuperview];
                            }
                            completion:^(BOOL completed){
                                self.window.rootViewController = newController;
                                self.currentRootViewController = newController;
                                self.stateInTransition = NO;
                            }];
        }
        else
        {
            [self.window insertSubview:newController.view aboveSubview:self.window.rootViewController.view];
            [self.window.rootViewController.view removeFromSuperview];
             self.currentRootViewController = newController;
            self.window.rootViewController = newController;
            self.stateInTransition = NO;
        }
        
        self.currentState = newState;
    }
    else
    {
        self.currentState = newState;
        self.stateInTransition = NO;
    }
    
    return self.window.rootViewController;
}

-(void)setAppState:(ApplicationState)newState withCurrectViewControoler:(UIViewController*)vc{
        [self.window.rootViewController.view removeFromSuperview];
        self.window.rootViewController = vc;
    [self.window insertSubview:vc.view aboveSubview:self.window.rootViewController.view];

    self.currentRootViewController = vc;

    self.stateInTransition = NO;
}

- (void)transitionToStateWithStateWrapper:(NSNumber*)stateWrapper
{
    enum ApplicationState state = [stateWrapper integerValue];

    [self transitionToState:state animated:YES];

    self.stateInTransition = NO;
}


- (UIViewController*)viewControllerForApplicationState:(ApplicationState)appState
{
    UIViewController *vc;

    switch (appState)
    {
        case ApplicationStateNotLoggedIn:
            vc = [[ViewControllerFactory sharedFactory] loginViewController];
            break;

//        case ApplicationStateLoggedIn:
//            vc = [[ViewControllerFactory sharedFactory] mainInstantiateInitialViewController];
//            break;

        case ApplicationStateUnknown:
            vc = [[ViewControllerFactory sharedFactory] loadingViewController];
            break;
    }

    return vc;
}

#pragma mark - Overrides

- (UIWindow *)window
{
    if (_window == nil)
    {
        _window = [[[UIApplication sharedApplication] delegate] window];
    }

    return _window;
}


@end
