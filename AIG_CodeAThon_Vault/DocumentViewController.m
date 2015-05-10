//
//  DocumentViewController.m
//  AIG_CodeAThon_Vault
//
//  Created by MAC on 09/05/15.
//  Copyright (c) 2015 attrecto. All rights reserved.
//

#import "DocumentViewController.h"
#import "DocumentsTableViewCell.h"

@interface DocumentViewController ()
{
NSMutableArray *claimTypeArray;
NSMutableArray *personNameArray;
NSMutableArray *telNumberArray;
}

@end

@implementation DocumentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.titleView.tintColor=[UIColor blueColor];
    self.navigationItem.title=@"My Documents";

    [self setNotification];

[self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"blue_hader_menuicon.png"] style:UIBarButtonItemStylePlain target:self action:@selector(showImageCapture)] animated:YES];


//    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithCustomView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"blue_hader_menuicon.png"]]];
//    [item setTarget:self];
//    [item setAction:@selector(showImageCapture)];
//
//    self.navigationItem.rightBarButtonItem = item;


    claimTypeArray = [[NSMutableArray alloc] initWithArray:@[@"Auto Coverage Details",@"Auto Disc",@"Driver's license",@"Home Coverage Details",@"Driver's License",@"Auto Claim"]];
    personNameArray = [[NSMutableArray alloc] initWithArray:@[@"John",@"Murphy",@"Elizabeth",@"Licca",@"Jseph",@"lisa"]];
    telNumberArray = [[NSMutableArray alloc] initWithArray:@[@"#988878878",@"#76576768686",@"#7657876866",@"#868768768768",@"#9897997979",@"#78987979797"]];
}

-(void)viewWillAppear:(BOOL)animated{

    _carouselview.hidden=NO;
    _documentsListView.hidden=YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


-(NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    [carousel setType:iCarouselTypeCylinder];
    _images=[[NSMutableArray alloc]initWithObjects:@"circle_1_on.png",@"circle_2_on.png",@"circle_3_on.png",@"circle_4_on.png",@"circle_5_on.png",@"circle_6_on.png",nil];
    return [_images count];
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view
{
    view = [[UIView alloc] init];
    view.contentMode = UIViewContentModeScaleAspectFit;
    CGRect rec = view.frame;
    if(UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPhone)
    {
        rec.size.width = 250;
        rec.size.height = 250;
    }
    view.frame = rec;
    UIImageView *iv;
    if(UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPhone)
    {
        iv=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    }
    NSString *temp=[_images objectAtIndex:index];
    iv.image=[UIImage imageNamed:temp];
    iv.contentMode = UIViewContentModeScaleAspectFit;
    [view addSubview:iv];
    return view;
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"Image is selected.");
}

- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    switch (option)
    {
        case iCarouselOptionWrap:
        {
            return YES;
        }
        default:
        {
            return value;
        }
    }
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (void)listSubviewsOfView:(UIView *)view {

    // Get the subviews of the view
    NSArray *subviews = [view subviews];

    // Return if there are no subviews
    if ([subviews count] == 0) return;

    for (UIView *subview in subviews) {

        NSLog(@"%@", subview);

if(subview.tag ==10)
{
    UIView *viewToRemove = [self.view viewWithTag:10];
    [viewToRemove removeFromSuperview];

    [self.view addSubview:_documentsListView];
}
else if(subview.tag ==11)
{
    UIView *viewToRemove = [self.view viewWithTag:11];
    [viewToRemove removeFromSuperview];

    [self.view addSubview:_carouselview];
}


//        // List the subviews of subview
//        [self listSubviewsOfView:subview];
    }
}


- (IBAction)showDocumentsListView:(id)sender {

//    [self listSubviewsOfView:self.view];

    if (!_carouselview.hidden) {
        _carouselview.hidden=YES;
        _documentsListView.hidden=NO;
    }
    else{
        _carouselview.hidden=NO;
        _documentsListView.hidden=YES;
    }

}



-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [claimTypeArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{


        DocumentsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DocumentsTableViewCell"];
    
    NSString *item = claimTypeArray[indexPath.row];
    NSString *person = personNameArray[indexPath.row];

    NSString *tel = telNumberArray[indexPath.row];


    cell.claimtype.text = item;
    cell.personLabel.text=person;
    cell.telNumberLabel.text=tel;
//    cell.cellImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"menu_i%ld",indexPath.row+1]];


        return cell;

}

-(void)showImageCapture{

    [self performSegueWithIdentifier:@"ImageCaptureViewControllerSegue" sender:self];

}

-(void)setNotification{

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didfireAddDocument:)
                                                 name:@"openDocumentsAddedAutoViewNotification"  object:nil];

    
}
-(void)didfireAddDocument:(NSNotification *)note{

        [self performSegueWithIdentifier:@"documentsAddedViewControllerSegue" sender:nil];
    
}

@end
