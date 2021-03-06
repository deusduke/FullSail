//
//  MDFViewController.h
//  MDF1 Project 01
//
//  Created by Deus Duke on 11/26/13.
//  Copyright (c) 2013 DEUS Enterprises. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MDFObject.h"
#import "MDFModel.h"

@interface MDFViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, retain) MDFModel *model;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *editButton;

- (IBAction)onEditButtonPushed:(id)sender;

@end
