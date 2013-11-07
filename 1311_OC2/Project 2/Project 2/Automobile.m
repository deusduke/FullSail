//
//  Automobile.m
//  Project 01
//
//  Created by Deus Duke on 11/2/13.
//  Copyright (c) 2013 DEUS Enterprises. All rights reserved.
//

#import "Automobile.h"

@implementation Automobile

// create getters and setters
@synthesize wheels, topSpeed, vehicleClass, manufacturer;

-(id)init {
    self = [super init];
    
    if (self != nil)
    {
        [self setWheels:0];
        [self setTopSpeed:0];
        [self setVehicleClass:0];
        [self setManufacturer:nil];
    }
    
    return self;
}

-(float)calculateTimeToTravelMiles:(int)numberOfMiles
{
    float time = (float)numberOfMiles / [self topSpeed] * 60.0;
    return time;
}

@end
