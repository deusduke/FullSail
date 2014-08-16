//
//  WOCreateWorkoutTableViewController.h
//  WorkOutz
//
//  Created by Deus Duke on 8/14/14.
//  Copyright (c) 2014 DEUS Enterprises. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WOCreateWorkoutTableViewController : UITableViewController

- (void) dismissKeyboard:(UITapGestureRecognizer *)sender;

- (void) addRoutine:(id) sender;
- (IBAction)goToRoot:(id)sender;

@end
