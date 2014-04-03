//
//  ScoreHandler.h
//  JudgeApp
//
//  Created by Andreas Keller on 2014-04-02.
//  Copyright (c) 2014 Andreas Keller. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ScoreHandler : NSObject

@property (strong, nonatomic) NSString * scoreUrl;
@property (strong, nonatomic) NSString * addScoreUrl;
@property (nonatomic) NSInteger judgeId;

@property (nonatomic, strong) NSMutableArray * scoreArray;
@property (nonatomic, strong) NSMutableArray * jsonArray;

- (void) setUrl: (NSString *) url;
- (void) retreiveData;

- (NSInteger) getScore: (NSInteger) in_fish withApp:(NSInteger) app;
- (NSInteger) updateScore: (NSInteger) in_fishIndex withApp: (NSInteger) app :(NSInteger) score :(NSInteger) judge;
- (NSInteger) scorePresent: (NSInteger) in_fish withApp: (NSInteger) app;
- (NSInteger) addScore: (NSInteger) in_fish withApp: (NSInteger) app :(NSInteger) score :(NSInteger) judge;
@end
