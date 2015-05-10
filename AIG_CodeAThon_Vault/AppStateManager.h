//
//  AppStateManager.h
//  B2Match
//
//  Created by Adam Bella on 2015. 02. 11..
//  Copyright (c) 2015 Bella Ádám. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ApplicationState)
{
    ApplicationStateUnknown,
    ApplicationStateNotLoggedIn,
    ApplicationStateLoggedIn
};

@interface AppStateManager : NSObject

@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, assign) ApplicationState currentState;

+ (instancetype)sharedManager;

- (ApplicationState)determineAppLaunchState;
- (UIViewController*)transitionToState:(ApplicationState)newState animated:(BOOL)animated;
- (void)setAppState:(ApplicationState)newState withCurrectViewControoler:(UIViewController*)vc;

@end
