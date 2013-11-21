//
//  OCAddEventViewController.h
//  Project 4
//
//  Created by Deus Duke on 11/17/13.
//  Copyright (c) 2013 DEUS Enterprises. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OCAddEventViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *swipeLabel;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UIButton *closeKeyboardButton;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (strong, nonatomic) UISwipeGestureRecognizer *swipeRecognizer;

-(IBAction) onCloseKeyboard:(id)sender;

@end