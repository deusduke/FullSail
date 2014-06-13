//
//  RITitleScreenViewController.m
//  RateIt
//
//  Created by Deus Duke on 6/12/14.
//  Copyright (c) 2014 DEUS Enterprises. All rights reserved.
//

#import "RITitleScreenViewController.h"

@interface RITitleScreenViewController ()

@end

@implementation RITitleScreenViewController

@synthesize client;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        client = [[RIRestClient alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // check login after a few seconds
    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(checkLogin) userInfo:nil repeats:NO];
}

-(void)checkLogin
{
    if (client.isLoggedIn) {
        [self performSegueWithIdentifier:@"Main" sender:self];
    }
    else {
        [self performSegueWithIdentifier:@"Login" sender:self];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
