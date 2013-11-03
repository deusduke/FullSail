//
//  ViewController.m
//  AOC1 Week4
//  1309
//
//  Created by Deus Duke on 9/18/13.
//  Copyright (c) 2013 DEUS Enterprises. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[self loginButton] addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [[self dateButton] addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [[self infoButton] addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)onClick:(id)sender
{
    UIButton* b = (UIButton*)sender;
    
    switch (b.tag) {
        case LOGIN_TAG:
            [self doLogin];
            break;
        case DATE_TAG:
            [self showDate];
            break;
        case INFO_TAG:
            [self showInfo];
            break;
        default:
            break;
    }
}

// log the user in
-(void)doLogin
{
    NSString *loginString = [[self username] text];
    
    if ([loginString length] == 0)
    {
        [[self loginLabel] setText:@"Username cannot be empty"];
    }
    else
    {
        [[self loginLabel] setText:[ NSString stringWithFormat:@"User: %@ has been logged in", loginString]];
    }
}

// show the current date
-(void)showDate
{
    UIAlertView *dateAlert = [[UIAlertView alloc] init];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"MMMM dd, yyyy h:mm:ss a zzzz"];
    
    NSDate *now = [NSDate date];
    
    [dateAlert setTitle:@"Date"];
    [dateAlert setMessage:[formatter stringFromDate:now]];
    [dateAlert addButtonWithTitle:@"OK"];
    [dateAlert show];
}

// show app information
-(void)showInfo
{
    [[self infoLabel] setText:@"This application was written by: Deus Duke"];
}
@end
