//
//  ViewController.h
//  BlurImageEditor
//
//  Created by Md. Sarowar Faruk on 6/16/16.
//  Copyright © 2016 Md. Sarowar Faruk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *proffileImageViewHeightConstant;

//@property (strong,nonatomic) UIImage *image;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *profileImageViewWidthConstant;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *libraryButton;
@property (weak, nonatomic) IBOutlet UIButton *cameraButton;
-(IBAction)cameraButtonPress:(id)sender;
-(IBAction)libraryButtonPress:(id)sender;
@end

