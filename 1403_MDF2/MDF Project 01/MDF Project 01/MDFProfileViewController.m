//
//  MDFProfileViewController.m
//  MDF Project 01
//
//  Created by Deus Duke on 3/7/14.
//  Copyright (c) 2014 DEUS Enterprises. All rights reserved.
//

#import <Social/Social.h>
#import "MDFProfileViewController.h"

@interface MDFProfileViewController ()

@end

@implementation MDFProfileViewController
@synthesize userNameLabel, followersLabel, friendsLabel, descriptionTextView, profileImageView, currentAccount;

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
    
    // get the users profile
    [self getTwitterProfile];
    
    // show the users profile
    [[NSNotificationCenter defaultCenter] addObserverForName:@"ProfileLoaded" object:self queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note) {
        NSDictionary* twitterFeed = note.userInfo;
        
        if (twitterFeed != nil) {
            userNameLabel.text = currentAccount.username;
            followersLabel.text = [NSString stringWithFormat:@"%@ followers", [twitterFeed objectForKey:@"followers_count"]];
            friendsLabel.text = [NSString stringWithFormat:@"%@ friends", [twitterFeed objectForKey:@"friends_count"]];
            descriptionTextView.text = [twitterFeed objectForKey:@"description"];
            
            NSString* url = [twitterFeed objectForKey:@"profile_image_url"];
            if (url != nil)
                profileImageView.imageURL = [NSURL URLWithString:url];
        }
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)getTwitterProfile {
    if (currentAccount != nil) {
        NSURL *requestURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.twitter.com/1.1/users/show.json?screen_name=%@", currentAccount.username]];
        
        // set parameters for the api call
        
        // build the request
        SLRequest *postRequest = [SLRequest
                                  requestForServiceType:SLServiceTypeTwitter
                                  requestMethod:SLRequestMethodGET
                                  URL:requestURL parameters:nil];
        
        // set the account
        [postRequest setAccount:currentAccount];
        
        // perform the request and handle response
        [postRequest performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
            if (urlResponse.statusCode >= 200 && urlResponse.statusCode < 300) {
                
                NSError *jsonError;
                NSDictionary* twitterFeed =
                [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingAllowFragments error:&jsonError];
                
                if (twitterFeed != nil) {
                    NSLog(@"Timeline Response: %@\n", twitterFeed);
                    
                    // show the data
                    [[NSNotificationCenter defaultCenter] postNotificationName:@"ProfileLoaded" object:self userInfo:twitterFeed];
                }
                else {
                    // JSON deserialization failed
                    NSLog(@"JSON Error: %@", [jsonError localizedDescription]);
                }
                
                [[NSNotificationCenter defaultCenter] postNotificationName:@"TweetsLoaded" object:self];
            }
            else {
                // Log the server response on error
                NSLog(@"There was an error, the response code was %ld",
                      (long)urlResponse.statusCode);
            }
        }];
    }
}

@end
