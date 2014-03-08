//
//  MDFTweetDetailViewController.m
//  MDF Project 01
//
//  Created by Deus Duke on 3/7/14.
//  Copyright (c) 2014 DEUS Enterprises. All rights reserved.
//

#import "MDFTweetDetailViewController.h"

@interface MDFTweetDetailViewController ()

@end

@implementation MDFTweetDetailViewController
@synthesize profileImageView, userNameLabel, dateLabel, tweetTextView, twitterData;

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
    
    NSDictionary* user = [twitterData objectForKey:@"user"];
    NSString* url = [user objectForKey:@"profile_image_url"];

    if (url != nil)
        profileImageView.imageURL = [NSURL URLWithString:url];;
        
    userNameLabel.text = [twitterData objectForKey:@"name"];
    dateLabel.text = [twitterData objectForKey:@"created_at"];
    tweetTextView.text = [twitterData objectForKey:@"text"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
