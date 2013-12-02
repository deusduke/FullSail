//
//  MDFCell.m
//  MDF1 Project 01
//
//  Created by Deus Duke on 11/26/13.
//  Copyright (c) 2013 DEUS Enterprises. All rights reserved.
//

#import "MDFCell.h"
#import "MDFObject.h"

@interface MDFCell()

@property (nonatomic) MDFObject* modelObject;

@end

@implementation MDFCell

@synthesize nameLabel, image, detailLabel, modelObject;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) setObject: (MDFObject*) object
{
    self.modelObject = object;
    
    [nameLabel setText:object.name];
    [detailLabel setText:[NSString stringWithFormat:@"%.02f Million Units Sold", object.copiesSold]];
    [image setImage:[object ImageForThumbnail]];
}

@end
