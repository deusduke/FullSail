//
//  MDFFriendViewController.h
//  MDF2 Project 02
//
//  Created by Deus Duke on 3/10/14.
//  Copyright (c) 2014 DEUS Enterprises. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MDFFollowerInfo.h"
#import "AsyncImageView.h"

@interface MDFFriendViewController : UIViewController

@property (weak, nonatomic) MDFFollowerInfo* followerInfo;
@property (weak, nonatomic) IBOutlet UILabel* usernameLabel;
@property (weak, nonatomic) IBOutlet AsyncImageView* profileImage;

- (IBAction)doneButtonClicked:(id)sender;

@end
