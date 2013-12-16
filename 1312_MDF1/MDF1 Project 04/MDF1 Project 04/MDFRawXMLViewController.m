//
//  MDFRawXMLViewController.m
//  MDF1 Project 04
//
//  Created by Deus Duke on 12/15/13.
//  Copyright (c) 2013 DEUS Enterprises. All rights reserved.
//

#import "MDFRawXMLViewController.h"

@interface MDFRawXMLViewController ()

@end

@implementation MDFRawXMLViewController

@synthesize model, textView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    model = [[MDFModel alloc] init];
	
    // show the data in the model
    [self.textView setText:model.rawXML];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
