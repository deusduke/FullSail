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

// private variable to help with text field functionality
@property bool firstEventAdded;

@end

@implementation OCViewController

@synthesize addEventButton, eventsTextView, firstEventAdded;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // set not initialized
    firstEventAdded = false;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// on click show the modal view
- (IBAction)onClick:(id)sender {
    // show the modal
    OCAddEventViewController *ae = [[self storyboard] instantiateViewControllerWithIdentifier:@"OCAddEvent"];
    
    if (ae != nil)
    {
        // setup the delegate
        [ae setAddEventViewDelegate:self];
        
        // show the modal
        [self presentViewController:ae animated:YES completion:nil];
    }
    else
    {
        NSLog(@"Could not find Add Event Controller in Storyboard");
    }
}

// implement the add event view delegate
- (void)newEventAddedSuccesfully:(NSString *)eventText withDate:(NSDate *)eventDate
{
    NSString* newText = [self getEventText:eventText withDate:eventDate];
    
    // if not initialized, add first text
    if (!firstEventAdded)
    {
        [eventsTextView setText:newText];
    }
    else // append text
    {
        [eventsTextView setText:[NSString stringWithFormat:@"%@%@", [eventsTextView text], newText]];
    }
    
    // set initialized
    firstEventAdded = true;
}

// get the formated event text
- (NSString *)getEventText:(NSString *)eventText withDate:(NSDate *)theDate
{
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc]init];
    
    [dateFormat setDateFormat:@"MMM dd, yyyy H:mm:ss a"];
    
    return [NSString stringWithFormat:@"New Event: %@\n%@\n\n", eventText, [dateFormat stringFromDate:theDate]];
}
@end