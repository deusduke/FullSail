//
//  MDFViewController.h
//  MDF Project 01
//
//  Created by Deus Duke on 3/5/14.
//  Copyright (c) 2014 DEUS Enterprises. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MDFMainTableViewController : UITableViewController

@property (strong, nonatomic) ACAccount* currentAccount;
@property (strong, nonatomic) NSArray* twitterFeed;

-(void) getTwitterLogin;
-(void) getTweets;

-(IBAction)refreshTweets:(id)sender;
-(IBAction)postTweet:(id)sender;

@end
