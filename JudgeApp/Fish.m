//
//  Fish.m
//  JudgeApp
//
//  Created by Andreas Keller on 2014-03-27.
//  Copyright (c) 2014 Andreas Keller. All rights reserved.
//

#import "Fish.h"

@implementation Fish

@synthesize fishIndex, fishPicPath, fishTank, fishClass, scoreArray;

- (id) initWithIndex: (NSInteger) index andFishPicPath: (NSString *) picPath andFishClass: (NSString *) class andFishTank: (NSInteger) tank andscoreArray: (NSArray *) scores
{
    self = [super init];
    if (self)
    {
        fishClass = class;
        fishIndex = index;
        fishPicPath = picPath;
        fishTank = tank;
        scoreArray = scores;
        
    }
    return self;
    
}
@end
