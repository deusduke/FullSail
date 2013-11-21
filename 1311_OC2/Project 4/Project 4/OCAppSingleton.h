//
//  OCAppSingleton.h
//  Project 4
//
//  Created by Deus Duke on 11/17/13.
//  Copyright (c) 2013 DEUS Enterprises. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OCAppSingleton : NSObject

@property (strong, nonatomic) NSString* eventText;
@property (nonatomic, assign) bool firstEventAdded;

+(OCAppSingleton*) getInstance;
-(void) addEvent:(NSString*) eventName
         andDate:(NSDate*) eventDate;
- (NSString *)getFormattedEventText:(NSString *)eventText
                           withDate:(NSDate *)theDate;

@end
