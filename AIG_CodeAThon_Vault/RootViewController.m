//
//  ViewController.m
//  AIG_CodeAThon_Vault
//
//  Created by Adam Bella on 2015. 05. 08..
//  Copyright (c) 2015. attrecto. All rights reserved.
//

#import "RootViewController.h"
#import "DashboardTableViewCell.h"
#import "KeepItSafeTableViewCell.h"

@interface RootViewController ()
{
    BOOL _startPage;
}
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view, typically from a nib

self.navigationItem.title=@"AIG Vault";

    UIBarButtonItem * itemleft = [[UIBarButtonItem alloc] initWithCustomView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"blue_hader_menuicon.png"]]];
    self.navigationItem.leftBarButtonItem = itemleft;

UIBarButtonItem * itemright = [[UIBarButtonItem alloc] initWithCustomView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"blue_hader_menuicon.png"]]];
    self.navigationItem.rightBarButtonItem = itemright;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [self setNotification];
    _startPage=YES;

}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    if(indexPath.row == 0){
        DashboardTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DashboardTableViewCell"];


        return cell;

    }
        else {
        KeepItSafeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"KeepItSafeTableViewCell"];


        return cell;

    }

//    DashboardTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DashboardTableViewCell"];


//    return cell;

    }


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self heightForBasicCellAtIndexPath:indexPath];
}

- (CGFloat)heightForBasicCellAtIndexPath:(NSIndexPath *)indexPath {


    if(indexPath.row == 0){


        DashboardTableViewCell *cell = [self.tableview dequeueReusableCellWithIdentifier:@"DashboardTableViewCell"];


        return [self calculateHeightForConfiguredSizingCell:cell];

    }
    else{
        KeepItSafeTableViewCell *cell = [self.tableview dequeueReusableCellWithIdentifier:@"KeepItSafeTableViewCell"];

        return [self calculateHeightForConfiguredSizingCell:cell];

    }

//    DashboardTableViewCell *cell = [self.tableview dequeueReusableCellWithIdentifier:@"DashboardTableViewCell"];
//
//
//    return [self calculateHeightForConfiguredSizingCell:cell];


}


- (CGFloat)calculateHeightForConfiguredSizingCell:(UITableViewCell *)sizingCell {
    [sizingCell setNeedsLayout];
    [sizingCell layoutIfNeeded];

    CGSize size = [sizingCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    return size.height + 1.0f; // Add 1.0f for the cell separator height
}



-(void)setNotification{

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didfireDocument:)
                                                 name:@"openDocumentsPageNotification"  object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(showGarage:)
                                                 name:@"showGaragePageNotificaion"  object:nil];


}


-(void)didfireDocument:(NSNotification *)note{
    if(_startPage){
        _startPage = NO;
        [self performSegueWithIdentifier:@"DocumentViewControllerSeque" sender:nil];
    }
}

-(void)showGarage:(NSNotification *)note{
    if(_startPage){
        _startPage = NO;
        [self performSegueWithIdentifier:@"openClaimModal" sender:nil];
    }
}





@end