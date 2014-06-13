//
//  RILoginViewController.m
//  RateIt
//
//  Created by Deus Duke on 6/12/14.
//  Copyright (c) 2014 DEUS Enterprises. All rights reserved.
//

#import "RILoginViewController.h"
#import "RIRestClient.h"

@interface RILoginViewController ()

@end

@implementation RILoginViewController

@synthesize createButton, loginButton, guestButton, loginField, passwordField, client;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        client = [[RIRestClient alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [passwordField setDelegate:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// dismiss keyboard on password done
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [passwordField resignFirstResponder];
    
    return YES;
}

// attempt to login
-(void)login:(id)sender
{
    if (loginField.text.length && passwordField.text.length) {
        [RIRestClient loginUser];
        [self performSegueWithIdentifier:@"Main" sender:self];
    }
    else {
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Oops" message:@"Please enter a username and password" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
}

// create an account
-(void)create:(id)sender
{
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Coming Soon" message:@"This will be implemented in phase two" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

// continues as a guest
-(void)continueAsGuest:(id)sender
{
    
}

@end
