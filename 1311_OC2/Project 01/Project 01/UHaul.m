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

-(void)calculateTimeToTravel10Miles
{
    NSLog(@"The UHaul cost %@ per day to rent", [self costPerDay]);
    
    NSLog(@"It has a top speed of %d but it's weighed down so it's top speed is really %d", [self topSpeed], [self topSpeed] - 20);
    
    NSLog(@"So it will take %.02f minutes to go 10 miles", 10.0 / ([self topSpeed] - 20) * 60);
}

@end
