//
//  DashboardTableViewCell.h
//  AIG_CodeAThon_Vault
//
//  Created by MAC on 09/05/15.
//  Copyright (c) 2015 attrecto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DashboardTableViewCell : UITableViewCell<UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionview;
@property (nonatomic, strong) NSArray *items;

@end
