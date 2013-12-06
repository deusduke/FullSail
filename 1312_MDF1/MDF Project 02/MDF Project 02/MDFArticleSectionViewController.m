//
//  MDFArticleSectionViewController.m
//  MDF1 Project 02
//
//  Created by Deus Duke on 12/4/13.
//  Copyright (c) 2013 DEUS Enterprises. All rights reserved.
//

#import "MDFArticleSectionViewController.h"
#import "MDFModel.h"

@interface MDFArticleSectionViewController ()

@end

@implementation MDFArticleSectionViewController

@synthesize body;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    // setup the display
    MDFModel* model = [[MDFModel alloc] init];
    self.title = model.currentArticle.header;
    body.text = model.currentArticle.body;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
