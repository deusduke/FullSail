//
//  MDFModel.h
//  MDF1 Project 04
//
//  Created by Deus Duke on 12/15/13.
//  Copyright (c) 2013 DEUS Enterprises. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MDFSearchResult.h"

@interface MDFModel : NSObject <NSXMLParserDelegate>

@property (strong, nonatomic) NSMutableArray* searchResults;
@property (strong, nonatomic) MDFSearchResult* currentSearchResult;
@property (strong, nonatomic) NSString* rawXML;

- (void)parseXml;

@end
