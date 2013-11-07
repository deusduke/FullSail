//
//  OCViewController.h
//  Project 2
//
//  Created by Deus Duke on 11/6/13.
//  Copyright (c) 2013 DEUS Enterprises. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OCViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton* uhaulButton;
@property (weak, nonatomic) IBOutlet UIButton* mazButton;
@property (weak, nonatomic) IBOutlet UIButton* tahoeButton;
@property (weak, nonatomic) IBOutlet UIButton *calculateButton;
@property (weak, nonatomic) IBOutlet UIButton *infoButton;
@property (weak, nonatomic) IBOutlet UITextField *calculationField;
@property (weak, nonatomic) IBOutlet UIStepper *calculationStepper;
@property (weak, nonatomic) IBOutlet UILabel *milesLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *bgSegControl;

@property (nonatomic) NSArray* buttonArray;
@property (weak, nonatomic) NSString* fieldPlaceholder;

- (IBAction) onButtonClick:(id)sender;
- (IBAction) onStepperChanged:(id)sender;
- (IBAction) onSegmentChanged:(id)sender;
- (IBAction) infoButtonClick:(id)sender;

@end
