//
//  OCViewController.h
//  Project 3
//
//  Created by Deus Duke on 11/11/13.
//  Copyright (c) 2013 DEUS Enterprises. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OCViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *eventsTextView;
@property (weak, nonatomic) IBOutlet UIButton *addEventButton;

- (IBAction)onClick:(id)sender;

@end
