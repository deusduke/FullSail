//
//  WOBorderButton.h
//  WorkOutz
//
//  Created by Deus Duke on 8/13/14.
//  Copyright (c) 2014 DEUS Enterprises. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum NSUInterger {
    BorderLeft = (1 << 0),
    BorderRight = (2 << 0),
    BorderTop = (3 << 0),
    BorderBottom = (4 << 0)
} WOBorderButtonStyle;

@interface WOBorderButton : UIButton

- (void)addBorder;

@end
