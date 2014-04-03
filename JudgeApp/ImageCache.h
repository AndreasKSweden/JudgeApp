//
//  ImageCache.h
//  JudgeApp
//
//  Created by Andreas Keller on 2014-03-27.
//  Copyright (c) 2014 Andreas Keller. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageCache : NSObject

@property (nonatomic, retain) NSCache *imgCache;


#pragma mark - Methods

+ (ImageCache*)sharedImageCache;
- (void) AddImage:(NSString *)imageURL withImage: (UIImage *)image;
- (UIImage*) GetImage: (NSString *) imageURL;
- (BOOL) DoesExist: (NSString *) imageURL;

@end
