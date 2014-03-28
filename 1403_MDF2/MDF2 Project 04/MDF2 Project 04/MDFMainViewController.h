//
//  MDFViewController.h
//  MDF2 Project 04
//
//  Created by Deus Duke on 3/26/14.
//  Copyright (c) 2014 DEUS Enterprises. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MDFMovieInfo.h"

@interface MDFMainViewController : UITableViewController<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSMutableArray* movieTheaters;
@property (nonatomic) MDFMovieInfo* currentMovieInfo;

@end
