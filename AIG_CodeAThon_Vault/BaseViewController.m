//
//  BaseViewController.m
//  AIG_CodeAThon_Vault
//
//  Created by Adam Bella on 2015. 05. 08..
//  Copyright (c) 2015. attrecto. All rights reserved.
//

#import "BaseViewController.h"
#import "KeyChainManager.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)openHub{
    NSString *customURL = @"HUBAIG://";
    
    if ([[UIApplication sharedApplication]
         canOpenURL:[NSURL URLWithString:customURL]])
    {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:customURL]];

    }
    else
    {
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
//                                                        message:@"Unfortunately, the AIG app is unavailable now"
//                                                       delegate:self cancelButtonTitle:@"Ok"
//                                              otherButtonTitles:nil];
//        [alert show];

        [self performSegueWithIdentifier:@"DashboardSegue" sender:self];

    }
}


-(void)checkUserLogedInWithSegueKey:(NSString*)segue{
    
    if((![[KeyChainManager sharedManager] getUserNameFromKeychain] || ![[KeyChainManager sharedManager ]getUserPasswordFromKeychain] || [[KeyChainManager sharedManager ]getUserPasswordFromKeychain] == -1) &&  ![segue isEqualToString:@"OpenedLoginModal"]){
        
        [self performSegueWithIdentifier:segue sender:nil];
        
        
    }else if([[KeyChainManager sharedManager] getUserNameFromKeychain] && [[KeyChainManager sharedManager ]getUserPasswordFromKeychain] && [[KeyChainManager sharedManager ]getUserPasswordFromKeychain] != -1 && ([segue isEqualToString:@"OpenedLoginModal"] || [segue isEqualToString:@"JumpToLoginFromGetStarted"])){
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
}

@end
