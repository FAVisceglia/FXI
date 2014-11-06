//
//  FXIVideo.h
//  FXI Videos
//
//  Created by Visceglia Anthony on 11/6/14.
//  Copyright (c) 2014 FXI, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>
#warning Optimization point: should not need to import full frameworks

@interface FXIVideo : NSObject

#pragma mark - Public Properties

// The URL of the locally-stored video (read & write)
@property (strong, nonatomic) NSURL *videoURL;

// The thumbnail image of the video (read only)
@property (copy, nonatomic, readonly) NSData *thumbnail;

// The title of the video (read only)
@property (copy, nonatomic, readonly) NSString *title;

#pragma mark - Public Methods

// Designated initializer; create a new video from a file stored at the given URL
- (instancetype)initWithURL:(NSURL *)urlOfVideo;

@end
