//
//  MDFMainViewController.h
//  MDF2 Project 02
//
//  Created by Deus Duke on 3/9/14.
//  Copyright (c) 2014 DEUS Enterprises. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Accounts/Accounts.h>

@interface MDFMainViewController : UICollectionViewController

@property (strong, nonatomic) ACAccount* currentAccount;
@property (strong, nonatomic) NSMutableArray* twitterFriendsArray;

- (void)getTwitterFriends;
- (void)getTwitterLogin;

@end
