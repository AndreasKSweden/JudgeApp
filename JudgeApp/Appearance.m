//
//  Appearance.m
//  JudgeApp
//
//  Created by Andreas Keller on 2014-03-26.
//  Copyright (c) 2014 Andreas Keller. All rights reserved.
//

#import "Appearance.h"

@implementation Appearance
@synthesize index, name, min, max, weight;

- (id) initWithAppearanceName: (NSString *) appearance andAppearanceIndex: (NSInteger) appIndex andAppearanceMin: (NSInteger) appMin andAppearanceMax: (NSInteger) appMax andAppearanceWeight: (NSInteger) appWeight
{
    self = [super init];
    if (self)
    {
        name = appearance;
        index = appIndex;
        min = appMin;
        max = appMax;
        weight = appWeight;
    }
    return self;
}

@end
