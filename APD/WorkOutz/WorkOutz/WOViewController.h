//
//  WOViewController.h
//  WorkOutz
//
//  Created by Deus Duke on 8/11/14.
//  Copyright (c) 2014 DEUS Enterprises. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WOViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *previewWorkoutsButton;
@property (weak, nonatomic) IBOutlet UIView *statsButton;
@property (weak, nonatomic) IBOutlet UIView *viewWorkoutsButton;
@property (weak, nonatomic) IBOutlet UIView *createWorkoutButton;

- (IBAction)goToHistory:(id)sender;
- (IBAction)goToStats:(id)sender;
- (IBAction)goToWorkouts:(id)sender;
- (IBAction)goToCreate:(id)sender;

@end
