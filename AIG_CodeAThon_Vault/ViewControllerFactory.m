//
//  ViewControllerFactory.m
//  B2Match
//
//  Created by Adam Bella on 2015. 02. 11..
//  Copyright (c) 2015 Bella Ádám. All rights reserved.//

#import "ViewControllerFactory.h"

@implementation ViewControllerFactory

@synthesize loginNavigationController = _loginNavigationController;
@synthesize loginViewController = _loginViewController;
@synthesize loadingViewController = _loadingViewController;
@synthesize mainStreamNavigationController = _mainStreamNavigationController;

#pragma mark - Class Methods

static ViewControllerFactory *_sharedInstance;

+ (instancetype)sharedFactory
{
    if (_sharedInstance)
    {
        return _sharedInstance;
    }

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[ViewControllerFactory alloc] init];
    });

    return _sharedInstance;
}

#pragma mark - Overrides

- (UIStoryboard *)loginStoryboard
{
    if (_loginStoryboard == nil)
    {
        _loginStoryboard = [UIStoryboard storyboardWithName:@"Login" bundle:nil];
    }

    return _loginStoryboard;
}

- (UIStoryboard *)mainStoryboard
{
    if (_mainStoryboard == nil)
    {
        _mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    }
    
    return _mainStoryboard;
}


- (UINavigationController *)loginNavigationController
{
    if (_loginNavigationController == nil)
    {
        _loginNavigationController = [self.loginStoryboard instantiateViewControllerWithIdentifier:@"LoginNavigationController"];
    }

    return _loginNavigationController;
}


-(UINavigationController *)mainStreamNavigationController{
    
        return [self.mainStoryboard instantiateViewControllerWithIdentifier:@"MainStreamNavigationController"];
}




- (UIViewController *)loginViewController
{
    if (_loginViewController == nil)
        {
        _loginViewController = [self.loginStoryboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
        }

    return _loginViewController;
}


- (UIViewController *)loadingViewController
{
    if (_loadingViewController == nil)
    {
        _loadingViewController = [self.loginStoryboard instantiateViewControllerWithIdentifier:@"LoadingViewController"];
    }

    return _loadingViewController;
}




#pragma mark - Progress HUD

+ (const MBProgressHUD *)showIndeterminateLoadingView
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;

    if (window)
    {
        const MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:window animated:YES];
        hud.mode = MBProgressHUDModeIndeterminate;
        return hud;
    }

    return nil;
}

+ (void)hideLoadingView
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;

    if (window)
    {
        [MBProgressHUD hideAllHUDsForView:window animated:YES];
    }
}


@end
