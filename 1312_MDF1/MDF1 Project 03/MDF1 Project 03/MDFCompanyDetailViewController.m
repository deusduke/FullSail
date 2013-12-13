//
//  MDFCompanyDetailViewController.m
//  MDF1 Project 03
//
//  Created by Deus Duke on 12/12/13.
//  Copyright (c) 2013 DEUS Enterprises. All rights reserved.
//

#import "MDFCompanyDetailViewController.h"
#import "MDFCompanyAnnotation.h"

@interface MDFCompanyDetailViewController ()

@end

@implementation MDFCompanyDetailViewController

@synthesize map, nameLabel, latitudeLabel, longitudeLabel;

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
	// Do any additional setup after loading the view.
    
    // get model instance
    self.model = [[Models alloc] init];
    
    // store current company
    Company * company = self.model.currentCompany;
    
    // setup the mapview
    CLLocationCoordinate2D coord;
    coord.latitude = company.lattitude;
    coord.longitude = company.longitude;
    
    MDFCompanyAnnotation* annotation = [[MDFCompanyAnnotation alloc] initWithTitle:company.companyName coordinate:coord];
    annotation.title = company.companyName;
    [self.map addAnnotation:annotation];
    
    // zoom to region
    MKCoordinateSpan span;
    MKCoordinateRegion region;
    span.latitudeDelta = 0.30f;
    span.longitudeDelta = 0.30f;
    region.center = coord;
    region.span = span;
    [self.map setRegion:region animated:YES];
    
    // setup the labels
    self.nameLabel.text = company.companyName;
    self.latitudeLabel.text = [NSString stringWithFormat:@"%f", company.lattitude];
    self.longitudeLabel.text = [NSString stringWithFormat:@"%f", company.longitude];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
