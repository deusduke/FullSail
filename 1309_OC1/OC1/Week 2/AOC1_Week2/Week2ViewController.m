//
//  Week2ViewController.m
//  AOC1_Week2
//  1309
//  
//  Created by Deus Duke on 9/12/13.
//  Copyright (c) 2013 DEUS Enterprises. All rights reserved.
//

#import "Week2ViewController.h"

@interface Week2ViewController ()

@end

@implementation Week2ViewController

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
    UIScreen *screen = [UIScreen mainScreen];
    
    // store screen extents for efficiency
    int width = screen.bounds.size.width;
    int smallWidth = width * .4;
    int bigWidth = width * .6;
    
    // used to easily place singleline labels
    int labelHeight = 30;
    int labelHeightWithPadding = labelHeight + 3;
    
    // create the array of strings
    NSArray *keywords = @[@"Whales", @"Ships", @"Harpoons", @"Adventure", @"Crew"];

    // setup the keyword string
    NSMutableString *keywordString = [[NSMutableString alloc] init];
    for (int i = 0; i < 5; ++i) {
        if (i < 4)
            [keywordString appendFormat:@"%@, ", [keywords objectAtIndex:i]];
        else
            [keywordString appendFormat:@"and %@", [keywords objectAtIndex:i]];
    }
    
    // create our labels
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, labelHeight)];
    title.backgroundColor = [UIColor blackColor];
    title.textColor = [UIColor whiteColor];
    title.text = @"Moby Dick";
    title.textAlignment = NSTextAlignmentCenter;
    
    UILabel *author = [[UILabel alloc] initWithFrame:CGRectMake(0, labelHeightWithPadding, smallWidth, labelHeight)];
    author.backgroundColor = [UIColor darkGrayColor];
    author.textColor = [UIColor lightGrayColor];
    author.text = @"Author:";
    author.textAlignment = NSTextAlignmentRight;
    
    UILabel *authorName = [[UILabel alloc] initWithFrame:CGRectMake(smallWidth, labelHeightWithPadding, bigWidth, labelHeight)];
    authorName.backgroundColor = [UIColor greenColor];
    authorName.textColor = [UIColor redColor];
    authorName.text = @"Herman Melville";
    authorName.textAlignment = NSTextAlignmentRight;
    
    UILabel *published = [[UILabel alloc] initWithFrame:CGRectMake(0, labelHeightWithPadding * 2, smallWidth, labelHeight)];
    published.backgroundColor = [UIColor blueColor];
    published.textColor = [UIColor orangeColor];
    published.text = @"Published:";
    published.textAlignment = NSTextAlignmentRight;
    
    UILabel *publishedDate = [[UILabel alloc] initWithFrame:CGRectMake(smallWidth, labelHeightWithPadding * 2, bigWidth, labelHeight)];
    publishedDate.backgroundColor = [UIColor yellowColor];
    publishedDate.textColor = [UIColor purpleColor];
    publishedDate.text = @"October 8th, 1851";
    publishedDate.textAlignment = NSTextAlignmentRight;
    
    UILabel *summary = [[UILabel alloc] initWithFrame:CGRectMake(0, labelHeightWithPadding * 3, smallWidth, labelHeight)];
    summary.backgroundColor = [UIColor cyanColor];
    summary.textColor = [UIColor darkTextColor];
    summary.text = @"Summary:";
    summary.textAlignment = NSTextAlignmentRight;
    
    UILabel *summaryText = [[UILabel alloc]initWithFrame:CGRectMake(0, labelHeightWithPadding * 4, width, labelHeight * 5)];
    summaryText.backgroundColor = [UIColor colorWithRed:240 / 255.0 green:225 / 255.0 blue:225 / 255.0 alpha:1];
    summaryText.textColor = [UIColor colorWithRed:23 / 255.0 green:45 / 255.0 blue:144 / 255.0 alpha:1];
    summaryText.text = @"Moby Dick is a story about a fisherman that hunts a massive sperm whale.  The whale avoids capture at every turn and eventually ends up fighting back and sinking the captains ship.";
    summaryText.textAlignment = NSTextAlignmentCenter;
    summaryText.numberOfLines = 5;
    
    UILabel *listItems = [[UILabel alloc] initWithFrame:CGRectMake(0, labelHeightWithPadding * 9 - 12, smallWidth, labelHeight)];
    listItems.backgroundColor = [UIColor colorWithRed:229 / 255.0 green:166 / 255.0 blue:166 / 255.0 alpha:1];
    listItems.textColor = [UIColor colorWithRed:103 / 255.0 green:35 / 255.0 blue:146 / 255.0 alpha:1];
    listItems.text = @"List of Items:";
    listItems.textAlignment = NSTextAlignmentCenter;
    
    UILabel *keywordText = [[UILabel alloc] initWithFrame:CGRectMake(0, labelHeightWithPadding * 10 - 12, width, labelHeight * 2)];
    keywordText.backgroundColor = [UIColor colorWithRed:101 / 255.0 green:47 / 255.0 blue:0 / 255.0 alpha:1];
    keywordText.textColor = [UIColor colorWithRed:232 / 255.0 green:186 / 255.0 blue:47 / 255.0 alpha:1];
    keywordText.textAlignment = NSTextAlignmentCenter;
    keywordText.text = keywordString;
    keywordText.numberOfLines = 2;
    
    // add labels to view
    [self.view addSubview:title];
    [self.view addSubview:author];
    [self.view addSubview:authorName];
    [self.view addSubview:published];
    [self.view addSubview:publishedDate];
    [self.view addSubview:summary];
    [self.view addSubview:summaryText];
    [self.view addSubview:listItems];
    [self.view addSubview:keywordText];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    
    // call super function
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
