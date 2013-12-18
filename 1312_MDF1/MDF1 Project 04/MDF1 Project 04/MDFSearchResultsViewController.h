//
//  MDFSearchResultsViewController.h
//  MDF1 Project 04
//
//  Created by Deus Duke on 12/15/13.
//  Copyright (c) 2013 DEUS Enterprises. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MDFModel.h"

@interface MDFSearchResultsViewController : UITableViewController <NSURLConnectionDataDelegate, UITabBarControllerDelegate>

@property (nonatomic, retain) NSURLRequest* request;
@property (nonatomic, retain) NSURL *url;
@property (nonatomic, retain) NSURLConnection *connection;
@property (nonatomic, retain) NSMutableData *searchData;
@property (nonatomic, retain) MDFModel *model;

@end
