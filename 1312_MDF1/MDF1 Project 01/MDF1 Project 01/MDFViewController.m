//
//  MDFViewController.m
//  MDF1 Project 01
//
//  Created by Deus Duke on 11/26/13.
//  Copyright (c) 2013 DEUS Enterprises. All rights reserved.
//

#import "MDFViewController.h"
#import "MDFCell.h"
#import "MDFObject.h"

@interface MDFViewController ()

@end

@implementation MDFViewController

@synthesize model, tableView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // initialize the model
    model = [[MDFModel alloc] init];
    [model initialize];
    
    [tableView setDelegate:self];
    [tableView setDataSource:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* identifier = @"MDFCell";
    
    // try to get reusable cell
    MDFCell* cell = (MDFCell*) [self.tableView dequeueReusableCellWithIdentifier:identifier];
    
    // if not found make a new one
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"Cell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    // pull the correction from from the model and setup the cell
    MDFObject* obj = (MDFObject*)[[model objects] objectAtIndex:indexPath.row];
    [cell setObject:obj];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // simply return the number of objects in our model
    return self.model.objects.count;
}

- (void)onEditButtonPushed:(id)sender
{
    if (tableView.isEditing)
    {
        [[self editButton] setTitle:@"Edit"];
        [tableView setEditing:NO animated:YES];
    }
    else
    {
        [[self editButton] setTitle:@"Done"];
        [tableView setEditing:YES animated:YES];
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (editingStyle) {
        case UITableViewCellEditingStyleDelete:
            [self.model.objects removeObjectAtIndex:indexPath.row];
            [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
            break;
            
        default:
            break;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    MDFObject* obj = [self.model.objects objectAtIndex:indexPath.row];
    [[self navigationController] performSegueWithIdentifier:@"GameDetail" sender:self];
}

@end
