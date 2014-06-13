//
//  RIProductTableViewCell.h
//  RateIt
//
//  Created by Deus Duke on 6/12/14.
//  Copyright (c) 2014 DEUS Enterprises. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RIProductTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel* nameLabel;
@property (weak, nonatomic) IBOutlet UILabel* reviewsLabel;
@property (weak, nonatomic) IBOutlet UIImageView* star1Image;
@property (weak, nonatomic) IBOutlet UIImageView* star2Image;
@property (weak, nonatomic) IBOutlet UIImageView* star3Image;
@property (weak, nonatomic) IBOutlet UIImageView* star4Image;
@property (weak, nonatomic) IBOutlet UIImageView* star5Image;
@property (weak, nonatomic) IBOutlet UIImageView* productImage;

@end
