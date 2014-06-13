//
//  RILoginViewController.h
//  RateIt
//
//  Created by Deus Duke on 6/12/14.
//  Copyright (c) 2014 DEUS Enterprises. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RIRestClient.h"

@interface RILoginViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField* loginField;
@property (weak, nonatomic) IBOutlet UITextField* passwordField;
@property (weak, nonatomic) IBOutlet UIButton* loginButton;
@property (weak, nonatomic) IBOutlet UIButton* createButton;
@property (weak, nonatomic) IBOutlet UIButton* guestButton;
@property (nonatomic) RIRestClient* client;

-(IBAction)login:(id)sender;
-(IBAction)create:(id)sender;
-(IBAction)continueAsGuest:(id)sender;

@end
