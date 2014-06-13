//
//  RIProduct.m
//  RateIt
//
//  Created by Deus Duke on 6/11/14.
//  Copyright (c) 2014 DEUS Enterprises. All rights reserved.
//

#import "RIProduct.h"

@implementation RIProduct

@synthesize productName, productDescription, averageRating, reviews, UPC, speakerImage;

-(UIImage *)getImage {
    return [UIImage imageNamed: speakerImage];
}

@end
