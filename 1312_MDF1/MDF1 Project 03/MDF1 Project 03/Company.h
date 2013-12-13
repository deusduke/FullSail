//
//  Company.h
//  MDF1 Project 03
//
//  Created by Deus Duke on 12/12/13.
//  Copyright (c) 2013 DEUS Enterprises. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Company : NSObject

@property (strong, nonatomic) NSString* companyName;
@property (nonatomic) float lattitude;
@property (nonatomic) float longitude;

@end
