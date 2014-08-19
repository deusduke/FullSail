//
//  Settings.h
//  WorkOutz
//
//  Created by Deus Duke on 8/18/14.
//  Copyright (c) 2014 DEUS Enterprises. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Settings : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * value;

@end
