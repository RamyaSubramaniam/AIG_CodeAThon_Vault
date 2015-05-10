//
//  ViewController.m
//  AIG_CodeAThon_Vault
//
//  Created by Adam Bella on 2015. 05. 08..
//  Copyright (c) 2015. attrecto. All rights reserved.
//

#import "SplashViewController.h"
#import "ParseManager.h"
#import "KeyChainManager.h"

@interface SplashViewController ()
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;

@end

@implementation SplashViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self checkUserLogedInWithSegueKey:@"JumpToLoginFromGetStarted"];
}


- (IBAction)tapBackHub:(id)sender {
    [self openHub];
}

- (IBAction)tapParseQuery:(id)sender {
        // It is just a template, please delete this action!!
    NSString *userName = [[KeyChainManager sharedManager] getUserNameFromKeychain];
    NSInteger password = [[KeyChainManager sharedManager] getUserPasswordFromKeychain];
    
        [[ParseManager sharedInstance] customerOrNilWithEmailAddress:userName andPassword:[NSNumber numberWithInteger:password ] withCallback:^{
            
        }];
}

@end
