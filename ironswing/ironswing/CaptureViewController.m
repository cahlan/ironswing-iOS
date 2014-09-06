//
//  CaptureViewController.m
//  ironswing
//
//  Created by Cahlan Sharp on 9/5/14.
//  Copyright (c) 2014 Ryan Allred. All rights reserved.
//

#import "CaptureViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>

// goes above interface and implementation

typedef NS_ENUM(NSInteger, ActionSheetButton){
    ActionSheetFromLibrary,
    ActionSheetTakePicture
};

@interface CaptureViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *profileView;
@property (weak, nonatomic) IBOutlet UIImageView *frontView;
@property (weak, nonatomic) IBOutlet UIButton *recordButton;



@end

@implementation CaptureViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// this is the code to present the action sheet

- (IBAction)recordButtonTapped:(id)sender {
    
    UIActionSheet *videoActionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"From Camera Roll", @"Take Video", nil];
    
    [videoActionSheet showInView:self.view];
}


- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    ActionSheetButton button = buttonIndex;
    
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    
    NSLog(@"%ld", (long)buttonIndex);
    
    switch (button) {
            
        case ActionSheetFromLibrary:{
            imagePicker.sourceType =  UIImagePickerControllerSourceTypePhotoLibrary;
            [self presentViewController:imagePicker animated:YES completion:nil];
            break;
        }
            
        case ActionSheetTakePicture:{
            if ([UIImagePickerController isSourceTypeAvailable:
                 UIImagePickerControllerSourceTypeCamera] == YES){
                
                imagePicker.sourceType =  UIImagePickerControllerSourceTypeCamera;
                imagePicker.cameraDevice = UIImagePickerControllerCameraDeviceRear;
                imagePicker.allowsEditing = YES;
                
                imagePicker.mediaTypes = [NSArray arrayWithObject:(NSString *)kUTTypeMovie];
                
                imagePicker.videoQuality = UIImagePickerControllerQualityTypeMedium;
                imagePicker.videoMaximumDuration = 6;
                
                [self presentViewController:imagePicker animated:YES completion:nil];
                
            } else{
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Camera Not Available on Device" message:@"This device does not have a camera option. Please choose Photo Library" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
                [alert show];
            }
            break;
        }
    }
    [self.profileView removeFromSuperview];
}



- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    // Access the uncropped image from info dictionary
    UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    
    // Dismiss controller
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    // Set Avatar Image
    [self.profileView setImage:image];
    
    // Upload image
    NSData *imageData = UIImageJPEGRepresentation(image, 0.05f);
    [self uploadImage:imageData];
    
}

@end
