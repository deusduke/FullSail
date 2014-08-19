//
//  WOThumbnailTableViewCell.h
//  WorkOutz
//
//  Created by Deus Duke on 8/15/14.
//  Copyright (c) 2014 DEUS Enterprises. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WOThumbnailTableViewCell : UITableViewCell

@property (weak, nonatomic)  IBOutlet UIImageView* thumbnailImage;
@property (weak, nonatomic)  IBOutlet UILabel* titleLabel;
@property (weak, nonatomic)  IBOutlet UILabel* detailLabel;

- (void) updateImageAsynchWithURL:(NSString*)imageURL;

@end
