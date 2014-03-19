//
//  MDFViewController.h
//  MDF2 Project 03
//
//  Created by Deus Duke on 3/19/14.
//  Copyright (c) 2014 DEUS Enterprises. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MDFMainViewController : UIViewController

{
    enum PictureTarget {Camera, Movie, PhotoStream};
}

@property (nonatomic) enum PictureTarget currentTarget;

- (IBAction)getPictureFromCamera:(id)sender;
- (IBAction)getMovieFromCamera:(id)sender;
- (IBAction)getPictureImageGallery:(id)sender;

- (void)showError:(NSString*)message;
- (void)showImagePickerForSource:(UIImagePickerControllerSourceType)sourceType;

@end
