//
//  WOViewController.m
//  WorkOutz
//
//  Created by Deus Duke on 8/11/14.
//  Copyright (c) 2014 DEUS Enterprises. All rights reserved.
//

#import "WOViewController.h"

@interface WOViewController ()

@end

@implementation WOViewController

@synthesize previewWorkoutsButton, viewWorkoutsButton, statsButton, createWorkoutButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.navigationController.navigationBar.barTintColor =
    [UIColor colorWithRed: 12 / 255.f green: 100 / 255.f blue: 198 / 255.f alpha: 1];
    
    // TODO: fix this logic to be reuseable
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont boldSystemFontOfSize:20.0];
    label.shadowColor = [UIColor colorWithWhite:0.0 alpha:0.5];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem.tintColor = [UIColor whiteColor];
    
    self.navigationItem.titleView = label;
    label.text = self.navigationItem.title;
    [label sizeToFit];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goToHistory:(id)sender {
}

- (IBAction)goToStats:(id)sender {
}

- (IBAction)goToWorkouts:(id)sender {
}

- (IBAction)goToCreate:(id)sender {
    [self performSegueWithIdentifier:@"create" sender:self];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 100.0f;
}
@end
