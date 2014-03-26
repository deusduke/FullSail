//
//  MDFScaledImageViewController.h
//  MDF2 Project 03
//
//  Created by Deus Duke on 3/20/14.
//  Copyright (c) 2014 DEUS Enterprises. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MDFScaledImageViewController : UIViewController

@property (strong, nonatomic) UIImage* originalImage;
@property (strong, nonatomic) UIImage* modifiedImage;
@property (weak, nonatomic) IBOutlet UIImageView* originalImageView;
@property (weak, nonatomic) IBOutlet UIImageView* modifiedImageView;

- (IBAction)saveClicked:(id)sender;
- (IBAction)cancelClicked:(id)sender;

@end
