//
//  RIProductTableViewCell.m
//  RateIt
//
//  Created by Deus Duke on 6/12/14.
//  Copyright (c) 2014 DEUS Enterprises. All rights reserved.
//

#import "RIProductTableViewCell.h"

@implementation RIProductTableViewCell

@synthesize nameLabel, reviewsLabel, star1Image, star2Image, star3Image, star4Image, star5Image;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
