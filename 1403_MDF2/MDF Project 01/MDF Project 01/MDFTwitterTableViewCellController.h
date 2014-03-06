//
//  MDFTwitterTableViewCellController.h
//  MDF Project 01
//
//  Created by Deus Duke on 3/6/14.
//  Copyright (c) 2014 DEUS Enterprises. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MDFTwitterTableViewCellController : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel* tweetDateLabel;
@property (weak, nonatomic) IBOutlet UILabel* tweetTextLabel;
@property (weak, nonatomic) IBOutlet UIImage* tweetIconImage;

@end
