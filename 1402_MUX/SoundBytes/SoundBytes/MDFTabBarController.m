//
//  MDFTabViewController.m
//  SoundBytes
//
//  Created by Deus Duke on 2/27/14.
//  Copyright (c) 2014 DEUS Enterprises. All rights reserved.
//

#import "MDFTabBarController.h"

@interface MDFTabBarController ()

@end

@implementation MDFTabBarController

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
    
    self.navigationItem.hidesBackButton = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    self.navigationItem.title = item.title;
}

@end
