//
//  OCViewController.h
//  Project 4
//
//  Created by Deus Duke on 11/17/13.
//  Copyright (c) 2013 DEUS Enterprises. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OCViewController : UIViewController
    <UIViewControllerTransitioningDelegate,
    UIViewControllerAnimatedTransitioning>

@property (weak, nonatomic) IBOutlet UILabel *swipeLabel;
@property (weak, nonatomic) IBOutlet UITextView *eventTextField;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property (strong, nonatomic) UISwipeGestureRecognizer *swipeRecognizer;

@end
