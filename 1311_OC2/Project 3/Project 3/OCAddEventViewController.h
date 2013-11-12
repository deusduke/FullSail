//
//  OCAddEventViewController.h
//  Project 3
//
//  Created by Deus Duke on 11/11/13.
//  Copyright (c) 2013 DEUS Enterprises. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol OCAddEventViewDelegate <NSObject>

@required
-(void) newEventAddedSuccesfully:(NSString*)eventText
                        withDate:(NSDate*)theDate;
@end

@interface OCAddEventViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (weak, nonatomic) IBOutlet UIButton *closeKeyboardButton;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UITextField *eventTextField;

@property (weak, nonatomic) id <OCAddEventViewDelegate> addEventViewDelegate;

- (IBAction)onCloseKeyboardPressed:(id)sender;
- (IBAction)onSavePressed:(id)sender;

@end
