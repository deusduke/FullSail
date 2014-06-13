//
//  RIRestClient.m
//  RateIt
//
//  Created by Deus Duke on 6/11/14.
//  Copyright (c) 2014 DEUS Enterprises. All rights reserved.
//

#import "RIRestClient.h"

@implementation RIRestClient

@synthesize products;

-(id)init {
    self = [super init];
    
    if (self) {
        // initialize array
        RIProduct* product = [[RIProduct alloc] init];
        
        [product setProductName:@"Speaker 1"];
        [product setProductDescription:@"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."];
        [product setSpeakerImage:@"speaker1"];
        [product setAverageRating:[NSNumber numberWithInt:4]];
        [product setUPC:@"981273917239812397"];
        
        product = [[RIProduct alloc] init];
        
        [product setProductName:@"Speaker 2"];
        [product setProductDescription:@"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."];
        [product setSpeakerImage:@"speaker2"];
        [product setAverageRating:[NSNumber numberWithInt:4]];
        [product setUPC:@"0923407234097"];
        
        product = [[RIProduct alloc] init];
        
        [product setProductName:@"Speaker 3"];
        [product setProductDescription:@"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."];
        [product setSpeakerImage:@"speaker3"];
        [product setAverageRating:[NSNumber numberWithInt:4]];
        [product setUPC:@"0724597564897"];
        
        product = [[RIProduct alloc] init];
        
        [product setProductName:@"Speaker 4"];
        [product setProductDescription:@"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."];
        [product setSpeakerImage:@"speaker4"];
        [product setAverageRating:[NSNumber numberWithInt:4]];
        [product setUPC:@"0972456982756"];
        
        product = [[RIProduct alloc] init];
        
        [product setProductName:@"Speaker 5"];
        [product setProductDescription:@"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."];
        [product setSpeakerImage:@"speaker5"];
        [product setAverageRating:[NSNumber numberWithInt:4]];
        [product setUPC:@"987254609826570"];
        
        product = [[RIProduct alloc] init];
        
        [product setProductName:@"Speaker 6"];
        [product setProductDescription:@"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."];
        [product setSpeakerImage:@"speaker1"];
        [product setAverageRating:[NSNumber numberWithInt:4]];
        [product setUPC:@"95496874569807"];
        
        product = [[RIProduct alloc] init];
        
        [product setProductName:@"Speaker 7"];
        [product setProductDescription:@"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."];
        [product setSpeakerImage:@"speaker2"];
        [product setAverageRating:[NSNumber numberWithInt:4]];
        [product setUPC:@"0984569825670"];
        
        product = [[RIProduct alloc] init];
        
        [product setProductName:@"Speaker 8"];
        [product setProductDescription:@"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."];
        [product setSpeakerImage:@"speaker3"];
        [product setAverageRating:[NSNumber numberWithInt:4]];
        [product setUPC:@"987245987240"];
        
        product = [[RIProduct alloc] init];
        
        [product setProductName:@"Speaker 9"];
        [product setProductDescription:@"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."];
        [product setSpeakerImage:@"speaker4"];
        [product setAverageRating:[NSNumber numberWithInt:4]];
        [product setUPC:@"9873456987345796"];
    }
    
    return self;
}

+(void)loginUser {
    isLoggedIn = true;
}

+(void)logoutUser {
    isLoggedIn = false;
}

+(BOOL)userIsLoggedIn {
    return isLoggedIn;
}


@end
