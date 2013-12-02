//
//  MDFAppInfoViewController.m
//  MDF1 Project 01
//
//  Created by Deus Duke on 12/1/13.
//  Copyright (c) 2013 DEUS Enterprises. All rights reserved.
//

#import "MDFAppInfoViewController.h"

@interface MDFAppInfoViewController ()

@end

@implementation MDFAppInfoViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)openInfoURL:(id)sender
{
    NSURL* url = [NSURL URLWithString:@"http://www.refinedguy.com/2013/06/11/the-30-best-selling-video-games-of-all-time/#20"];
    [[UIApplication sharedApplication] openURL:url];
}

@end
