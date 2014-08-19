//
//  WOViewRoutinesTableViewController.m
//  WorkOutz
//
//  Created by Deus Duke on 8/15/14.
//  Copyright (c) 2014 DEUS Enterprises. All rights reserved.
//

#import "WOViewRoutinesTableViewController.h"
#import "WOThumbnailTableViewCell.h"
#import "WOUtilities.h"
#import "Routine.h"

@interface WOViewRoutinesTableViewController ()

@end

@implementation WOViewRoutinesTableViewController

@synthesize routines, keys, managedObjectContext;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // temporary routine dictionary for setup only
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
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
    
    // pull the routines
    keys = @[ @"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z"];
    
    routines = [WOUtilities getRoutineDictionary];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [keys count];
}

// return height if we have routines under this section, otherwise 0
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    NSArray* values = (NSArray*)[routines valueForKey:[keys objectAtIndex:section]];
//    if (values && [values count] > 0)
//    {
//        return [super tableView:tableView heightForHeaderInSection:section];
//    }
//    else
//    {
//        return 0.0f;
//    }
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSString* key = [self intToCharString:65 + section];
    
    return [(NSArray*)[routines valueForKey:key] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return (NSString*)[keys objectAtIndex:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WOThumbnailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"routine" forIndexPath:indexPath];
    
    if (cell != nil)
    {
        NSString* imageName;
        
        switch (indexPath.row) {
            case 1:
                imageName = @"rountine_bentbarbellrow";
                break;
            case 2:
                imageName = @"routine_benchpress";
                break;
            case 3:
                imageName = @"routine_legcurl";
                break;
            case 4:
                imageName = @"routine_legextension";
                break;
            case 5:
                imageName = @"routine_legpress";
                break;
                
            default:
                imageName = @"routine_legpress";
                break;
        }
        
        @try {
            // get routine from array
            NSArray* values = (NSArray*)[routines valueForKey:(NSString*)[keys objectAtIndex:indexPath.section]];
            Routine* routine = [values objectAtIndex:indexPath.row];
            
            cell.titleLabel.text = routine.name;
            cell.detailLabel.text = routine.part;
            [cell updateImageAsynchWithURL:routine.image];
        }
        @catch (NSException *exception) {
            NSLog(@"%@", exception.reason);
        }
    }
    
    return cell;
}

- (NSArray*) sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return keys;
}

- (NSString *)intToCharString:(NSInteger)number
{
    return [NSString stringWithFormat:@"%c", (char)number];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

@end
