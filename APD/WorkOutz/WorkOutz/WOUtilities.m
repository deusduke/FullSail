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

+ (NSArray*) getRoutines
{
    // pull the routines from the database
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Routine"
                                              inManagedObjectContext:managedObjectContext];
    [fetchRequest setEntity:entity];
    NSError *error;
    NSArray *routineObjects = [managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    return routineObjects;
}

// return all routines
+ (NSDictionary*)getRoutineDictionary
{
    NSMutableDictionary* tempDictionary = [[NSMutableDictionary alloc] init];
    NSArray* routineObjects = [self getRoutines];
    // sort by name
    NSArray* sortedRoutines = [routineObjects sortedArrayUsingComparator:^NSComparisonResult(Routine* obj1, Routine* obj2) {
        return [obj1.name compare:obj2.name];
    }];
    
    // array used for populating the dictionary
    NSMutableArray* array = NULL;
    
    // iterate over the array, add routines to dictionary using first letter as key
    NSString* firstLetter = NULL;
    for (Routine* routine in sortedRoutines) {
        NSString* newFirstLetter = [routine.name substringToIndex:1];
        
        // set number first letter to #
        NSCharacterSet* notDigits = [[NSCharacterSet decimalDigitCharacterSet] invertedSet];
        if ([newFirstLetter rangeOfCharacterFromSet:notDigits].location == NSNotFound)
        {
            newFirstLetter = @"#";
        }
        
        // if the strings aren't equal, we need to setup a new array
        if (![newFirstLetter isEqualToString:firstLetter])
        {
            firstLetter = newFirstLetter;
            array = [[NSMutableArray alloc] init];
        }
        else // otherwise add to the existing array
        {
            array = [NSMutableArray arrayWithArray:[tempDictionary objectForKey:firstLetter]];
        }
        
        [array addObject:routine];
        
        // finally update the dictionary
        [tempDictionary setValue:[NSArray arrayWithArray:array] forKey:firstLetter];
    }
    
    // convert to immutable dictionary and return
    return [NSDictionary dictionaryWithDictionary:tempDictionary];
}



@end
