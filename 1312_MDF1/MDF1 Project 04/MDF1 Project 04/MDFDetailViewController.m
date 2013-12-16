//
//  MDFDetailViewController.m
//  MDF1 Project 04
//
//  Created by Deus Duke on 12/15/13.
//  Copyright (c) 2013 DEUS Enterprises. All rights reserved.
//

#import "MDFDetailViewController.h"
#import "MDFModel.h"
#import "MDFSearchResult.h"

@interface MDFDetailViewController ()

@end

@implementation MDFDetailViewController

@synthesize textView;

- (void)viewDidLoad
{
    [super viewDidLoad];

    // grab a model and show the details
    MDFModel* model = [[MDFModel alloc] init];
    MDFSearchResult* sr = model.currentSearchResult;
    
    // format the model data for display
    NSString* text = @"Name:\n"
                     "%@\n\n"
                     "Description:\n"
                     "%@\n\n"
                     "Cost:\n"
                     "$%.02f\n\n"
                     "Shipping:\n"
                     "$%.02f\n\n"
                     "Available Online:\n"
                     "%@";
    
    text = [NSString stringWithFormat:text, sr.name, sr.shortDescription, sr.price, sr.shipCost, sr.availableOnline ? @"Yes": @"No"];
    [self.textView setText:text];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
