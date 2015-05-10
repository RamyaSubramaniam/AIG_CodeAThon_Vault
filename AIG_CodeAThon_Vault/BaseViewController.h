//
//  BaseViewController.h
//  AIG_CodeAThon_Vault
//
//  Created by Adam Bella on 2015. 05. 08..
//  Copyright (c) 2015. attrecto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

-(void)openHub;
-(void)checkUserLogedInWithSegueKey:(NSString*)segue;

@end
