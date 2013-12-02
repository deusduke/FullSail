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
#import "MDFGameDetailsViewController.h"

@interface MDFViewController ()

@end

@implementation MDFViewController

@synthesize model;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // initialize the model
    model = [[MDFModel alloc] init];
    [model initialize];
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
    MDFCell* cell = (MDFCell*) [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
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
    // handle edit mode switching
    if (self.tableView.isEditing)
    {
        [[self editButton] setTitle:@"Edit"];
        [self.tableView setEditing:NO animated:YES];
    }
    else
    {
        [[self editButton] setTitle:@"Done"];
        [self.tableView setEditing:YES animated:YES];
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // handles deletion
    switch (editingStyle) {
        case UITableViewCellEditingStyleDelete:
            [self.model.objects removeObjectAtIndex:indexPath.row];
            [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
            break;
            
        default:
            break;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 84;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"GameDetail"])
    {
        // pass the model object to the controller
        MDFGameDetailsViewController* controller = [segue destinationViewController];
        
        // get model object from array and send to details view controller
        NSIndexPath* selectedIndexPath = [self.tableView indexPathForSelectedRow];
        [controller setModelObject:[self.model.objects objectAtIndex:[selectedIndexPath row]]];
    }
    else if ([segue.identifier isEqualToString:@"AppInfo"])
    {
        // do stuff if necessary
    }
}

@end
