//
//  Models.m
//  MDF1 Project 03
//
//  Created by Deus Duke on 12/12/13.
//  Copyright (c) 2013 DEUS Enterprises. All rights reserved.
//

#import "Models.h"

@interface Models()

- (void)initialize;

@end

@implementation Models

@synthesize companies, currentCompany;

static Models *instance;

- (id)init
{
    // return singleton instance
    if (instance == NULL) {
        instance = [super init];
        [instance initialize];
    }
    
    return instance;
}

- (void)initialize
{
    companies = [[NSMutableArray alloc] init];
    Company *company = [[Company alloc] init];
    
    // add a bunch of company information
    company.companyName = @"Tria Beauty";
    company.lattitude = 37.704817;
    company.longitude = -121.917898;
    [companies addObject:company];
    
    company = [[Company alloc] init];
    company.companyName = @"33 Across";
    company.lattitude = 37.379886;
    company.longitude = -122.012483;
    [companies addObject:company];
    
    company = [[Company alloc] init];
    company.companyName = @"Twitter";
    company.lattitude = 34.236748;
    company.longitude = -77.932085;
    [companies addObject:company];
    
    company = [[Company alloc] init];
    company.companyName = @"Facebook";
    company.lattitude = 37.483375;
    company.longitude = -122.149554;
    [companies addObject:company];
    
    company = [[Company alloc] init];
    company.companyName = @"Google";
    company.lattitude = 37.386052;
    company.longitude = -122.083851;
    [companies addObject:company];
    
    company = [[Company alloc] init];
    company.companyName = @"Apple";
    company.lattitude = 37.322998;
    company.longitude = -122.032182;
    [companies addObject:company];
    
    company = [[Company alloc] init];
    company.companyName = @"Groupon";
    company.lattitude = 37.422852;
    company.longitude = -122.132818;
    [companies addObject:company];
    
    company = [[Company alloc] init];
    company.companyName = @"Netflix";
    company.lattitude = 37.235808;
    company.longitude = -121.962375;
    [companies addObject:company];
    
    company = [[Company alloc] init];
    company.companyName = @"Pandora";
    company.lattitude = 37.814049;
    company.longitude = -122.264760;
    [companies addObject:company];
    
    company = [[Company alloc] init];
    company.companyName = @"Pixar";
    company.lattitude = 37.83286;
    company.longitude = -122.28400;
    [companies addObject:company];
    
    company = [[Company alloc] init];
    company.companyName = @"Zynga";
    company.lattitude = 37.77043;
    company.longitude = -122.40394;
    [companies addObject:company];
    
    company = [[Company alloc] init];
    company.companyName = @"Jamba Juice";
    company.lattitude = 37.76651;
    company.longitude = -122.41002;
    [companies addObject:company];
    
    company = [[Company alloc] init];
    company.companyName = @"Adobe";
    company.lattitude = 37.33066;
    company.longitude = -121.89397;
    [companies addObject:company];
    
    company = [[Company alloc] init];
    company.companyName = @"Autodesk";
    company.lattitude = 37.79354;
    company.longitude = -122.39434;
    [companies addObject:company];
    
    company = [[Company alloc] init];
    company.companyName = @"Oracle";
    company.lattitude = 37.79214;
    company.longitude = -122.42506;
    [companies addObject:company];
    
    company = [[Company alloc] init];
    company.companyName = @"Mozilla";
    company.lattitude = 37.78952;
    company.longitude = -122.38904;
    [companies addObject:company];
}

@end
