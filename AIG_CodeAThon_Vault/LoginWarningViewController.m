//
//  LoginWarningViewController.m
//  AIG_CodeAThon_Vault
//
//  Created by Adam Bella on 2015. 05. 08..
//  Copyright (c) 2015. attrecto. All rights reserved.
//

#import "LoginWarningViewController.h"
#import "KeyChainManager.h"

@interface LoginWarningViewController ()

@end

@implementation LoginWarningViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

    [self checkUserLogedInWithSegueKey:@"OpenedLoginModal"];
}

- (IBAction)tapLoginButton:(id)sender {
    [[KeyChainManager sharedManager] saveLogInRequest];
    [self openHub];
}
@end
