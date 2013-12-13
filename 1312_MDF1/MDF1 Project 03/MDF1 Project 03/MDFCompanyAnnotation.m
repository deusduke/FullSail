//
//  MDFCompanyAnnotation.m
//  MDF1 Project 03
//
//  Created by Deus Duke on 12/12/13.
//  Copyright (c) 2013 DEUS Enterprises. All rights reserved.
//

#import "MDFCompanyAnnotation.h"

@implementation MDFCompanyAnnotation

@synthesize coordinate, title;

- (id)initWithTitle:(NSString *)annotationTitle coordinate:(CLLocationCoordinate2D)location
{
    self = [super init];
    
    if (self != nil)
    {
        self.coordinate = location;
        self.title = annotationTitle;
    }
    
    return self;
}

@end
