//
//  UHaul.m
//  Project 01
//
//  Created by Deus Duke on 11/2/13.
//  Copyright (c) 2013 DEUS Enterprises. All rights reserved.
//

#import "UHaul.h"

@implementation UHaul

@synthesize costPerDay;

-(float)calculateTimeToTravelMiles:(int)numberOfMiles
{
    // a uhaul is weighed down and it's top speed is limited
    return numberOfMiles / ([self topSpeed] - 20.0) * 60;
}

@end
