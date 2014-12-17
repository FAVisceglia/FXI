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


/**
 Model representing an FXI video, which links to a video file and maintains a thumbnail and title
 
 @inherit NSObject
 */
@interface FXIVideo : NSObject


#pragma mark - Public Properties

// The URL of the locally-stored video
@property (strong, nonatomic) NSURL *videoURL;

// The thumbnail image of the video
@property (copy, nonatomic) NSData *thumbnail;

// The title of the video (read only)
@property (copy, nonatomic, readonly) NSString *title;

// The category of the video
@property (copy, nonatomic) NSString *category;


#pragma mark - Public Methods

/**
 Designated initializer; create an FXI video from a linked file with a given thumbnail
 
 @param urlOfVideo: The URL of the video
 @param urlOfThumbnail: The URL of the video's thumbnail
 
 @return An FXI Video object
 */
- (instancetype)initWithURL:(NSURL *)urlOfVideo andThumbnailURL:(NSURL *)urlOfThumbnail;

/**
 Alterate initializer; create an FXI video from a linked file, default thumbnail
 
 @param urlOfVideo: The URL of the video
 
 @return An FXI Video object
 */
- (instancetype)initWithURL:(NSURL *)urlOfVideo;

@end
