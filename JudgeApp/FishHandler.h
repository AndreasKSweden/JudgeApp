//
//  FishHandler.h
//  JudgeApp
//
//  Created by Andreas Keller on 2014-03-27.
//  Copyright (c) 2014 Andreas Keller. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ImageHandler.h"

@interface FishHandler : NSObject
@property (nonatomic, strong) NSMutableArray * fishArray;
@property (nonatomic, strong) NSMutableArray * jsonArray;
@property (nonatomic, strong) NSString* fishUrl;
@property (nonatomic, strong) ImageHandler * imageHandler;

#pragma mark -
#pragma mark mark Class Methods

- (void) setUrl: (NSString *) url;
- (void) retreiveData;
- (NSInteger) getNbrOfFishes;
- (NSMutableArray*) getFishList;
- (NSString *) getPath: (NSInteger) index;

@end
