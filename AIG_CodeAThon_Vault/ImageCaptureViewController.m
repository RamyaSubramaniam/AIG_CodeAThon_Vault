//
//  ImageCaptureViewController.m
//  AIG_CodeAThon_Vault
//
//  Created by MAC on 10/05/15.
//  Copyright (c) 2015 attrecto. All rights reserved.
//

#import "ImageCaptureViewController.h"

@interface ImageCaptureViewController ()<UIImagePickerControllerDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ImageCaptureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController setNavigationBarHidden:YES];


    UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"" message:@"Lay the document on a dark flat surface in a well lit area.\nPosition the document in the brackets and capture the image  " delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    alertview.tag=100;

    [alertview show];
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

-(IBAction)openCamera
{

    [[NSNotificationCenter defaultCenter] postNotificationName:@"openDocumentsAddedAutoViewNotification" object:self userInfo:nil];
    [self dismissViewControllerAnimated:YES completion:nil];


//    [self.navigationController performSegueWithIdentifier:@"documentsAddedViewControllerSegue" sender:self];



}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;
{

    if( alertView.tag==100){

        [self showCamera];
    }
}


-(void)showCamera{


    @try
    {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        picker.delegate = self;



        [self presentModalViewController:picker animated:YES];
    }
    @catch (NSException *exception)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No Camera" message:@"Camera is not available  " delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }
}

-(void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary*)info
{
    [picker dismissModalViewControllerAnimated:YES];
    self.imageView.image=[info objectForKey:@"UIImagePickerControllerOriginalImage"];
}

@end
