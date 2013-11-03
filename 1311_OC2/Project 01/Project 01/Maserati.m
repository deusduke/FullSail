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

-(void) calculateTimeToTravel10Miles
{
    if (hasBeenSuperCharged)
    {
        NSLog(@"This bad boy has been super charged!!!");
        NSLog(@"It will take %.02f minutes to go 10 miles!!!", 10 / ([self topSpeed] + 10.0) * 60);
    }
    else
    {
        NSLog(@"This guy hasn't been tuned it's not running as well");
        NSLog(@"It will take %.02f minutes to go 10 miles", 10.0 / ([self topSpeed] - 10) * 60);
    }
}

@end
