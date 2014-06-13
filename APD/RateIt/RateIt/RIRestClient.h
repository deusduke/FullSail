//
//  RIRestClient.h
//  RateIt
//
//  Created by Deus Duke on 6/11/14.
//  Copyright (c) 2014 DEUS Enterprises. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "RIProduct.h"

@interface RIRestClient : NSObject

@property (strong, nonatomic) RIProduct* products;
@property (nonatomic) BOOL isLoggedIn;

+(BOOL)userIsLoggedIn;
+(void)loginUser;
+(void)logoutUser;

@end

static BOOL isLoggedIn = false;
