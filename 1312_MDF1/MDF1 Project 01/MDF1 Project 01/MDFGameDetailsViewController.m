//
//  MDFGameDetailsViewController.m
//  MDF1 Project 01
//
//  Created by Deus Duke on 12/1/13.
//  Copyright (c) 2013 DEUS Enterprises. All rights reserved.
//

#import "MDFGameDetailsViewController.h"
#import "MDFObject.h"

@interface MDFGameDetailsViewController ()

@property (strong, nonatomic) MDFObject* modelObject;
- (void) updateWithDataFromModel:(MDFObject*)theObject;

@end

@implementation MDFGameDetailsViewController

@synthesize image, nameLabel, platformLabel, yearLabel, copiesLabel, descriptionTextView, modelObject;

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
    
    [self updateWithDataFromModel:modelObject];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setModelObject:(MDFObject *)theObject
{
    modelObject = theObject;
}

- (void)updateWithDataFromModel:(MDFObject *)theObject
{
    // populate all UI with model data
    [nameLabel setText:theObject.name];
    [platformLabel setText:theObject.platform];
    [yearLabel setText:[NSString stringWithFormat:@"Published in %i", theObject.yearReleased]];
    [copiesLabel setText:[NSString stringWithFormat:@"%.02f million copies sold", theObject.copiesSold]];
    [descriptionTextView setText:theObject.description];
    [image setImage:[theObject ImageForDetail]];
}

@end
