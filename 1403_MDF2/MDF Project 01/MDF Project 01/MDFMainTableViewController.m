//
//  MDFViewController.m
//  MDF Project 01
//
//  Created by Deus Duke on 3/5/14.
//  Copyright (c) 2014 DEUS Enterprises. All rights reserved.
//

#import <Accounts/Accounts.h>
#import <Social/Social.h>
#import "MDFMainTableViewController.h"
#import "MDFTwitterTableViewCellController.h"
#import "MDFTweetDetailViewController.h"
#import "MDFProfileViewController.h"

@interface MDFMainTableViewController ()

@end

@implementation MDFMainTableViewController
@synthesize currentAccount, twitterFeed;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    // wait for the account to be retrieved
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];

    [notificationCenter addObserverForName:@"LoginRetrieved" object:self queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note) {
        //make sure we have an account before continuing
        if (currentAccount != nil) {
            [self getTweets];
        }
        
        else {
            NSLog(@"Could not retrieve user account");
        }
    }];
    
    // store the twitter account initially
    [self getTwitterLogin];
    
    // add the plus button
    UIBarButtonItem *plus = [[UIBarButtonItem alloc] initWithTitle:@"  +" style:UIBarButtonItemStylePlain target:self action:@selector(postTweet:)];
    
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:plus, self.navigationItem.rightBarButtonItem, nil];
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

- (void)getTweets {
    NSURL *requestURL = [NSURL URLWithString:@"https://api.twitter.com/1.1/statuses/home_timeline.json"];

    // set parameters for the api call
    NSMutableDictionary *parameters =
        [[NSMutableDictionary alloc] init];
        [parameters setObject:@"20" forKey:@"count"];
        [parameters setObject:@"1" forKey:@"include_entities"];
    
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
            twitterFeed =
            [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingAllowFragments error:&jsonError];
            
            if (twitterFeed != nil) {
                NSLog(@"Timeline Response: %@\n", twitterFeed);
                [[self tableView] reloadData];
            }
            else {
                // JSON deserialization failed
                NSLog(@"JSON Error: %@", [jsonError localizedDescription]);
            }
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"TweetsLoaded" object:self];
        }
        else {
            // Log the server response on error
            NSLog(@"There was an error, the response code was %ld",
                  (long)urlResponse.statusCode);
        }
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (twitterFeed != nil) {
        return twitterFeed.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    MDFTwitterTableViewCellController *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (cell != nil) {
        NSDictionary* tweetDict = [twitterFeed objectAtIndex:indexPath.row];
        if (tweetDict != nil) {
            cell.tweetDateLabel.text = [tweetDict objectForKey:@"created_at"];
            cell.tweetTextLabel.text = [tweetDict objectForKey:@"text"];
            
            // set placeholder
            cell.tweetIconImage.image = [UIImage imageNamed: @"twitter_bird.png"];
            
            // set remote image url
            cell.tweetIconImage.showActivityIndicator = true;
            NSDictionary* user = [tweetDict objectForKey:@"user"];
            NSString* url = [user objectForKey:@"profile_image_url"];
            if (url != nil)
                cell.tweetIconImage.imageURL = [NSURL URLWithString:url];
        }
        else {
            NSLog(@"Could not get the tweet from the dictionary for %li", (long)indexPath.row);
        }
    }
    
    return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

 #pragma mark - Navigation
 
 // In a story board-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
     
     if ([segue.identifier isEqualToString:@"detail"]) {
         MDFTweetDetailViewController *detailViewController = [segue destinationViewController];
         
         if (detailViewController != nil) {
         
             NSDictionary *currentItem = [twitterFeed objectAtIndex:self.tableView.indexPathForSelectedRow.row];
             
             if (currentItem) {
                 detailViewController.twitterData = currentItem;
             }
         }
         else {
             NSLog(@"Could no get detail view controller");
         }
     }
     
     else if ([segue.identifier isEqualToString:@"profile"]) {
         MDFProfileViewController *profileViewController = [segue destinationViewController];
         
         if (profileViewController != nil) {
             
             profileViewController.currentAccount = currentAccount;
         }
         else {
             NSLog(@"Could no get detail view controller");
         }
     }
 }

- (void)refreshTweets:(id)sender
{
    if (currentAccount){
        
        // show loading alert view
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Loading" message: @"Tweets Loading..." delegate: self cancelButtonTitle: nil otherButtonTitles: nil,nil, nil];
        [alert show];
        
        // hide alert view after tweets load
        [[NSNotificationCenter defaultCenter] addObserverForName:@"TweetsLoaded" object:self queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note) {
            [alert dismissWithClickedButtonIndex:0 animated:YES];
            [self.tableView reloadData];
        }];
        
        // get the tweets
        [self getTweets];
    }
}

- (void)postTweet:(id)sender
{
    SLComposeViewController *composeViewController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    
    if (composeViewController != nil) {
        [composeViewController setInitialText:@"Post from "];
        [self presentViewController:composeViewController animated:YES completion:nil];
    }
}

@end
