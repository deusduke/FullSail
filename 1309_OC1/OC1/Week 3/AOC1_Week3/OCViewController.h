//
//  OCViewController.h
//  AOC1_Week3
//  1309
//
//  Created by Deus Duke on 9/18/13.
//  Copyright (c) 2013 DEUS Enterprises. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OCViewController : UIViewController

// get the sum of two integers
- (NSInteger)Add:(NSInteger)firstValue
                :(NSInteger)secondValue;

// determine if two integers are equal
- (Boolean)Compare:(NSInteger)firstValue
                  :(NSInteger)secondValue;

// append one string to another
- (NSString*) Append:(NSString*)firstString
                   :(NSString*)secondString;

// given a string display an alert
- (void) DisplayAlertWithString:(NSString*)alertString;

@end
