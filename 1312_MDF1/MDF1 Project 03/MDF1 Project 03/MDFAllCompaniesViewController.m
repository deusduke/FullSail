//
//  MDFAllCompaniesViewController.m
//  MDF1 Project 03
//
//  Created by Deus Duke on 12/12/13.
//  Copyright (c) 2013 DEUS Enterprises. All rights reserved.
//

#import "MDFAllCompaniesViewController.h"
#import "Models.h"
#import "Company.h"
#import "MDFCompanyAnnotation.h"

@interface MDFAllCompaniesViewController ()

@end

@implementation MDFAllCompaniesViewController

@synthesize map, model;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // get model instance
    self.model = [[Models alloc] init];
    
    CLLocationCoordinate2D regionCoord;
    
    // store current company
    for (Company* company in model.companies) {
        // setup the mapview
        CLLocationCoordinate2D coord;
        coord.latitude = company.lattitude;
        coord.longitude = company.longitude;
        
        MDFCompanyAnnotation* annotation = [[MDFCompanyAnnotation alloc] initWithTitle:company.companyName coordinate:coord];
        annotation.title = company.companyName;
        [self.map addAnnotation:annotation];
        
        // keep track for averaging
        regionCoord.longitude += coord.longitude;
        regionCoord.latitude += coord.latitude;
    }
    
    // get center of all location
    regionCoord.latitude = 37.483375;
    regionCoord.longitude = -122.149554;
    
    // zoom to region
    MKCoordinateSpan span;
    MKCoordinateRegion region;
    span.latitudeDelta = 1;
    span.longitudeDelta = 1;
    region.center = regionCoord;
    region.span = span;
    [self.map setRegion:region animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
