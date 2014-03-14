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
#import "MDFFollowerInfo.h"
#import "MDFFollowerCollectionViewCell.h"
#import "MDFFriendViewController.h"

@interface MDFMainViewController ()

@end

@implementation MDFMainViewController
@synthesize currentAccount, twitterFriendsArray, selectedIndexPath, placholderImage;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // set the placeholder image
    placholderImage = [UIImage imageNamed:@"twitter_bird.png"];
    
    // initialize the array
    twitterFriendsArray = [[NSMutableArray alloc] init];
    
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
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadTableView:) name:@"FriendsLoaded" object:self];
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
            NSDictionary* twitterFriendsData =
                [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingAllowFragments error:&jsonError];
            
            if (twitterFriendsData != nil) {
                NSLog(@"Twitter Response: %@\n", twitterFriendsData);
                
                // if we recieved twitter data, cycle through and add items to array
                NSArray *users = [twitterFriendsData objectForKey:@"users"];
                
                if (users != nil) {
                    for (NSDictionary* user in users) {
                        // once we drill down into the users, store in our array
                        MDFFollowerInfo *followerInfo = [[MDFFollowerInfo alloc] init];
                        
                        NSString* urlString = [user objectForKey:@"profile_image_url"];
                        NSString* userName = [user objectForKey:@"screen_name"];
                        
                        NSURL* url = [NSURL URLWithString:urlString];
                        
                        [followerInfo setImageURL:url];
                        [followerInfo setUserName:userName];
                        
                        [twitterFriendsArray addObject:followerInfo];
                        
                        // extra measure to ensure we only load 20 objects
                        if (twitterFriendsArray.count == 20) {
                            break;
                        }
                    }
                    
                    NSLog(@"%lu items loaded", (unsigned long)[twitterFriendsArray count]);
                }
                else {
                    NSLog(@"Could not get users from data");
                }
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
            
            [self showError:@"There was a problem connecting to the internet"];
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
                    
                    [self showError:@"We need access to your twitter account in order to show your friends"];
                }
                
                // at the end, post the finished notification
                [[NSNotificationCenter defaultCenter] postNotificationName:@"LoginRetrieved" object:self];
            }];
        }
    }
}

- (void)reloadTableView:(NSNotification *)note
{
    // reload of table data has to happen on the main thread to be instant
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.collectionView reloadData];
    });
}

- (void)showError:(NSString *)message
{
    // setup alert and show
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"There was an error" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    [alert show];
}

#pragma mark - UICollectionView Stuff

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MDFFollowerCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    if (cell != nil && twitterFriendsArray != nil) {
        // pull the info from the array and display
        MDFFollowerInfo *info = [twitterFriendsArray objectAtIndex:indexPath.row];
        
        if (info) {
            cell.avatarImageView.image = placholderImage;
            cell.avatarImageView.imageURL= info.imageURL;
            cell.usernameLabel.text = info.userName;
        }
        else {
            NSLog(@"Could not get info from array at %li", indexPath.row);
        }
    }
    
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (twitterFriendsArray != nil)
        return twitterFriendsArray.count;
    else
        return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 25;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedIndexPath = indexPath;
    
    NSLog(@"Selected friend %li", (long)indexPath.row);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    MDFFriendViewController* friendViewController = [segue destinationViewController];
    
    MDFFollowerCollectionViewCell* cell = nil;
    
    // find and set the selected cell
    for (MDFFollowerCollectionViewCell* cvCell in [self.collectionView visibleCells])
    {
        NSLog(@"%@", cvCell.usernameLabel.text);
        
        if (cvCell.selected) {
            cell = cvCell;
            NSLog(@"Found the target cell");
            NSLog(@"Cell index is %li", [self.collectionView indexPathForCell:cell].row);
            break;
        }
    }
    
    if (friendViewController && cell) {
        // get friend info and prepare the view
        MDFFollowerInfo* currentInfo = [twitterFriendsArray objectAtIndex:[self.collectionView indexPathForCell:cell].row];
        
        if (currentInfo)
            NSLog(@"%@", currentInfo);
        else
            NSLog(@"Couldn't get the info fromt he array");
        
        if (currentInfo) {
            NSLog(@"Moving to screen for %@", currentInfo.userName);
            friendViewController.followerInfo = currentInfo;
        }
    }
}

@end
