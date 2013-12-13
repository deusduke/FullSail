//
//  MDFCompanyAnnotation.h
//  MDF1 Project 03
//
//  Created by Deus Duke on 12/12/13.
//  Copyright (c) 2013 DEUS Enterprises. All rights reserved.
//

#import <Foundation/Foundation.h>
#import<MapKit/MapKit.h>

@interface MDFCompanyAnnotation : NSObject <MKAnnotation>

@property (nonatomic,assign) CLLocationCoordinate2D coordinate;
@property (nonatomic,copy) NSString *title;

- (id)initWithTitle:(NSString*)annotationTitle
          coordinate:(CLLocationCoordinate2D) location;

@end
