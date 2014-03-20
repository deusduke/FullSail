//
//  MDFViewController.m
//  MDF2 Project 03
//
//  Created by Deus Duke on 3/19/14.
//  Copyright (c) 2014 DEUS Enterprises. All rights reserved.
//

#import "MDFMainViewController.h"

@interface MDFMainViewController ()

@end

@implementation MDFMainViewController

@synthesize currentTarget;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)getPictureFromCamera:(id)sender
{
    currentTarget = Camera;
    [self showImagePickerForSource:UIImagePickerControllerSourceTypeCamera];
}

- (void)getMovieFromCamera:(id)sender
{
    currentTarget = Movie;
    [self showImagePickerForSource:UIImagePickerControllerSourceTypeCamera];
}

- (void)getPictureImageGallery:(id)sender
{
    currentTarget = PhotoStream;
    [self showImagePickerForSource:UIImagePickerControllerSourceTypePhotoLibrary];
}

- (void)showError:(NSString *)message
{
    // setup alert and show
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"There was an error" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    [alert show];
}

- (void)showImagePickerForSource:(UIImagePickerControllerSourceType )sourceType
{
    // first verify if the target is even available
    switch (sourceType) {
        case UIImagePickerControllerSourceTypeCamera:
            if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                if (currentTarget == Movie) {
                    [self showError:@"This device does not appear to have a camera so we cannot record a movie :("];
                }
                else if (currentTarget == Camera) {
                    [self showError:@"This device does not appear to have a camera so we cannot take a picture :("];
                }
                else {
                    [self showError:@"This device does not appear to have a camera so we cannot continue :("];
                }
                return;
            }
            break;
            
        default:
            break;
    }
    
    // now we can proceed
    UIImagePickerController* picker = [[UIImagePickerController alloc] init];
    if (picker) {
        picker.sourceType = sourceType;
        picker.delegate = self;
        picker.allowsEditing = YES;
        
        [self presentViewController:picker animated:YES completion:nil];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    // log output and dismiss view
    NSLog(@"%@", info.description);
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    NSLog(@"User cancelled image picking");
    
    // be sure to dismiss the view
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
