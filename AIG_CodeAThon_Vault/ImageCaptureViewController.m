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
