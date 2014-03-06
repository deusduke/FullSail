//
//  MDFViewController.h
//  MDF Project 01
//
//  Created by Deus Duke on 3/5/14.
//  Copyright (c) 2014 DEUS Enterprises. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MDFMainTableViewController : UITableViewController

@property (weak, nonatomic) ACAccount* currentAccount;
@property (weak, nonatomic) NSArray* twitterFeed;

-(void) getTwitterLogin;
-(void) getTweets;

@end
