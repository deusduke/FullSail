//
//  AutomobileFactory.h
//  Project 01
//
//  Created by Deus Duke on 11/2/13.
//  Copyright (c) 2013 DEUS Enterprises. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Automobile.h"

@interface AutomobileFactory : NSObject

+(Automobile*)createAutomobile:(VehicleType)ofType;

@end
