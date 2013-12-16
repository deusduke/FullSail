//
//  MDFSearchResult.h
//  MDF1 Project 04
//
//  Created by Deus Duke on 12/15/13.
//  Copyright (c) 2013 DEUS Enterprises. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MDFSearchResult : NSObject

@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* shortDescription;
@property (strong, nonatomic) NSString* categoryPath;
@property (strong, nonatomic) NSString* thumbnailImage;
@property (nonatomic) bool availableOnline;
@property (nonatomic) float price;
@property (nonatomic) float shipCost;

@end
