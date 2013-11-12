//
//  OCAddEventViewController.m
//  Project 3
//
//  Created by Deus Duke on 11/11/13.
//  Copyright (c) 2013 DEUS Enterprises. All rights reserved.
//

#import "OCAddEventViewController.h"

@interface OCAddEventViewController ()

@end

@implementation OCAddEventViewController

@synthesize saveButton, closeKeyboardButton, datePicker, eventTextField, addEventViewDelegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // minimum date is always now
    [datePicker setMinimumDate:[NSDate date]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)onCloseKeyboardPressed:(id)sender
{
    [eventTextField resignFirstResponder];
}

-(void)onSavePressed:(id)sender
{
    // pass the information to the delegate
    [addEventViewDelegate newEventAddedSuccesfully:[eventTextField text] withDate:[datePicker date]];
    
    // dismiss the view
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
