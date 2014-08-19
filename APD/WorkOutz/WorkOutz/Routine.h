//
//  Routine.h
//  WorkOutz
//
//  Created by Deus Duke on 8/18/14.
//  Copyright (c) 2014 DEUS Enterprises. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Routine : NSManagedObject

@property (nonatomic, retain) NSString * details;
@property (nonatomic, retain) NSString * image;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * part;

@end
