//
//  Maserati.m
//  Project 01
//
//  Created by Deus Duke on 11/2/13.
//  Copyright (c) 2013 DEUS Enterprises. All rights reserved.
//

#import "Maserati.h"

@implementation Maserati

@synthesize hasBeenSuperCharged;

-(float)calculateTimeToTravelMiles:(int)numberOfMiles
{
    // this automobile is either tuned or not, when tuned it's top
    // speed increases, when not tuned it decreases
    if (hasBeenSuperCharged)
    {
        return (float)numberOfMiles / ([self topSpeed] + 10) * 60;
    }
    else
    {
        return (float)numberOfMiles / ([self topSpeed] - 10) * 60;
    }
}

@end
