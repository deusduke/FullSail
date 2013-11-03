//
//  Tahoe.m
//  Project 01
//
//  Created by Deus Duke on 11/2/13.
//  Copyright (c) 2013 DEUS Enterprises. All rights reserved.
//

#import "Tahoe.h"

@implementation Tahoe

@synthesize isInAllWheelDrive;

-(void)calculateTimeToTravel10Miles
{
    if (isInAllWheelDrive)
    {
        NSLog(@"The top speed is usually %i but the vehicle is currently in all wheel drive mode so the top speed is only 50", [self topSpeed]);
        
        NSLog(@"This vehicle can travel 10 miles in %.02f minutes", 10.0 / 50 * 60);
    }
    else
    {
        [super calculateTimeToTravel10Miles];
    }
}

@end
