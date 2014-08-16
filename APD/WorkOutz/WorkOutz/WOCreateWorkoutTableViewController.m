//
//  WOCreateWorkoutTableViewController.m
//  WorkOutz
//
//  Created by Deus Duke on 8/14/14.
//  Copyright (c) 2014 DEUS Enterprises. All rights reserved.
//

#import "WOCreateWorkoutTableViewController.h"

@interface WOCreateWorkoutTableViewController ()

@end

@implementation WOCreateWorkoutTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // TODO: fix this logic to be reuseable
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont boldSystemFontOfSize:20.0];
    label.shadowColor = [UIColor colorWithWhite:0.0 alpha:0.5];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    
    self.navigationItem.titleView = label;
    label.text = self.navigationItem.title;
    [label sizeToFit];
    
    // dismiss keyboard on tap
    UIGestureRecognizer* tapper = [[UITapGestureRecognizer alloc]
              initWithTarget:self action:@selector(dismissKeyboard:)];
    tapper.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapper];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dismissKeyboard:(UITapGestureRecognizer*) sender
{
    [self.view endEditing:YES];
}

- (IBAction)goToRoot:(id)sender {
    [[self navigationController] popToRootViewControllerAnimated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 1 || section == 2)
        return 40.0f;
    else
        return 0.0f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [super tableView:tableView numberOfRowsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [super tableView:tableView cellForRowAtIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    // insert the and setup the add routine button
    if (section == 2)
    {
        UITableViewHeaderFooterView *header = (UITableViewHeaderFooterView*) view;
        if (header != nil)
        {
            UIButton* addButton = (UIButton*)[header.contentView viewWithTag:1001];
            
            if (addButton == nil)
            {
                // setup button frame
                CGRect frame = header.contentView.frame;
                frame.origin.x = frame.size.width - 40 - 8;
                frame.size.width = 40;
                
                // create and initialize the button
                addButton = [[UIButton alloc] initWithFrame:frame];
                addButton.tag = 1001;
                [addButton setTitle:@"+" forState:UIControlStateNormal];
                addButton.titleLabel.textAlignment = NSTextAlignmentRight;
                addButton.titleLabel.font = [UIFont systemFontOfSize:32];
                
                [addButton setTitleColor:[UIColor colorWithRed:12/255.0f green:100/255.0f blue:198/255.0f alpha:1] forState:UIControlStateNormal];
                
                // add the button and it's click event
                [header.contentView addSubview:addButton];
                [addButton addTarget:self action:@selector(addRoutine:) forControlEvents:UIControlEventTouchUpInside];
            }
        }
    }
}

- (void) addRoutine:(id) sender
{
    [self performSegueWithIdentifier:@"routines" sender:self];
}

@end
