//
//  MDFModel.h
//  MDF1 Project 01
//
//  Created by Deus Duke on 11/26/13.
//  Copyright (c) 2013 DEUS Enterprises. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MDFObject.h"

@interface MDFModel : NSObject

@property (strong, nonatomic) NSMutableArray* objects;

- (void) initialize;

@end
