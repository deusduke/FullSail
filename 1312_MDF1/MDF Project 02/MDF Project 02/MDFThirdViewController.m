//
//  MDFThirdViewController.m
//  MDF Project 02
//
//  Created by Deus Duke on 12/2/13.
//  Copyright (c) 2013 DEUS Enterprises. All rights reserved.
//

#import "MDFThirdViewController.h"
#import "MDFModel.h"

@interface MDFThirdViewController ()

@end

@implementation MDFThirdViewController

@synthesize apaTextView;

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
    
    MDFModel* model = [[MDFModel alloc] init];
    [apaTextView setText: model.apa];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)urlButtonPressed:(id)sender
{
    UIButton* button = sender;
    
    // open the icon site
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: button.titleLabel.text]];

}

@end
