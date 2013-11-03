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

-(void)calculateTimeToTravel10Miles
{
    float time = 10.0 / [self topSpeed] * 60;
    NSLog(@"This vehicle can travel 10 miles in %.02f minutes", time);
}

@end
