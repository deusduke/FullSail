//
//  OCAddEventViewController.m
//  Project 4
//
//  Created by Deus Duke on 11/17/13.
//  Copyright (c) 2013 DEUS Enterprises. All rights reserved.
//

#import "OCAddEventViewController.h"
#import "OCAppSingleton.h"

@interface OCAddEventViewController ()

@property (weak, nonatomic) OCAppSingleton *singletonInstance;

-(void)handleSwipe:(UISwipeGestureRecognizer *)swipe;
-(bool)checkValid;

@end

@implementation OCAddEventViewController

@synthesize nameField, datePicker, swipeLabel, swipeRecognizer, singletonInstance;

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
	// Do any additional setup after loading the view.
    
    // setup the singleton instance
    singletonInstance = [OCAppSingleton getInstance];
}

- (void)viewWillAppear:(BOOL)animated
{
    // setup swipe event
    swipeRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    [swipeRecognizer setDirection:UISwipeGestureRecognizerDirectionLeft];
    [swipeLabel addGestureRecognizer:swipeRecognizer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// if valid, store new string and return to main view
- (void)handleSwipe:(UISwipeGestureRecognizer *)swipe
{
    if ([self checkValid])
    {
        OCAppSingleton* instance = [OCAppSingleton getInstance];
        [instance addEvent:[nameField text] andDate:[datePicker date]];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (bool)checkValid
{
    // check validity
    bool isValid = ![[[self nameField] text] isEqualToString: @""];
    
    // if not valid, show the alert
    if (!isValid)
    {
        UIAlertView* uav = [[UIAlertView alloc] initWithTitle:@"Error" message:@"You must add an event name" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [uav show];
    }
    
    return isValid;
}

-(void) onCloseKeyboard:(id)sender
{
    [nameField resignFirstResponder];
}

@end
