//
//  Automobile.h
//  Project 01
//
//  Created by Deus Duke on 11/2/13.
//  Copyright (c) 2013 DEUS Enterprises. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    UHAUL,
    MASERATI,
    TAHOE
} VehicleType;

@interface Automobile : NSObject

// class properties
@property (nonatomic, assign) NSInteger wheels;
@property (nonatomic, assign) NSInteger topSpeed;
@property (nonatomic, assign) VehicleType vehicleClass;
@property (nonatomic, retain) NSString* manufacturer;

-(id)init;
-(float)calculateTimeToTravelMiles:(int)numberOfMiles;

@end
