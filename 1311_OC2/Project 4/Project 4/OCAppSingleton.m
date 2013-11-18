//
//  OCAppSingleton.m
//  Project 4
//
//  Created by Deus Duke on 11/17/13.
//  Copyright (c) 2013 DEUS Enterprises. All rights reserved.
//

#import "OCAppSingleton.h"

@implementation OCAppSingleton

static OCAppSingleton* _instance;

+(OCAppSingleton *)getInstance
{
    if (_instance == nil)
    {
        _instance = [[self alloc] init];
    }
    
    return _instance;
}

-(id) init
{
    if (self = [super init])
    {
    }
    return self;
}

@end
