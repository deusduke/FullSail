//
//  ViewController.h
//  AOC1 Week4
//  1309
//
//  Created by Deus Duke on 9/18/13.
//  Copyright (c) 2013 DEUS Enterprises. All rights reserved.
//

#import <UIKit/UIKit.h>

// constant button tags
#define LOGIN_TAG 0
#define DATE_TAG  1
#define INFO_TAG  2

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *loginLabel;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *dateButton;
@property (weak, nonatomic) IBOutlet UIButton *infoButton;

-(void)onClick:(id)sender;
-(void)doLogin;
-(void)showDate;
-(void)showInfo;

@end
