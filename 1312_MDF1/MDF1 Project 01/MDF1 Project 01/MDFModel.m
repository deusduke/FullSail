//
//  MDFModel.m
//  MDF1 Project 01
//
//  Created by Deus Duke on 11/26/13.
//  Copyright (c) 2013 DEUS Enterprises. All rights reserved.
//

#import "MDFModel.h"

@implementation MDFModel

@synthesize objects;

- (void)initialize
{
    [self setObjects:[[NSMutableArray alloc] init]];
    
    // add all the data
    MDFObject* obj = [[MDFObject alloc] init];
    
    [obj setName:@"Super Mario Brothers 3"];
    [obj setPlatform:@"Nintendo Entertainment System"];
    [obj setYearReleased:1988];
    [obj setCopiesSold:18];
    [obj setDescription:@"Mario and Luigi make their first appearance on the list at number 20. Obviously, it won’t be the last for the most iconic video game franchise of all-time."];
    [[self objects] addObject:obj];
    
    obj = [[MDFObject alloc] init];
    [obj setName:@"Super Mario Land"];
    [obj setPlatform:@"Game Boy"];
    [obj setYearReleased:1989];
    [obj setCopiesSold:18.06];
    [obj setDescription:@"I don’t know about you, but I probably spend about six weeks of my life playing this game. And I don’t mean I played it for six weeks and then got bored with it. I mean, if you add up all the hours I played it, the total would be well over one thousand.\n\
And God knows how many batteries I sent to the landfill.\n\
(Yes, kids, in the olden days, portable video games ran are regular double-A batteries.)"];
    [[self objects] addObject:obj];
    
    obj = [[MDFObject alloc] init];
    [obj setName:@"Brain Age"];
    [obj setPlatform:@"Nintendo DS"];
    [obj setYearReleased:2006];
    [obj setCopiesSold:18.96];
    [obj setDescription:@"Brain Age 2 did pretty well, but not as well as the original."];
    [[self objects] addObject:obj];
    
    obj = [[MDFObject alloc] init];
    [obj setName:@"The Sims 2"];
    [obj setPlatform:@"PC"];
    [obj setYearReleased:2004];
    [obj setCopiesSold:20];
    [obj setDescription:@"In an age when the world of gaming was dominated by consoles, the fact that a PC game sold 20,000,000 copies is astounding."];
    [[self objects] addObject:obj];
    
    obj = [[MDFObject alloc] init];
    [obj setName:@"Wii Fit Plus"];
    [obj setPlatform:@"Nintendo Wii"];
    [obj setYearReleased:2009];
    [obj setCopiesSold:20.48];
    [obj setDescription:@"I honestly have no idea what the difference was between Wii Fit and Wii Fit Plus. But—SPOILER ALERT—they’re both on the list."];
    [[self objects] addObject:obj];
    
    obj = [[MDFObject alloc] init];
    [obj setName:@"Super Mario World"];
    [obj setPlatform:@"Super Nintendo"];
    [obj setYearReleased:1990];
    [obj setCopiesSold:20.6];
    [obj setDescription:@"The first Mario title for the SNES surely had it’s sales boosted because it was bundled with the console. However, I think it probably would have sold just as many copies if it had been sold separately. Nintendo and Mario go together like spaghetti and meatballs."];
    [[self objects] addObject:obj];
    
    obj = [[MDFObject alloc] init];
    [obj setName:@"Mario Kart DS"];
    [obj setPlatform:@"Nintendo DS"];
    [obj setYearReleased:2005];
    [obj setCopiesSold:22.57];
    [obj setDescription:@"I’m not going to lie—I bought a DS just so I could play Mario Kart on the subway."];
    [[self objects] addObject:obj];
    
    obj = [[MDFObject alloc] init];
    [obj setName:@"Wii Fit"];
    [obj setPlatform:@"Nintendo Wii"];
    [obj setYearReleased:2008];
    [obj setCopiesSold:22.67];
    [obj setDescription:@"Sure, you could just go for a run or ride your bike, but getting fit from a video game just sounds so much better.\n\
It’s a shame nobody got fit from Wii Fit."];
    [[self objects] addObject:obj];
    
    obj = [[MDFObject alloc] init];
    [obj setName:@"Pokémon Gold and Silver"];
    [obj setPlatform:@"Game Boy"];
    [obj setYearReleased:2000];
    [obj setCopiesSold:23];
    [obj setDescription:@"Yes, more Pokémon. I think they code subliminal messages into the games to get kids addicted."];
    [[self objects] addObject:obj];
    
    obj = [[MDFObject alloc] init];
    [obj setName:@"Nintendogs"];
    [obj setPlatform:@"Nintendo DS"];
    [obj setYearReleased:2005];
    [obj setCopiesSold:23.64];
    [obj setDescription:@"Speaking of nonsense that kids like…Nintendogs, everyone."];
    [[self objects] addObject:obj];
    
    obj = [[MDFObject alloc] init];
    [obj setName:@"Pokémon Red and Blue"];
    [obj setPlatform:@"Game Boy"];
    [obj setYearReleased:1998];
    [obj setCopiesSold:23.64];
    [obj setDescription:@"This is the fifth and final entry from the Pokémon franchise. "];
    [[self objects] addObject:obj];
    
    obj = [[MDFObject alloc] init];
    [obj setName:@"Kinect Adventures"];
    [obj setPlatform:@"Xbox 360"];
    [obj setYearReleased:2010];
    [obj setCopiesSold:24];
    [obj setDescription:@"Kinect Adventures was one of those titles that was included in a console bundle (or console ad-on bundle) that probably drove hardware sales. I mean, if Kinect didn’t have a really excellent software package right out of the box, people just wouldn’t have been so excited about motion detection."];
    [[self objects] addObject:obj];
    
    obj = [[MDFObject alloc] init];
    [obj setName:@"New Super Mario Brothers Wii"];
    [obj setPlatform:@"Nintendo Wii"];
    [obj setYearReleased:2009];
    [obj setCopiesSold:27.61];
    [obj setDescription:@"Super Mario Galaxy was the first Mario offering for Wii and a critical favorite. However, casual gamers really went nuts for the more traditional New Super Marios Brothers Wii…hence the 27,610,000 copies sold."];
    [[self objects] addObject:obj];
    
    obj = [[MDFObject alloc] init];
    [obj setName:@"Wii Play"];
    [obj setPlatform:@"Nintendo Wii"];
    [obj setYearReleased:2006];
    [obj setCopiesSold:28.02];
    [obj setDescription:@"The Wii was the ultimate party console, and Wii Play, with its multitude of small learning-curve minigames, was the ultimate party game."];
    [[self objects] addObject:obj];
    
    obj = [[MDFObject alloc] init];
    [obj setName:@"New Super Mario Brothers"];
    [obj setPlatform:@"Nintendo DS"];
    [obj setYearReleased:2006];
    [obj setCopiesSold:28.02];
    [obj setDescription:@"New Super Mario Brothers for the DS was the second best-selling Mario title (excluding spinoffs) of all-time."];
    [[self objects] addObject:obj];
    
    obj = [[MDFObject alloc] init];
    [obj setName:@"Wii Sports Resort"];
    [obj setPlatform:@"Nintendo Wii"];
    [obj setYearReleased:2009];
    [obj setCopiesSold:31.54];
    [obj setDescription:@"They called it Wii Sports Resort, but could just have easily called it Wii Sports II. "];
    [[self objects] addObject:obj];
    
    obj = [[MDFObject alloc] init];
    [obj setName:@"Mario Kart Wii"];
    [obj setPlatform:@"Nintendo Wii"];
    [obj setYearReleased:2008];
    [obj setCopiesSold:34.01];
    [obj setDescription:@"Warning: this video has a LOT of very hilarious but very NSFW language. Don’t watch it if you’re a kid, or at work, or if your grandma is nearby, or whatever. However, if you’re in a bunker deep below the earth all by yourself, then watch it, because it’s a great review."];
    [[self objects] addObject:obj];
    
    obj = [[MDFObject alloc] init];
    [obj setName:@"Tetris"];
    [obj setPlatform:@"Game Boy"];
    [obj setYearReleased:1989];
    [obj setCopiesSold:35];
    [obj setDescription:@"Tetris was released for NES and sold something like 8 million copies. However, by including it with the revolutionary Game Boy, Nintendo made Tetris one of the top three best-selling video games of all-time."];
    [[self objects] addObject:obj];
    
    obj = [[MDFObject alloc] init];
    [obj setName:@"Super Mario Brothers"];
    [obj setPlatform:@"Nintendo Entertainment System"];
    [obj setYearReleased:1985];
    [obj setCopiesSold:40.24];
    [obj setDescription:@"Yes, Super Mario Brothers was bundled with the NES. But you know it would still have sold almost as well even if it wasn’t. It’s one of the best, most iconic videogames ever."];
    [[self objects] addObject:obj];
    
    obj = [[MDFObject alloc] init];
    [obj setName:@"Wii Sports"];
    [obj setPlatform:@"Nintendo Wii"];
    [obj setYearReleased:2006];
    [obj setCopiesSold:81.64];
    [obj setDescription:@"Wii Sports is the real reason why I couldn’t possibly have excluded bundled games from this list. There’s no doubt in my mind that the Wii console wouldn’t have been nearly as successful as it was if it didn’t come with an extremely entertaining game that made maximum use of the system’s motion-detection capabilities.\n\
Put simply, people bought the Wii just so they could bowl and play tennis in their living rooms. And that is impressive."];
    [[self objects] addObject:obj];
}

@end
