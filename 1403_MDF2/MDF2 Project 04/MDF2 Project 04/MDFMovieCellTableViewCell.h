//
//  MDFMovieCellTableViewCell.h
//  MDF2 Project 04
//
//  Created by Deus Duke on 3/27/14.
//  Copyright (c) 2014 DEUS Enterprises. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MDFMovieCellTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView* thumbnail;
@property (weak, nonatomic) IBOutlet UILabel* nameLabel;
@property (weak, nonatomic) IBOutlet UILabel* showtime1Label;
@property (weak, nonatomic) IBOutlet UILabel* showtime2Label;
@property (weak, nonatomic) IBOutlet UILabel* showtime3Label;

@end
