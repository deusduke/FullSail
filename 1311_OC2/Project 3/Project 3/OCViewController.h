//
//  OCViewController.h
//  Project 3
//
//  Created by Deus Duke on 11/11/13.
//  Copyright (c) 2013 DEUS Enterprises. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OCAddEventViewController.h"

@interface OCViewController : UIViewController <OCAddEventViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *eventsTextView;
@property (weak, nonatomic) IBOutlet UIButton *addEventButton;

- (IBAction)onClick:(id)sender;

- (NSString*)getEventText:(NSString*)eventText
                 withDate:(NSDate*)eventDate;

@end
