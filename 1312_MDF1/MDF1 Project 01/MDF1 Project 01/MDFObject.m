//
//  MDFDemadeObject.m
//  MDF1 Project 01
//
//  Created by Deus Duke on 11/26/13.
//  Copyright (c) 2013 DEUS Enterprises. All rights reserved.
//

#import "MDFObject.h"

@interface MDFObject()

- (UIImage*) ImageWithName: (NSString*) theName;

@end

@implementation MDFObject

@synthesize name, yearReleased, copiesSold, platform, description, imageName;

- (UIImage *)ImageWithName:(NSString *)theName
{
    // simply returns the asset with the given name
    return [UIImage imageNamed:theName];
}

- (UIImage*)ImageForThumbnail
{
    // get the thumbnail image
    return [self ImageWithName:[self.imageName stringByAppendingString:@"_thumbnail"]];
}

- (UIImage*)ImageForDetail
{
    // get the detail image
    return [self ImageWithName:[self.imageName stringByAppendingString:@"_detail"]];
}

@end
