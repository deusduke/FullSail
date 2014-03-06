//
//  MDFViewController.h
//  MDF Project 01
//
//  Created by Deus Duke on 3/5/14.
//  Copyright (c) 2014 DEUS Enterprises. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MDFMainViewController : UIViewController

@property (strong, nonatomic) ACAccount* currentAccount;

-(void) getTwitterLogin;
-(void) getTweets;

@end
