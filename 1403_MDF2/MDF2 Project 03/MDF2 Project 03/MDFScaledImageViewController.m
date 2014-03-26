//
//  MDFScaledImageViewController.m
//  MDF2 Project 03
//
//  Created by Deus Duke on 3/20/14.
//  Copyright (c) 2014 DEUS Enterprises. All rights reserved.
//

#import "MDFScaledImageViewController.h"

@interface MDFScaledImageViewController ()

@end

@implementation MDFScaledImageViewController

@synthesize modifiedImage, originalImage, modifiedImageView, originalImageView;

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
    
    // initialize the images
    modifiedImageView.image = modifiedImage;
    originalImageView.image = originalImage;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)cancelClicked:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)saveClicked:(id)sender
{
    // save the images
    UIImageWriteToSavedPhotosAlbum(originalImage, self, nil, nil);
    UIImageWriteToSavedPhotosAlbum(modifiedImage, self, nil, nil);
    
    // notify of save
    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Image Save!" message:@"You image was successfully saved!" delegate:self cancelButtonTitle:@"Thanks" otherButtonTitles:nil];
    
    [alertView show];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
