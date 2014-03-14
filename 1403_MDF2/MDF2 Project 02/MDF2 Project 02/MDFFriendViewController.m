//
//  MDFFriendViewController.m
//  MDF2 Project 02
//
//  Created by Deus Duke on 3/10/14.
//  Copyright (c) 2014 DEUS Enterprises. All rights reserved.
//

#import "MDFFriendViewController.h"

@interface MDFFriendViewController ()

@end

@implementation MDFFriendViewController

@synthesize followerInfo, usernameLabel, profileImage;

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
    
    if (followerInfo) {
        usernameLabel.text = followerInfo.userName;
        profileImage.image = [UIImage imageNamed:@"twitter_bird.png"];
        profileImage.imageURL = followerInfo.imageURL;
        
        NSLog(@"Got user: %@", followerInfo.userName);
    }
}

- (void)doneButtonClicked:(id)sender
{
    // back to where we came from
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
