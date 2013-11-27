//
//  MDFDemadeObject.h
//  MDF1 Project 01
//
//  Created by Deus Duke on 11/26/13.
//  Copyright (c) 2013 DEUS Enterprises. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MDFObject : NSObject

@property (strong, nonatomic) NSString* name;
@property (nonatomic) int yearReleased;
@property (nonatomic) float copiesSold;
@property (strong, nonatomic) NSString* platform;
@property (strong, nonatomic) NSString* description;

@end
