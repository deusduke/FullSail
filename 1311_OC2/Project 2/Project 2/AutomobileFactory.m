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
        
        return uhaul;
    }
    else if (ofType == MASERATI)
    {
        Maserati* m = [[Maserati alloc] init];
        
        return m;
    }
    else // ofType == TAHOE
    {
        Tahoe* t = [[Tahoe alloc] init];
        
        return t;
    }
}

@end
