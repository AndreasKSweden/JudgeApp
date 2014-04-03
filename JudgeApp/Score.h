//
//  Score.h
//  JudgeApp
//
//  Created by Andreas Keller on 2014-04-02.
//  Copyright (c) 2014 Andreas Keller. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Score : NSObject

@property (nonatomic) NSInteger scoreIndex;
@property (nonatomic) NSInteger fishIndex;
@property (nonatomic) NSInteger appId;
@property (nonatomic) NSInteger score;
@property (nonatomic) NSInteger publish;

#pragma mark -

- (id) initWithIndex: (NSInteger) scoreIndex :(NSInteger) fishIndex :(NSInteger) appId :(NSInteger) score :(NSInteger) publish;
@end


