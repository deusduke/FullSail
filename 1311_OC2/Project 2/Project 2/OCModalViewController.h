//
//  OCModalViewController.h
//  Project 2
//
//  Created by Deus Duke on 11/6/13.
//  Copyright (c) 2013 DEUS Enterprises. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OCModalViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *doneButton;

-(IBAction) doneButtonPressed:(id)sender;

@end
