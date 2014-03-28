//
//  MDFMovieDetailsViewController.m
//  MDF2 Project 04
//
//  Created by Deus Duke on 3/26/14.
//  Copyright (c) 2014 DEUS Enterprises. All rights reserved.
//

#import "MDFMovieDetailsViewController.h"
#import "MDFMovieViewController.h"

@interface MDFMovieDetailsViewController ()

@end

@implementation MDFMovieDetailsViewController

@synthesize movieInfo, movieImage, movieTitle;

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
    
    movieTitle.text = movieInfo.name;
    movieImage.image = [UIImage imageNamed:movieInfo.image];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // pass the movie info along
    MDFMovieViewController* mc = (MDFMovieViewController*) segue.destinationViewController;
    mc.movieInfo = movieInfo;
}


@end
