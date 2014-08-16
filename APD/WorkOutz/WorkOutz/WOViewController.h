//
//  WOViewController.h
//  WorkOutz
//
//  Created by Deus Duke on 8/11/14.
//  Copyright (c) 2014 DEUS Enterprises. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WOBorderButton.h"

@interface WOViewController : UIViewController

@property (weak, nonatomic) IBOutlet WOBorderButton *previewWorkoutsButton;
@property (weak, nonatomic) IBOutlet WOBorderButton *statsButton;
@property (weak, nonatomic) IBOutlet WOBorderButton *viewWorkoutsButton;
@property (weak, nonatomic) IBOutlet WOBorderButton *createWorkoutButton;

- (IBAction)goToHistory:(id)sender;
- (IBAction)goToStats:(id)sender;
- (IBAction)goToWorkouts:(id)sender;
- (IBAction)goToCreate:(id)sender;

@end
