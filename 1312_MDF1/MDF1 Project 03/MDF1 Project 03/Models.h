//
//  Models.h
//  MDF1 Project 03
//
//  Created by Deus Duke on 12/12/13.
//  Copyright (c) 2013 DEUS Enterprises. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Company.h"

@interface Models : NSObject

@property (strong, nonatomic) NSMutableArray *companies;
@property (strong, nonatomic) Company *currentCompany;

@end
