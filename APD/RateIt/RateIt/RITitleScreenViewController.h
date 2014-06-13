//
//  RITitleScreenViewController.h
//  RateIt
//
//  Created by Deus Duke on 6/12/14.
//  Copyright (c) 2014 DEUS Enterprises. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RIRestClient.h"

@interface RITitleScreenViewController : UIViewController

@property (nonatomic) RIRestClient* client;

-(void)checkLogin;

@end
