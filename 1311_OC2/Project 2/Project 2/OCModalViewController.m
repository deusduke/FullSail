//
//  OCModalViewController.m
//  Project 2
//
//  Created by Deus Duke on 11/6/13.
//  Copyright (c) 2013 DEUS Enterprises. All rights reserved.
//

#import "OCModalViewController.h"

@interface OCModalViewController ()

@end

@implementation OCModalViewController

@synthesize doneButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)doneButtonPressed:(id)sender
{
    // close the modal window
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
