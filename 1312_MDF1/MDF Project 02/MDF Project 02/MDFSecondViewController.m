//
//  MDFSecondViewController.m
//  MDF Project 02
//
//  Created by Deus Duke on 12/2/13.
//  Copyright (c) 2013 DEUS Enterprises. All rights reserved.
//

#import "MDFSecondViewController.h"
#import "MDFModel.h"
#import "MDFArticleData.h"

@interface MDFSecondViewController ()

@property (strong, nonatomic) MDFModel* model;

@end

@implementation MDFSecondViewController

@synthesize model;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // get a model instance
    model = [[MDFModel alloc] init];
    
    // we'll handle the table view
//    [self.tableView setDelegate:self];
//    [self.tableView setDataSource:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // set the labels on the cell using the model data
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    if (cell != nil)
    {
        MDFArticleData* data = [model.objects objectAtIndex:indexPath.row];
        [cell.textLabel setText: data.header];
    }
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // how many articles do we have
    return model.objects.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    model.currentArticle = [model.objects objectAtIndex:indexPath.row];
}

@end
