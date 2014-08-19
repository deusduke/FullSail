//
//  WOUtilities.m
//  WorkOutz
//
//  Created by Deus Duke on 8/16/14.
//  Copyright (c) 2014 DEUS Enterprises. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "WOUtilities.h"
#import "Routine.h"

@implementation WOUtilities

static NSManagedObjectContext* managedObjectContext;

+ (NSManagedObjectContext *)managedObjectContext
{
    @synchronized(self) { return managedObjectContext; }
}

+ (void)setManagedObjectContext:(NSManagedObjectContext *)context
{
    @synchronized(self) { managedObjectContext = context; }
}

// return all routines
+ (NSArray*)getRoutines
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Routine"
                                              inManagedObjectContext:managedObjectContext];
    [fetchRequest setEntity:entity];
    NSError *error;
    NSArray *routineObjects = [managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    return routineObjects;
}

@end
