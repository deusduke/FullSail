//
//  WOViewRoutinesTableViewController.m
//  WorkOutz
//
//  Created by Deus Duke on 8/15/14.
//  Copyright (c) 2014 DEUS Enterprises. All rights reserved.
//

#import "WOViewRoutinesTableViewController.h"
#import "WOThumbnailTableViewCell.h"

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
    
    // setup dummy data
    routines = @{
                 @"A": @[@"A Routine Name 1", @"A Routine Name 2", @"A Routine Name 3", @"A Routine Name 4", @"A Routine Name 5"],
                 @"B": @[@"B Routine Name 1", @"B Routine Name 2", @"B Routine Name 3", @"B Routine Name 4", @"B Routine Name 5"],
                 @"C": @[@"C Routine Name 1", @"C Routine Name 2", @"C Routine Name 3", @"C Routine Name 4", @"C Routine Name 5"],
                 @"D": @[@"D Routine Name 1", @"D Routine Name 2", @"D Routine Name 3", @"D Routine Name 4", @"D Routine Name 5"],
                 @"E": @[@"E Routine Name 1", @"E Routine Name 2", @"E Routine Name 3", @"E Routine Name 4", @"E Routine Name 5"],
                 @"F": @[@"F Routine Name 1", @"F Routine Name 2", @"F Routine Name 3", @"F Routine Name 4", @"F Routine Name 5"],
                 @"G": @[@"G Routine Name 1", @"G Routine Name 2", @"G Routine Name 3", @"G Routine Name 4", @"G Routine Name 5"],
                 @"H": @[@"H Routine Name 1", @"H Routine Name 2", @"H Routine Name 3", @"H Routine Name 4", @"H Routine Name 5"],
                 @"I": @[@"I Routine Name 1", @"I Routine Name 2", @"I Routine Name 3", @"I Routine Name 4", @"I Routine Name 5"],
                 @"J": @[@"J Routine Name 1", @"J Routine Name 2", @"J Routine Name 3", @"J Routine Name 4", @"J Routine Name 5"],
                 @"K": @[@"K Routine Name 1", @"K Routine Name 2", @"K Routine Name 3", @"K Routine Name 4", @"K Routine Name 5"],
                 @"L": @[@"L Routine Name 1", @"L Routine Name 2", @"L Routine Name 3", @"L Routine Name 4", @"L Routine Name 5"],
                 @"M": @[@"M Routine Name 1", @"M Routine Name 2", @"M Routine Name 3", @"M Routine Name 4", @"M Routine Name 5"],
                 @"N": @[@"N Routine Name 1", @"N Routine Name 2", @"N Routine Name 3", @"N Routine Name 4", @"N Routine Name 5"],
                 @"O": @[@"O Routine Name 1", @"O Routine Name 2", @"O Routine Name 3", @"O Routine Name 4", @"O Routine Name 5"],
                 @"P": @[@"P Routine Name 1", @"P Routine Name 2", @"P Routine Name 3", @"P Routine Name 4", @"P Routine Name 5"],
                 @"Q": @[@"Q Routine Name 1", @"Q Routine Name 2", @"Q Routine Name 3", @"Q Routine Name 4", @"Q Routine Name 5"],
                 @"R": @[@"R Routine Name 1", @"R Routine Name 2", @"R Routine Name 3", @"R Routine Name 4", @"R Routine Name 5"],
                 @"S": @[@"S Routine Name 1", @"S Routine Name 2", @"S Routine Name 3", @"S Routine Name 4", @"S Routine Name 5"],
                 @"T": @[@"T Routine Name 1", @"T Routine Name 2", @"T Routine Name 3", @"T Routine Name 4", @"T Routine Name 5"],
                 @"U": @[@"U Routine Name 1", @"U Routine Name 2", @"U Routine Name 3", @"U Routine Name 4", @"U Routine Name 5"],
                 @"V": @[@"V Routine Name 1", @"V Routine Name 2", @"V Routine Name 3", @"V Routine Name 4", @"V Routine Name 5"],
                 @"W": @[@"W Routine Name 1", @"W Routine Name 2", @"W Routine Name 3", @"W Routine Name 4", @"W Routine Name 5"],
                 @"X": @[@"X Routine Name 1", @"X Routine Name 2", @"X Routine Name 3", @"X Routine Name 4", @"X Routine Name 5"],
                 @"Y": @[@"Y Routine Name 1", @"Y Routine Name 2", @"Y Routine Name 3", @"Y Routine Name 4", @"Y Routine Name 5"],
                 @"Z": @[@"Z Routine Name 1", @"Z Routine Name 2", @"Z Routine Name 3", @"Z Routine Name 4", @"Z Routine Name 5"]};
    
    keys = @[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z"];
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
    return [routines count];
}

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
        
        NSArray* values = (NSArray*)[routines valueForKey:(NSString*)[keys objectAtIndex:indexPath.section]];
        cell.titleLabel.text = [values objectAtIndex:indexPath.row];
        cell.detailLabel.text = @"Weighted reps";
        
        cell.thumbnailImage.image = [UIImage imageNamed:imageName];
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
