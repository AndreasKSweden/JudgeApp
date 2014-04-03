//
//  ScoreHandler.m
//  JudgeApp
//
//  Created by Andreas Keller on 2014-04-02.
//  Copyright (c) 2014 Andreas Keller. All rights reserved.
//

#import "ScoreHandler.h"
#import "Score.h"

@implementation ScoreHandler

@synthesize scoreArray, jsonArray, scoreUrl;

- (void) setUrl: (NSString *) url
{
    scoreUrl = url;
}
- (void) setAddScoreUrl: (NSString *) url
{
    _addScoreUrl = url;
}

- (NSInteger) getScore: (NSInteger) in_fish withApp:(NSInteger) app
{
    for (int i = 0; i < scoreArray.count; i++)
    {
        NSInteger fishIndex = [[[scoreArray objectAtIndex:i] valueForKey:@"fishIndex"] integerValue];
        NSInteger appIndex = [[[scoreArray objectAtIndex:i] valueForKey:@"appId"] integerValue];
        if (in_fish == fishIndex && app == appIndex)
            return [[[scoreArray objectAtIndex:i] valueForKey:@"score"] integerValue];
    }
    return 1;
}

- (id) init
{
    self = [super init];
    if (self)
    {
        scoreArray = [[NSMutableArray alloc] init];

    }
    return self;
    
}
- (void) retreiveData
{
    NSURL * url = [NSURL URLWithString: scoreUrl];
    NSData * data = [NSData dataWithContentsOfURL:url];
    //Definitions
    
    if (scoreArray.count > 0)
    {
        [scoreArray removeAllObjects];
    }
    jsonArray = [NSJSONSerialization JSONObjectWithData:data options: kNilOptions error:nil];
    
    //Loop through our jsonArray
    for (int i = 0; i < jsonArray.count; i++)
    {
        NSInteger index = [[[jsonArray objectAtIndex:i] objectForKey:@"counter"] integerValue];
        NSInteger appearance = [[[jsonArray objectAtIndex:i] objectForKey:@"appearance"] integerValue];
        NSInteger score = [[[jsonArray objectAtIndex:i] objectForKey:@"score"] integerValue];
        NSInteger fish = [[[jsonArray objectAtIndex:i] objectForKey:@"fish"] integerValue];
        NSInteger publish = [[[jsonArray objectAtIndex:i] objectForKey:@"Publish"] integerValue];
        
        [scoreArray addObject:[[Score alloc]initWithIndex:index :fish :appearance :score :publish]];
        
    }
    
}

- (NSInteger) scorePresent: (NSInteger) in_fish withApp: (NSInteger) app
{
    for (int i = 0; i < scoreArray.count; i++)
    {
        NSInteger fishIndex = [[[scoreArray objectAtIndex:i] valueForKey:@"fishIndex"] integerValue];
        NSInteger appIndex = [[[scoreArray objectAtIndex:i] valueForKey:@"appId"] integerValue];
        if (in_fish == fishIndex && app == appIndex)
        {
            return 1;
        }
        
    }
    return 0;
}

- (NSInteger) updateScore: (NSInteger) in_fishIndex withApp: (NSInteger) app :(NSInteger) score : (NSInteger) judge
{
    
    for (int i = 0; i < scoreArray.count; i++)
    {
        NSInteger fishIndex = [[[scoreArray objectAtIndex:i] valueForKey:@"fishIndex"] integerValue];
        NSInteger appIndex = [[[scoreArray objectAtIndex:i] valueForKey:@"appId"] integerValue];
        if (in_fishIndex == fishIndex && app == appIndex)
        {
            NSInteger scoreIndex = [[[scoreArray objectAtIndex:i] valueForKey:@"index"] integerValue];
            Score * scoreElement = [[Score alloc]initWithIndex: scoreIndex : fishIndex :app :score : 0];

            [scoreArray replaceObjectAtIndex:i withObject:scoreElement];
            return 1;
            //TODO: Update database
        }
            
    }
    
    return 0;
}

- (NSInteger) addScore:(NSInteger) in_fish withApp: (NSInteger) app :(NSInteger) score :(NSInteger) judge
{
/*
    NSInteger index = 0;;
    NSInteger publish = 0;
    NSLog(@"addScore");

    _addScoreUrl = [_addScoreUrl stringByAppendingString:@"Fish="];
    _addScoreUrl = [_addScoreUrl stringByAppendingString:[NSString stringWithFormat:@"%d",(int)in_fish]];

    _addScoreUrl = [_addScoreUrl stringByAppendingString:@"&Judge="];
    _addScoreUrl = [_addScoreUrl stringByAppendingString:[NSString stringWithFormat:@"%d",(int)judge]];

    _addScoreUrl = [_addScoreUrl stringByAppendingString:@"&Appearance="];
    _addScoreUrl = [_addScoreUrl stringByAppendingString:[NSString stringWithFormat:@"%d",(int)app]];

    _addScoreUrl = [_addScoreUrl stringByAppendingString:@"&Score="];
    _addScoreUrl = [_addScoreUrl stringByAppendingString:[NSString stringWithFormat:@"%d",(int)score]];
                _addScoreUrl = [_addScoreUrl stringByAppendingString:@"&&pass=diskus2014"];
    
    NSData *dataURL= [NSData dataWithContentsOfURL:[NSURL URLWithString:_addScoreUrl]];
    
    NSString *strResult = [[NSString alloc] initWithData:dataURL encoding:NSUTF8StringEncoding];
    
    NSLog(@"%@", strResult);
*/
    
    /*
 if (scoreArray != nil)
 {
     NSLog(@"About to add");
     [scoreArray addObject:[[Score alloc]initWithIndex:index :in_fish :app :score :publish]];

 }
     else
        NSLog(@"scoreArray is nil");
    */
    return 0;
}
@end
