//
//  MDFFollowerCollectionViewCell.h
//  MDF2 Project 02
//
//  Created by Deus Duke on 3/9/14.
//  Copyright (c) 2014 DEUS Enterprises. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AsyncImageView.h"

@interface MDFFollowerCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel* usernameLabel;
@property (weak, nonatomic) IBOutlet AsyncImageView* avatarImageView;

@end
