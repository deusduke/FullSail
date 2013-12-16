//
//  MDFRawXMLViewController.h
//  MDF1 Project 04
//
//  Created by Deus Duke on 12/15/13.
//  Copyright (c) 2013 DEUS Enterprises. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MDFModel.h"

@interface MDFRawXMLViewController : UIViewController

@property (strong, nonatomic) MDFModel* model;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end
