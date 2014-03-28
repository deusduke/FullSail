//
//  MDFMovieViewController.h
//  MDF2 Project 04
//
//  Created by Deus Duke on 3/26/14.
//  Copyright (c) 2014 DEUS Enterprises. All rights reserved.
//

#import <MediaPlayer/MediaPlayer.h>
#import <UIKit/UIKit.h>
#import "MDFMovieInfo.h"

@interface MDFMovieViewController : UIViewController

@property (nonatomic) MPMoviePlayerController* moviePlayer;
@property (nonatomic) MDFMovieInfo* movieInfo;

@property (weak, nonatomic) IBOutlet UIView* movieView;

- (IBAction)playButtonClicked:(id)sender;
- (IBAction)stopButtonClicked:(id)sender;

@end
