//
//  Score.m
//  JudgeApp
//
//  Created by Andreas Keller on 2014-04-02.
//  Copyright (c) 2014 Andreas Keller. All rights reserved.
//

#import "Score.h"

@implementation Score

- (id) initWithIndex: (NSInteger) scoreIndex :(NSInteger) fishIndex :(NSInteger) appId :(NSInteger) score :(NSInteger) publish
{
    self = [super init];
    if (self)
    {
        _scoreIndex = scoreIndex;
        _fishIndex =fishIndex;
        _appId = appId;
        _score = score;
        _publish = publish;
        
    }
    return self;
}


@end
