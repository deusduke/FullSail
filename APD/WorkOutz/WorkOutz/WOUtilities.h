//
//  WOUtilities.h
//  WorkOutz
//
//  Created by Deus Duke on 8/16/14.
//  Copyright (c) 2014 DEUS Enterprises. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WOUtilities : NSObject

+ (NSManagedObjectContext*) managedObjectContext;
+ (void) setManagedObjectContext:(NSManagedObjectContext*)context;

+ (NSArray*) getRoutines;
+ (NSDictionary*) getRoutineDictionary;

@end
