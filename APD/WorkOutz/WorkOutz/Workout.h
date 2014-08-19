//
//  Workout.h
//  WorkOutz
//
//  Created by Deus Duke on 8/18/14.
//  Copyright (c) 2014 DEUS Enterprises. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Routine;

@interface Workout : NSManagedObject

@property (nonatomic, retain) NSDate * creation_date;
@property (nonatomic, retain) NSString * details;
@property (nonatomic, retain) NSString * image;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *routines;
@end

@interface Workout (CoreDataGeneratedAccessors)

- (void)addRoutinesObject:(Routine *)value;
- (void)removeRoutinesObject:(Routine *)value;
- (void)addRoutines:(NSSet *)values;
- (void)removeRoutines:(NSSet *)values;

@end
