//
//  MDFModel.m
//  MDF1 Project 04
//
//  Created by Deus Duke on 12/15/13.
//  Copyright (c) 2013 DEUS Enterprises. All rights reserved.
//

#import "MDFModel.h"
#import "MDFSearchResult.h"
#import "MDFSearchResult.h"

@interface MDFModel()

@property MDFSearchResult* currentResultForParse;
@property NSString* currentItemString;

@end

@implementation MDFModel

@synthesize searchResults, currentSearchResult, rawXML, currentResultForParse, currentItemString;

static MDFModel* instance;

- (id)init
{
    self = [super init];
    if (instance == nil)
    {
        instance = [super init];
        instance.searchResults = [[NSMutableArray alloc] init];
        instance.currentItemString = @"";
    }
    
    return instance;
}

- (void)parseXml
{
    // parse the xml into the model
    searchResults = [[NSMutableArray alloc] init];
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:[self.rawXML dataUsingEncoding:NSASCIIStringEncoding]];
    [parser setDelegate:self];
    [parser parse];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    // make sure are current result isn't nil
    if ([elementName isEqualToString:@"item"])
    {
        // new item, initialize
        currentResultForParse = [[MDFSearchResult alloc] init];
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    currentItemString = [currentItemString stringByAppendingString:string];
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    // if item, assign and empty out the current result
    if ([elementName isEqualToString:@"item"])
    {
        [searchResults addObject:currentResultForParse];
        currentResultForParse = nil;
    }
    
    // otherwise check for attribues and update the current result
    else if (currentResultForParse != nil)
    {
        if ([elementName isEqualToString:@"name"])
        {
            currentResultForParse.name = currentItemString;
        }
        else if ([elementName isEqualToString:@"salePrice"])
        {
            currentResultForParse.price = [currentItemString floatValue];
        }
        else if ([elementName isEqualToString:@"categoryPath"])
        {
            currentResultForParse.categoryPath = currentItemString;
        }
        else if ([elementName isEqualToString:@"shortDescription"])
        {
            currentResultForParse.shortDescription = currentItemString;
        }
        else if ([elementName isEqualToString:@"standardShipRate"])
        {
            currentResultForParse.shipCost = [currentItemString floatValue];
        }
        else if ([elementName isEqualToString:@"thumbnailImage"])
        {
            currentResultForParse.thumbnailImage = currentItemString;
        }
        else if ([elementName isEqualToString:@"availableOnline"])
        {
            currentResultForParse.availableOnline = [currentItemString boolValue];
        }
    }
    
    // empty out current chars
    currentItemString = @"";
}

@end
