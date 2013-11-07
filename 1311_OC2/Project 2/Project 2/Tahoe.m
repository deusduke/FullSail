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

-(float)calculateTimeToTravelMiles:(int)numberOfMiles
{
    if (isInAllWheelDrive)
    {
        // can only get up to 50 mph when in all wheel drive
        return numberOfMiles / 50.0 * 60;
    }
    else
    {
        // otherwise calculate as normal
        return[super calculateTimeToTravelMiles:numberOfMiles];
    }
}

@end
