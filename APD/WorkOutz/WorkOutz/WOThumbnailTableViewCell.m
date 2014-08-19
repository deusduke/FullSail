//
//  WOThumbnailTableViewCell.m
//  WorkOutz
//
//  Created by Deus Duke on 8/15/14.
//  Copyright (c) 2014 DEUS Enterprises. All rights reserved.
//

#import "WOThumbnailTableViewCell.h"
#import "UIImageView+WebCache.h"

@implementation WOThumbnailTableViewCell

@synthesize titleLabel, detailLabel, imageView;

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

- (void)updateImageAsynchWithURL:(NSString *)imageURL
{
    [self.thumbnailImage sd_setImageWithURL:[NSURL URLWithString:imageURL]
              placeholderImage:[UIImage imageNamed:@"placeholder"]
                       options:SDWebImageRefreshCached];
}

@end
