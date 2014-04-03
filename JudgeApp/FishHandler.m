//
//  FishHandler.m
//  JudgeApp
//
//  Created by Andreas Keller on 2014-03-27.
//  Copyright (c) 2014 Andreas Keller. All rights reserved.
//

#import "FishHandler.h"
#import "Fish.h"
#import "ImageHandler.h"

@implementation FishHandler

@synthesize fishArray, jsonArray, fishUrl, imageHandler;
#pragma mark -
#pragma mark Class Methods

- (void) setUrl: (NSString *) url
{
    fishUrl = url;
}


- (void) retreiveData
{
    NSURL * url = [NSURL URLWithString: fishUrl];
    NSData * data = [NSData dataWithContentsOfURL:url];
    //Definitions
    
    jsonArray = [NSJSONSerialization JSONObjectWithData:data options: kNilOptions error:nil];
    
    //Setup appearance array
    fishArray = [[NSMutableArray alloc] init];
    
    //Loop through our jsonArray
    for (int i = 0; i < jsonArray.count; i++)
    {
        NSString * class = [[jsonArray objectAtIndex:i] objectForKey:@"Name"];
        NSInteger counter = [[[jsonArray objectAtIndex:i] objectForKey:@"counter"] integerValue];
        NSString * path = [[jsonArray objectAtIndex:i] objectForKey:@"PicturePath"];
        NSInteger tank = [[[jsonArray objectAtIndex:i] objectForKey:@"Aquarium"] integerValue];
        
        [fishArray addObject:[[Fish alloc]initWithIndex: counter andFishPicPath:path andFishClass:class andFishTank:tank andscoreArray:nil]];

    }
    
}
- (NSInteger) getNbrOfFishes
{
    return fishArray.count;
}
- (NSMutableArray*) getFishList
{
    return fishArray;
}
- (NSString *) getPath: (NSInteger) index
{
    if (index < fishArray.count)
    {
        NSString * path = [[fishArray objectAtIndex:index] valueForKey:@"fishPicPath"];
        return path;
    }
    return nil;
}

- (NSString *) getClass: (NSInteger) index
{
    if (index < fishArray.count)
    {
        NSString * class = [[fishArray objectAtIndex:index] valueForKey:@"fishClass"];
        return class;
    }
    return nil;
}


- (NSInteger) getTank: (NSInteger) index
{
    if (index < fishArray.count)
    {
        NSInteger fishTank = [[[fishArray objectAtIndex:index] valueForKey:@"fishTank"] integerValue];
        return fishTank;
    }
    return 0;
}

- (NSInteger) getFishIndex: (NSInteger) index
{
    if (index < fishArray.count)
    {
        NSInteger fishTank = [[[fishArray objectAtIndex:index] valueForKey:@"fishIndex"] integerValue];
        return fishTank;
    }
    return 0;
}

@end
