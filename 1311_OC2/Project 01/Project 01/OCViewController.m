//
//  OCViewController.m
//  Project 01
//
//  Created by Deus Duke on 11/2/13.
//  Copyright (c) 2013 DEUS Enterprises. All rights reserved.
//

#import "OCViewController.h"
#import "AutomobileFactory.h"
#import "Tahoe.h"
#import "Maserati.h"
#import "UHaul.h"

@interface OCViewController ()

@end

@implementation OCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    // setup instances of our automobiles
    UHaul* u = (UHaul*)[AutomobileFactory createAutomobile:UHAUL];
    Maserati* m = (Maserati*)[AutomobileFactory createAutomobile:MASERATI];
    Tahoe* t = (Tahoe*)[AutomobileFactory createAutomobile:TAHOE];
    
    NSLog(@"Calculating UHaul time:");
    [u calculateTimeToTravel10Miles];
    
    NSLog(@"Calculating UHaul time after changing cost:");
    [u setCostPerDay:[NSNumber numberWithFloat:40.25]];
    [u calculateTimeToTravel10Miles];
    
    NSLog(@"Calculating Maserati time:");
    [m calculateTimeToTravel10Miles];
    
    NSLog(@"Calculating Maserati time when not tuned:");
    [m setHasBeenSuperCharged:false];
    [m calculateTimeToTravel10Miles];
    
    NSLog(@"Calculating Tahoe time:");
    [t calculateTimeToTravel10Miles];
    
    NSLog(@"Calculating Tahoe time in all wheel drive:");
    [t setIsInAllWheelDrive: true];
    [t calculateTimeToTravel10Miles];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
