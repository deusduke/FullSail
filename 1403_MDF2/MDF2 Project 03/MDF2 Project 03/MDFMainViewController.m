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
    // make sure we can use the camera, otherwise show the error message
    [self showImagePickerForSource:UIImagePickerControllerSourceTypeCamera];
}

- (void)getMovieFromCamera:(id)sender
{
    [self showImagePickerForSource:UIImagePickerControllerSourceTypeCamera];
}

- (void)getPictureImageGallery:(id)sender
{
    
}

- (void)showError:(NSString *)message
{
    
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
