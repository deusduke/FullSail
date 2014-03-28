//
//  MDFMovieDetailsViewController.h
//  MDF2 Project 04
//
//  Created by Deus Duke on 3/26/14.
//  Copyright (c) 2014 DEUS Enterprises. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MDFMovieInfo.h"

@interface MDFMovieDetailsViewController : UIViewController

@property (nonatomic) MDFMovieInfo* movieInfo;
@property (weak, nonatomic) IBOutlet UILabel* movieTitle;
@property (weak, nonatomic) IBOutlet UIImageView* movieImage;

@end
