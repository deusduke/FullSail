//
//  MDFGameDetailsViewController.h
//  MDF1 Project 01
//
//  Created by Deus Duke on 12/1/13.
//  Copyright (c) 2013 DEUS Enterprises. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MDFObject.h"

@interface MDFGameDetailsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView* image;
@property (weak, nonatomic) IBOutlet UILabel* nameLabel;
@property (weak, nonatomic) IBOutlet UILabel* platformLabel;
@property (weak, nonatomic) IBOutlet UILabel* yearLabel;
@property (weak, nonatomic) IBOutlet UILabel* copiesLabel;
@property (weak, nonatomic) IBOutlet UITextView* descriptionTextView;

- (void)setModelObject:(MDFObject*)theObject;

@end
