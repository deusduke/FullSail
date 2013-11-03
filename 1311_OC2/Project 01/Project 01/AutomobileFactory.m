//
//  AutomobileFactory.m
//  Project 01
//
//  Created by Deus Duke on 11/2/13.
//  Copyright (c) 2013 DEUS Enterprises. All rights reserved.
//

#import "AutomobileFactory.h"
#import "Maserati.h"
#import "Tahoe.h"
#import "UHaul.h"

@implementation AutomobileFactory

+(Automobile *)createAutomobile:(VehicleType)ofType
{
    if (ofType == UHAUL)
    {
        UHaul* uhaul = [[UHaul alloc] init];
        [uhaul setTopSpeed:70];
        [uhaul setWheels:6];
        [uhaul setManufacturer:@"U-Haul"];
        [uhaul setCostPerDay: [NSNumber numberWithFloat:25.50]];
        [uhaul setVehicleClass:UHAUL];
        
        return uhaul;
    }
    else if (ofType == MASERATI)
    {
        Maserati* m = [[Maserati alloc] init];
        
        [m setTopSpeed:191];
        [m setWheels:4];
        [m setManufacturer:@"Fiat"];
        [m setHasBeenSuperCharged:true];
        [m setVehicleClass:MASERATI];
        
        return m;
    }
    else // ofType == TAHOE
    {
        Tahoe* t = [[Tahoe alloc] init];
        [t setTopSpeed:136];
        [t setWheels:4];
        [t setManufacturer:@"Chevrolet"];
        [t setIsInAllWheelDrive:false];
        [t setVehicleClass:TAHOE];
        
        return t;
    }
}

@end
