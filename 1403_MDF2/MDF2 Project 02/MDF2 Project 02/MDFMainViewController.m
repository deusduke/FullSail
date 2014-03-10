//
//  MDFMainViewController.m
//  MDF2 Project 02
//
//  Created by Deus Duke on 3/9/14.
//  Copyright (c) 2014 DEUS Enterprises. All rights reserved.
//

#import <Accounts/Accounts.h>
#import <Social/Social.h>
#import "MDFMainViewController.h"

@interface MDFMainViewController ()

@end

@implementation MDFMainViewController
@synthesize currentAccount, twitterFriendsData;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // get the current account
    [self getTwitterLogin];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:@"LoginRetrieved" object:self queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note) {
        //make sure we have an account before continuing
        if (currentAccount != nil) {
            [self getTwitterFriends];
        }
        
        else {
            NSLog(@"Could not retrieve user account");
        }
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)getTwitterFriends
{
    NSURL *requestURL = [NSURL URLWithString:@"https://api.twitter.com/1.1/friends/list.json"];
    
    // set parameters for the api call
    NSMutableDictionary *parameters =
    [[NSMutableDictionary alloc] init];
    [parameters setObject:@"20" forKey:@"count"];
    [parameters setObject:@"false" forKey:@"include_user_entities"];
    [parameters setObject:@"true" forKey:@"skip_status"];
    [parameters setObject:@"-1" forKey:@"cursor"];
    
    // build the request
    SLRequest *postRequest = [SLRequest
                              requestForServiceType:SLServiceTypeTwitter
                              requestMethod:SLRequestMethodGET
                              URL:requestURL parameters:parameters];
    
    // set the account
    [postRequest setAccount:currentAccount];
    
    // perform the request and handle response
    [postRequest performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
        if (urlResponse.statusCode >= 200 && urlResponse.statusCode < 300) {
            
            NSError *jsonError;
            twitterFriendsData =
                [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingAllowFragments error:&jsonError];
            
            if (twitterFriendsData != nil) {
                NSLog(@"Twitter Response: %@\n", twitterFriendsData);
                [[self collectionView] reloadData];
            }
            else {
                // JSON deserialization failed
                NSLog(@"JSON Error: %@", [jsonError localizedDescription]);
            }
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"FriendsLoaded" object:self];
        }
        else {
            // Log the server response on error
            NSLog(@"There was an error, the response code was %ld",
                  (long)urlResponse.statusCode);
        }
    }];
}

- (void)getTwitterLogin {
    ACAccountStore *accountStore = [[ACAccountStore alloc] init];
    
    if (accountStore != nil) {
        ACAccountType *accountType = [accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
        
        if (accountType != nil) {
            [accountStore requestAccessToAccountsWithType:accountType options:nil completion:^(BOOL granted, NSError *error) {
                if (granted) {
                    NSArray *twitterAccounts = [accountStore accountsWithAccountType:accountType];
                    
                    if (twitterAccounts != nil) {
                        currentAccount = [twitterAccounts objectAtIndex:0];
                    }
                }
                
                else {
                    NSLog(@"User denied access");
                }
                
                // at the end, post the finished notification
                [[NSNotificationCenter defaultCenter] postNotificationName:@"LoginRetrieved" object:self];
            }];
        }
    }
}

#pragma mark - UICollectionView Stuff

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    if (cell != nil) {
        // load the cell
    }
    
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 0;
}

@end
