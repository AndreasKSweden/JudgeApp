//
//  AppearanceHandler.m
//  JudgeApp
//
//  Created by Andreas Keller on 2014-03-26.
//  Copyright (c) 2014 Andreas Keller. All rights reserved.
//

#import "AppearanceHandler.h"
#import "Appearance.h"

@implementation AppearanceHandler
@synthesize appearanceArray, jsonArray, appearanceUrl;


#pragma mark -
#pragma mark Class Methods

- (void) setUrl: (NSString *) url
{
    appearanceUrl = url;
}

- (NSInteger) getNbrOfAppearance
{
    return _nbrOfAppearance;
    
}
- (void) retreiveData
{
    NSURL * url = [NSURL URLWithString: appearanceUrl];
    NSData * data = [NSData dataWithContentsOfURL:url];
    _nbrOfAppearance = 0;
    jsonArray = [NSJSONSerialization JSONObjectWithData:data options: kNilOptions error:nil];

    //Setup appearance array
    appearanceArray = [[NSMutableArray alloc] init];
    
    //Loop through our jsonArray
    for (int i = 0; i < jsonArray.count; i++)
    {
        NSString * appName = [[jsonArray objectAtIndex:i] objectForKey:@"Name"];
        NSInteger appIndex = [[[jsonArray objectAtIndex:i] objectForKey:@"counter"] integerValue];
        NSInteger appMin = [[[jsonArray objectAtIndex:i] objectForKey:@"Min"] integerValue];
        NSInteger appMax = [[[jsonArray objectAtIndex:i] objectForKey:@"Max"] integerValue];
        NSInteger appWeight = [[[jsonArray objectAtIndex:i] objectForKey:@"Weight"] integerValue];
        
        [appearanceArray addObject:[[Appearance alloc]initWithAppearanceName:appName andAppearanceIndex:appIndex andAppearanceMin:appMin andAppearanceMax:appMax andAppearanceWeight:appWeight]];
    }
    _nbrOfAppearance = jsonArray.count;
    
}
- (NSInteger) getNbrOfAppearances
{
    return appearanceArray.count;
}
- (NSMutableArray*) getAppearanceList
{
    return appearanceArray;
}
@end
