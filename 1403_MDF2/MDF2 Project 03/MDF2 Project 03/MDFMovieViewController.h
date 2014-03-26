//
//  MDFMovieViewController.h
//  MDF2 Project 03
//
//  Created by Deus Duke on 3/20/14.
//  Copyright (c) 2014 DEUS Enterprises. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MDFMovieViewController : UIViewController

@property (strong, nonatomic) NSURL* movieURL;

- (IBAction)saveClicked:(id)sender;
- (IBAction)cancelClicked:(id)sender;

@end
