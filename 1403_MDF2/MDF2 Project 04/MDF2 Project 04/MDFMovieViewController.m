//
//  MDFMovieViewController.m
//  MDF2 Project 04
//
//  Created by Deus Duke on 3/26/14.
//  Copyright (c) 2014 DEUS Enterprises. All rights reserved.
//

#import <MediaPlayer/MediaPlayer.h>
#import "MDFMovieViewController.h"

@interface MDFMovieViewController ()

@end

@implementation MDFMovieViewController

@synthesize movieInfo, movieView, moviePlayer;

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
    
    // get the file path from the end of the name
    NSString* ext = [movieInfo.trailerUrl substringWithRange:NSMakeRange(movieInfo.trailerUrl.length - 3, 3)];
    NSString* movieName = [movieInfo.trailerUrl substringToIndex:movieInfo.trailerUrl.length - 4];
    NSString* filePath = [[NSBundle mainBundle] pathForResource:movieName ofType: ext];
    NSURL* url = [NSURL fileURLWithPath:filePath];
    moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:url];
    
    if (moviePlayer != nil) {
        // load the trailer and turn off full screen
        moviePlayer.view.frame =  CGRectMake(0.0f, 0.0f,movieView.frame.size.width, movieView.frame.size.height);
        moviePlayer.fullscreen = false;
        moviePlayer.repeatMode = MPMovieRepeatModeOne;
        moviePlayer.controlStyle = MPMovieControlStyleNone;
        
        [movieView addSubview: moviePlayer.view];
    }
}

- (void)playButtonClicked:(id)sender
{
    [moviePlayer play];
}

- (void)stopButtonClicked:(id)sender
{
    [moviePlayer stop];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
