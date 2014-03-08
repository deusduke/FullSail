//
//  MDFTweetDetailViewController.h
//  MDF Project 01
//
//  Created by Deus Duke on 3/7/14.
//  Copyright (c) 2014 DEUS Enterprises. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AsyncImageView.h"

@interface MDFTweetDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet AsyncImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UITextView *tweetTextView;
@property (strong, nonatomic) NSDictionary *twitterData;

@end
