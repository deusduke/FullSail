//
//  MDFSearchResultsViewController.m
//  MDF1 Project 04
//
//  Created by Deus Duke on 12/15/13.
//  Copyright (c) 2013 DEUS Enterprises. All rights reserved.
//

#import "MDFSearchResultsViewController.h"
#import "MDFSearchResult.h"

@interface MDFSearchResultsViewController ()

@end

@implementation MDFSearchResultsViewController

@synthesize request, url, connection, searchData, model;

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

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // grab a model
    model = [[MDFModel alloc] init];
    
    // search the walmart api for ps4
    url = [[NSURL alloc] initWithString:@"http://walmartlabs.api.mashery.com/v1/search?query=ps4&format=xml&apiKey=rusf38k9r7s7ccc7x6m535u9"];
    
    // build request
    request = [[NSURLRequest alloc] initWithURL:url];
    if (request != nil)
    {
        connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
        
        self.searchData = [NSMutableData data];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Request data handler
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    if (data != nil)
    {
        // append any addition data
        [self.searchData appendData:data];
    }
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // store for later use
    model.rawXML = [[NSString alloc] initWithData:searchData encoding:NSASCIIStringEncoding];
    
    // parse
    [model parseXml];
    
    // reload the table
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return model.searchResults.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    MDFSearchResult* sr = [model.searchResults objectAtIndex:indexPath.row];
    cell.textLabel.text = sr.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"$%.02f", sr.price];
    cell.imageView.image = sr.thumbnailImage;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    model.currentSearchResult = [model.searchResults objectAtIndex:indexPath.row];
}

@end
