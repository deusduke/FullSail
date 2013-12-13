//
//  MDFAllCompaniesViewController.h
//  MDF1 Project 03
//
//  Created by Deus Duke on 12/12/13.
//  Copyright (c) 2013 DEUS Enterprises. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Models.h"

@interface MDFAllCompaniesViewController : UIViewController

@property (weak, nonatomic) IBOutlet MKMapView *map;
@property (strong, nonatomic) Models* model;

@end
