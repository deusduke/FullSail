//
//  MDFMovieViewController.m
//  MDF2 Project 03
//
//  Created by Deus Duke on 3/20/14.
//  Copyright (c) 2014 DEUS Enterprises. All rights reserved.
//

#import "MDFMovieViewController.h"

@interface MDFMovieViewController ()

@end

@implementation MDFMovieViewController

@synthesize movieURL;

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

- (void)saveClicked:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)cancelClicked:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
