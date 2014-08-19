//
//  WOViewRoutinesTableViewController.h
//  WorkOutz
//
//  Created by Deus Duke on 8/15/14.
//  Copyright (c) 2014 DEUS Enterprises. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WOViewRoutinesTableViewController : UITableViewController

@property (nonatomic) NSDictionary* routines;
@property (nonatomic) NSArray* keys;
@property (nonatomic,strong) NSManagedObjectContext* managedObjectContext;

- (NSString*)intToCharString:(NSInteger)number;

@end
