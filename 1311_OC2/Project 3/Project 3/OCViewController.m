//
//  OCViewController.m
//  Project 3
//
//  Created by Deus Duke on 11/11/13.
//  Copyright (c) 2013 DEUS Enterprises. All rights reserved.
//

#import "OCViewController.h"
#import "OCAddEventViewController.h"

@interface OCViewController ()

@end

@implementation OCViewController

@synthesize addEventButton, eventsTextView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// on click show the modal view
- (IBAction)onClick:(id)sender {
    [self performSegueWithIdentifier:@"OCAddEvent" sender:self];
}
@end
