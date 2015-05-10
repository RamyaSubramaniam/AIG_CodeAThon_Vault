//
//  ViewController.h
//  AIG_CodeAThon_Vault
//
//  Created by Adam Bella on 2015. 05. 08..
//  Copyright (c) 2015. attrecto. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface RootViewController : UIViewController<UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableview;

@end

