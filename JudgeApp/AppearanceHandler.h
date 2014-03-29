//
//  AppearanceHandler.h
//  JudgeApp
//
//  Created by Andreas Keller on 2014-03-26.
//  Copyright (c) 2014 Andreas Keller. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Appearance.h"

@interface AppearanceHandler : NSObject
@property (nonatomic, strong) NSMutableArray * appearanceArray;
@property (nonatomic, strong) NSMutableArray * jsonArray;
@property (nonatomic, strong) NSString* appearanceUrl;

#pragma mark -
#pragma mark mark Class Methods

- (void) setUrl: (NSString *) url;
- (void) retreiveData;
- (NSInteger) getNbrOfAppearances;
- (NSMutableArray*) getAppearanceList;
@end
