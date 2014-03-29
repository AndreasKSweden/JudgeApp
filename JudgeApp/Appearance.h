//
//  Appearance.h
//  JudgeApp
//
//  Created by Andreas Keller on 2014-03-26.
//  Copyright (c) 2014 Andreas Keller. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Appearance : NSObject
@property (strong, nonatomic) NSString * name;
@property (nonatomic) NSInteger index;
@property (nonatomic) NSInteger min;
@property (nonatomic) NSInteger max;
@property (nonatomic) NSInteger weight;

#pragma mark -

- (id) initWithAppearanceName: (NSString *) appearance andAppearanceIndex: (NSInteger) appIndex andAppearanceMin: (NSInteger) appMin andAppearanceMax: (NSInteger) appMax andAppearanceWeight: (NSInteger) appWeight;
@end
