//
//  MDFProfileViewController.h
//  MDF Project 01
//
//  Created by Deus Duke on 3/7/14.
//  Copyright (c) 2014 DEUS Enterprises. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Accounts/Accounts.h>
#import "AsyncImageView.h"

@interface MDFProfileViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *followersLabel;
@property (weak, nonatomic) IBOutlet UILabel *friendsLabel;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (weak, nonatomic) IBOutlet AsyncImageView *profileImageView;
@property (strong, nonatomic) ACAccount *currentAccount;

-(void)getTwitterProfile;

@end
