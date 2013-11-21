//
//  OCAppSingleton.m
//  Project 4
//
//  Created by Deus Duke on 11/17/13.
//  Copyright (c) 2013 DEUS Enterprises. All rights reserved.
//

#import "OCAppSingleton.h"

@implementation OCAppSingleton

@synthesize eventText, firstEventAdded;

static OCAppSingleton* _instance;

+(OCAppSingleton *)getInstance
{
    // create instance if not already created
    if (_instance == nil)
    {
        _instance = [[self alloc] init];
        
        // set or get initial text
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        // set defaults
        NSString* startText = [defaults objectForKey:@"EventText"];
        
        if (startText == nil)
        {
            startText = @"All events go here...";
            _instance.firstEventAdded = false;
        }
        else
        {
            _instance.firstEventAdded = true;
        }
        
        _instance.eventText = startText;
    }
    
    return _instance;
}

-(id) init
{
    if (self = [super init])
    {
    }
    return self;
}

-(void) addEvent:(NSString*) eventName
         andDate:(NSDate*) eventDate;
{
    NSString* newText = [self getFormattedEventText:eventName withDate:eventDate];
    
    // if not initialized, add first text
    if (!firstEventAdded)
    {
        [self setEventText:newText];
    }
    else // append text
    {
        [self setEventText:[NSString stringWithFormat:@"%@%@", [self eventText], newText]];
    }
    
    // set initialized
    firstEventAdded = true;
}

// get the formated event text
- (NSString *)getFormattedEventText:(NSString *)theEvent withDate:(NSDate *)theDate
{
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc]init];
    
    [dateFormat setDateFormat:@"MMM dd, yyyy h:mm:ss a"];
    
    return [NSString stringWithFormat:@"New Event: %@\n%@\n\n", theEvent, [dateFormat stringFromDate:theDate]];
}

@end
