//
//  MDFViewController.m
//  MDF2 Project 04
//
//  Created by Deus Duke on 3/26/14.
//  Copyright (c) 2014 DEUS Enterprises. All rights reserved.
//

#import "MDFMainViewController.h"
#import "MDFTheaterInfo.h"
#import "MDFMovieInfo.h"
#import "MDFMovieCellTableViewCell.h"
#import "MDFMovieDetailsViewController.h"

@interface MDFMainViewController ()

@end

@implementation MDFMainViewController

@synthesize movieTheaters, currentMovieInfo;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // initialize the movie theaters
    movieTheaters = [[NSMutableArray alloc] init];
    
    // create the movies
    MDFMovieInfo* movie1 = [[MDFMovieInfo alloc] init];
    movie1.name = @"300 Rise of an Empire";
    movie1.trailerUrl = @"300_Rise_Of_An_Empire_Trailer_4_A_5.1-720p-HDTN.mp4";
    movie1.showTimes = [NSArray arrayWithObjects: @"10:00am", @"12:00pm", @"2:00pm", @"4:00pm", @"8:00pm", nil];
    movie1.image = @"300-rise-of-an-empire-eva-green-2";
    
    MDFMovieInfo* movie2 = [[MDFMovieInfo alloc] init];
    movie2.name = @"The Lego Movie";
    movie2.trailerUrl = @"20140131_thelegomovie_featurettemanofplastic_3192.mp4";
    movie2.showTimes = [NSArray arrayWithObjects: @"9:00am", @"11:00am", @"5:00pm", @"7:00pm", @"9:00pm", nil];
    movie2.image = @"The_Lego_Movie_poster";
    
    MDFMovieInfo* movie3 = [[MDFMovieInfo alloc] init];
    movie3.name = @"Captain America 2";
    movie3.trailerUrl = @"20140304_captainamerica2_defendtvspot_3192.mp4";
    movie3.showTimes = [NSArray arrayWithObjects: @"10:30am", @"11:30am", @"2:15pm", @"3:45pm", @"6:00pm", nil];
    movie3.image = @"captain-america-2-empire-cover-photo-lead";
    
    MDFMovieInfo* movie4 = [[MDFMovieInfo alloc] init];
    movie4.name = @"Oculus";
    movie4.trailerUrl = @"20140314_oculus_trailer2_3192.mp4";
    movie4.showTimes = [NSArray arrayWithObjects: @"10:00am", @"2:00pm", @"6:00pm", @"8:00pm", @"10:00pm", nil];
    movie4.image = @"Oculus-poster-with-Karen-Gillan";
    
    MDFMovieInfo* movie5 = [[MDFMovieInfo alloc] init];
    movie5.name = @"Non-Stop";
    movie5.trailerUrl = @"518114876_4.mp4";
    movie5.showTimes = [NSArray arrayWithObjects: @"8:40am", @"11:10am", @"5:00pm", @"9:00pm", @"10:00pm", nil];
    movie5.image = @"non_stop";
    
    MDFMovieInfo* movie6 = [[MDFMovieInfo alloc] init];
    movie6.name = @"Divergent";
    movie6.trailerUrl = @"divergent-tvspot_h720p.mov";
    movie6.showTimes = [NSArray arrayWithObjects: @"8:00am", @"10:00am", @"2:00pm", @"4:00pm", @"8:00pm", nil];
    movie6.image = @"Divergent_hq";
    
    MDFMovieInfo* movie7 = [[MDFMovieInfo alloc] init];
    movie7.name = @"Need for Speed";
    movie7.trailerUrl = @"3needforspeed-biggame_h720p.mov";
    movie7.showTimes = [NSArray arrayWithObjects: @"8:00am", @"10:00am", @"12:00pm", @"2:00pm", @"4:00pm", nil];
    movie7.image = @"Need-for-Speed-Movie";
    
    MDFTheaterInfo* tInfo = [[MDFTheaterInfo alloc] init];
    tInfo.name = @"Grand lake Theater";
    tInfo.location = @"Oakland, CA (.5 miles away)";
    tInfo.image = @"grand_lake.jpg";
    tInfo.movieInfo = [NSArray arrayWithObjects:movie1, movie2, movie3, movie4, movie5, nil];
    [movieTheaters addObject:tInfo];
    
    tInfo = [[MDFTheaterInfo alloc] init];
    tInfo.name = @"Jack London Theater";
    tInfo.location = @"Oakland, CA (1.2 miles away)";
    tInfo.image = @"jack_london";
    tInfo.movieInfo = [NSArray arrayWithObjects:movie6, movie4, movie7, movie2, movie6, nil];
    [movieTheaters addObject:tInfo];

    tInfo = [[MDFTheaterInfo alloc] init];
    tInfo.name = @"Century Theater";
    tInfo.location = @"Freemont, CA (5.8 miles away)";
    tInfo.image = @"century.jpg";
    tInfo.movieInfo = [NSArray arrayWithObjects:movie2, movie5, movie4, movie1, movie3, nil];
    [movieTheaters addObject:tInfo];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // return the number of theaters
    return movieTheaters.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // return the number of movies for this theater
    return ((NSArray*)[[movieTheaters objectAtIndex:section] movieInfo]).count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    // pull info and format the title
    MDFTheaterInfo* info = (MDFTheaterInfo*)[movieTheaters objectAtIndex:section];
    return [NSString stringWithFormat:@"%@ - %@", info.name, info.location];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // setup the cell details
    MDFTheaterInfo* tInfo = (MDFTheaterInfo*)[movieTheaters objectAtIndex: indexPath.section];
    MDFMovieInfo* mInfo = (MDFMovieInfo*)[tInfo.movieInfo objectAtIndex:indexPath.row];
    
    MDFMovieCellTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell && mInfo) {
        cell.thumbnail.image = [UIImage imageNamed:mInfo.image];
        cell.nameLabel.text = mInfo.name;
        cell.showtime1Label.text = (NSString*)[mInfo.showTimes objectAtIndex:0];
        cell.showtime2Label.text = (NSString*)[mInfo.showTimes objectAtIndex:1];
        cell.showtime3Label.text = (NSString*)[mInfo.showTimes objectAtIndex:2];
    }
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    MDFMovieDetailsViewController* controller = (MDFMovieDetailsViewController*) segue.destinationViewController;
    
    // pass the movie info to the view controller
    NSIndexPath* indexPath = self.tableView.indexPathForSelectedRow;
    controller.movieInfo = (MDFMovieInfo*)[((MDFTheaterInfo*) [movieTheaters objectAtIndex:indexPath.section]).movieInfo objectAtIndex:indexPath.row];
}

@end
