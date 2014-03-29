//
//  Fish.h
//  JudgeApp
//
//  Created by Andreas Keller on 2014-03-27.
//  Copyright (c) 2014 Andreas Keller. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Fish : NSObject

@property (nonatomic) NSInteger fishIndex;
@property (strong, nonatomic) NSString * fishOwner;
@property (strong, nonatomic) NSString * fishPicPath;
@property (nonatomic) NSInteger fishTank;
@property (strong, nonatomic) NSString *  fishClass;
@property (nonatomic, strong) NSArray * scoreArray;

#pragma mark -

- (id) initWithIndex: (NSInteger) index andFishPicPath: (NSString *) picPath andFishClass: (NSString *) class andFishTank: (NSInteger) tank andscoreArray: (NSArray *) scores;
@end
