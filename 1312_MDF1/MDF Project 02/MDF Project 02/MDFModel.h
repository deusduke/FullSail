//
//  MDFModel.h
//  MDF Project 02
//
//  Created by Deus Duke on 12/3/13.
//  Copyright (c) 2013 DEUS Enterprises. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MDFArticleData.h"

@interface MDFModel : NSObject

@property (strong, nonatomic) NSMutableArray* objects;
@property (nonatomic, strong) MDFArticleData* currentArticle;
@property (nonatomic, strong) NSString* apa;

@end
