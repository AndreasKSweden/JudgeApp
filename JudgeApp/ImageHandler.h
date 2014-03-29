//
//  ImageHandler.h
//  JudgeApp
//
//  Created by Andreas Keller on 2014-03-27.
//  Copyright (c) 2014 Andreas Keller. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageHandler : NSObject

-(UIImage *) getImageFromURL:(NSString *)fileURL;
-(void) saveImage:(UIImage *)image withFileName:(NSString *)imageName ofType:(NSString *)extension inDirectory:(NSString *)directoryPath;
-(UIImage *) loadImage:(NSString *)fileName ofType:(NSString *)extension inDirectory:(NSString *)directoryPath;

@end
