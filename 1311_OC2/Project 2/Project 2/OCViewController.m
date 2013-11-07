//
//  OCViewController.m
//  Project 2
//
//  Created by Deus Duke on 11/6/13.
//  Copyright (c) 2013 DEUS Enterprises. All rights reserved.
//

#import "OCViewController.h"
#import "OCModalViewController.h"

@interface OCViewController ()

@end

@implementation OCViewController

@synthesize uhaulButton, mazButton, tahoeButton,
            bgSegControl, buttonArray, calculateButton,
            calculationField, calculationStepper, milesLabel,
            fieldPlaceholder;

- (void)viewDidLoad
{
    [super viewDidLoad];

    // store all the buttons in an array for simple traversing
    buttonArray = @[uhaulButton, mazButton, tahoeButton];
    fieldPlaceholder = @"Select a car below to get started!!!";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// utility function to remove text from texfield and show the place holder
- (void)resetFieldPlaceholder
{
    // update the text fields placeholder
    [calculationField setPlaceholder:fieldPlaceholder];
    [calculationField setText:nil];
}

- (IBAction)onButtonClick:(id)sender
{
    // make sure the calculate button is enabled
    if (!calculateButton.enabled)
    {
        calculateButton.enabled = true;
        fieldPlaceholder = @"Set the miles traved then hit the calculate!!!";
        [self resetFieldPlaceholder];
    }
    
    // figure out which button was clicked
    UIButton* button = (UIButton*)sender;
    
    if (button.tag <= 2)
    {
        // clicked button should be disabled, others enabled
        for (UIButton* obj in buttonArray) {
            obj.enabled = obj.tag != button.tag;
        }
        
        // reset the placeholder
        [self resetFieldPlaceholder];
    }
    else // this is the calculate button
    {
        float time; // the time it takes to travel n miles
        int miles = (int)calculationStepper.value;
        
        // declare possible return values
        UHaul* uhaul;
        Tahoe* tahoe;
        Maserati* mas;
        
        // get the selected button
        UIButton* selButton;
        for (UIButton* obj in buttonArray) {
            if (!obj.enabled)
            {
                selButton = obj;
                break;
            }
        }
        
        switch (selButton.tag) {
            case UHAUL:
                uhaul = (UHaul*)[AutomobileFactory createAutomobile:UHAUL];
                [uhaul setTopSpeed:70];
                [uhaul setWheels:6];
                [uhaul setManufacturer:@"U-Haul"];
                [uhaul setCostPerDay: [NSNumber numberWithFloat:25.50]];
                [uhaul setVehicleClass:UHAUL];
                
                time = [uhaul calculateTimeToTravelMiles:miles];
                
                [calculationField setText:[NSString stringWithFormat:@"A UHaul goes %i miles in %.02f minutes", (int)calculationStepper.value, time]];
                break;
                
            case TAHOE:
                tahoe = (Tahoe*)[AutomobileFactory createAutomobile:TAHOE];
                [tahoe setTopSpeed:136];
                [tahoe setWheels:4];
                [tahoe setManufacturer:@"Chevrolet"];
                [tahoe setIsInAllWheelDrive:false];
                [tahoe setVehicleClass:TAHOE];
                
                time = [tahoe calculateTimeToTravelMiles:miles];
                
                [calculationField setText:[NSString stringWithFormat:@"A Tahoe goes %i miles in %.02f minutes", (int)calculationStepper.value, time]];
                break;
                
            case MASERATI:
                mas = (Maserati*)[AutomobileFactory createAutomobile:MASERATI];
                
                [mas setTopSpeed:191];
                [mas setWheels:4];
                [mas setManufacturer:@"Fiat"];
                [mas setHasBeenSuperCharged:true];
                [mas setVehicleClass:MASERATI];
                
                time = [mas calculateTimeToTravelMiles:miles];
                
                [calculationField setText:[NSString stringWithFormat:@"A Maserati goes %i miles in %.02f minutes", (int)calculationStepper.value, time]];
                break;
                
            default:
                break;
        }
    }
}

- (void)onStepperChanged:(id)sender
{
    // update the stepper label
    int currentVal = [calculationStepper value];
    
    // update the label
    [milesLabel setText:[NSString stringWithFormat:@"Miles Traveled: %d", currentVal]];
    
    // reset the placeholder
    [self resetFieldPlaceholder];
}

- (void)onSegmentChanged:(id)sender
{
    switch (bgSegControl.selectedSegmentIndex) {
        case 0:
            [[self view] setBackgroundColor: [UIColor whiteColor]];
            break;
            
        case 1:
            [[self view] setBackgroundColor: [UIColor grayColor]];
            break;
            
        case 2:
            [[self view] setBackgroundColor: [UIColor brownColor]];
            break;
            
        default:
            break;
    }
}

- (void)infoButtonClick:(id)sender
{
    // show the modal
    OCModalViewController* ocmvc = [[OCModalViewController alloc] init];
    
    if (ocmvc != NULL)
    {
        [self performSegueWithIdentifier:@"OCModal" sender:self];
    }
}

@end
