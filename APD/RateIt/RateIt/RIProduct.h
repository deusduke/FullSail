//
//  RIProduct.h
//  RateIt
//
//  Created by Deus Duke on 6/11/14.
//  Copyright (c) 2014 DEUS Enterprises. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RIProduct : NSObject

@property (weak, nonatomic) NSString* productName;
@property (weak, nonatomic) NSString* productDescription;
@property (weak, nonatomic) NSNumber* averageRating;
@property (weak, nonatomic) NSArray* reviews;
@property (weak, nonatomic) NSString* UPC;
@property (weak, nonatomic) NSString* speakerImage;

-(UIImage*) getImage;

@end
