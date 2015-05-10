//
//  DocumentsTableViewCell.h
//  AIG_CodeAThon_Vault
//
//  Created by MAC on 09/05/15.
//  Copyright (c) 2015 attrecto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DocumentsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *documentImageView;
@property (weak, nonatomic) IBOutlet UILabel *personLabel;
@property (weak, nonatomic) IBOutlet UILabel *telNumberLabel;

@property (weak, nonatomic) IBOutlet UILabel *claimtype;


@end
