//
//  ViewController.m
//  BlurImageEditor
//
//  Created by Md. Sarowar Faruk on 6/16/16.
//  Copyright © 2016 Md. Sarowar Faruk. All rights reserved.
//

#import "ViewController.h"
#import "CropViewController.h"
#import "TOCropViewController.h"

@interface ViewController ()<TOCropViewControllerDelegate>
{
    UIImagePickerController *picker;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // create circular imageview
    self.proffileImageViewHeightConstant.constant =self.view.frame.size.height/2;
    self.profileImageViewWidthConstant.constant=self.view.frame.size.width/2;
    self.imageView.layer.cornerRadius = self.imageView.layer.frame.size.height/2;
    self.imageView.layer.cornerRadius = self.imageView.layer.frame.size.width/2;
    self.imageView.clipsToBounds = YES;
    self.imageView.layer.masksToBounds = YES;
    self.imageView.layer.borderWidth = 1.00f;
    self.imageView.layer.borderColor = [UIColor whiteColor].CGColor;

    picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    
    [self changeConstantRespectWithIphone];
    
}

-(void) changeConstantRespectWithIphone
{


}


-(IBAction)cameraButtonPress:(id)sender{
    
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self presentViewController:picker animated:YES completion:nil];
}


-(IBAction)libraryButtonPress:(id)sender{
    
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:nil];
}


-(void)imagePickerController:(UIImagePickerController *)picker_2 didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *chosenImageFromLibrary = info[UIImagePickerControllerEditedImage];
    self.imageView.image = chosenImageFromLibrary;
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    TOCropViewController *cropViewController = [[TOCropViewController alloc] initWithImage:chosenImageFromLibrary];
    cropViewController.delegate = self;
    [self presentViewController:cropViewController animated:YES completion:nil];
    
}

# pragma mark -ToCropViewControllerDelegateMethod-

-(void)cropViewController:(TOCropViewController *)cropViewController didCropToImage:(UIImage *)image withRect:(CGRect)cropRect angle:(NSInteger)angle
{
    [self dismissViewControllerAnimated:YES completion:nil];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    CropViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"cropview"];
    vc.image = image;
    [self.navigationController pushViewController:vc animated:YES];
}


-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker_2
{
    [picker_2 dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
