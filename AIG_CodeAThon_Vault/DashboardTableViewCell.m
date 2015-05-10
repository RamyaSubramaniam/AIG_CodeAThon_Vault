//
//  DashboardTableViewCell.m
//  AIG_CodeAThon_Vault
//
//  Created by MAC on 09/05/15.
//  Copyright (c) 2015 attrecto. All rights reserved.
//

#import "DashboardTableViewCell.h"
#import "DashboardCollectionViewCell.h"

@implementation DashboardTableViewCell

- (void)awakeFromNib {
    self.collectionview.delegate = self;
    self.collectionview.dataSource = self;

//    [self items];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (NSArray *)items {
    if (_items) return _items;


    _items = [[NSMutableArray alloc] initWithArray:@[@"MY DOCUMENTS",@"MY BELONGINGS",@"MY HOME",@"MY GARAGE"]];

    return _items;
}


-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.items count];
}


- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    DashboardCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DashboardCollectionViewCell" forIndexPath:indexPath];


    NSString *item = self.items[indexPath.row];

    cell.cellLabel.text = item;
    cell.cellImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"menu_i%ld",indexPath.row+1]];


    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.row==0) {

        [[NSNotificationCenter defaultCenter] postNotificationName:@"openDocumentsPageNotification" object:self userInfo:nil];

    }
    else if(indexPath.row ==3)
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"openDocumentsPageNotification" object:self userInfo:nil];

    }

}


-(void)reloadCollectionView{
    [self.collectionview reloadData];
}
@end
