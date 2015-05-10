//
//  DocumentViewController.h
//  AIG_CodeAThon_Vault
//
//  Created by MAC on 09/05/15.
//  Copyright (c) 2015 attrecto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel.h"

@interface DocumentViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *documentsListView;
@property (weak, nonatomic) IBOutlet iCarousel *carouselview;
@property(nonatomic,strong)NSMutableArray *images;
- (IBAction)showDocumentsListView:(id)sender;
-(void)showImageCapture;
@end
