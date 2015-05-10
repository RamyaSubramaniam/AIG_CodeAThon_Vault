//
//  ViewControllerFactory.h
//  B2Match
//
//  Created by Adam Bella on 2015. 02. 11..
//  Copyright (c) 2015 Bella Ádám. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"


@interface ViewControllerFactory : NSObject

+ (instancetype)sharedFactory;

@property (nonatomic, strong) UIStoryboard *loginStoryboard;
@property (nonatomic, strong) UIStoryboard *mainStoryboard;


@property (nonatomic, readonly, strong) UINavigationController *loginNavigationController;
@property (nonatomic, readonly, strong) UIViewController *loginViewController;
@property (nonatomic, readonly, strong) UIViewController *loadingViewController;
@property (nonatomic, readonly, strong) UINavigationController *mainStreamNavigationController;

/// Show progress hud.
+ (MBProgressHUD *)showIndeterminateLoadingView;
/// Hide progress hud.
+ (void)hideLoadingView;

@end
