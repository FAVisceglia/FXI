//
//  FXIVideo.m
//  FXI Videos
//
//  Created by Visceglia Anthony on 11/6/14.
//  Copyright (c) 2014 FXI, Inc. All rights reserved.
//

#import "FXIVideo.h"


@interface FXIVideo()

#pragma mark - Private Properties

// Read & write extension of the read-only public title
@property (copy, nonatomic, readwrite) NSString *title;

@end


#pragma mark

@implementation FXIVideo


#pragma mark - Setters

/**
 Setter for the videoURL property
 
 @param videoUrl: The URL of the video
 */
- (void)setVideoURL:(NSURL *)videoURL
{
    // Valid file extensions for videos
    NSArray *validExtensions = @[@"mp4", @"mov", @"MP4", @"MOV", @"M4V", @"m4v"];
    // The file extension of the given video
    NSString *fileExtension = [videoURL pathExtension];
    
    // If the file extension is a valid extension, proceed
    if ([validExtensions containsObject:fileExtension])
    {
        // Set the local variable
        _videoURL = videoURL;
        
        // The file path of the video
        NSString *filePath = [videoURL path];
        // The file name (no extension) of the video
        NSString *fileName = [[filePath lastPathComponent] stringByDeletingPathExtension];
        
        // Set the video title
        [self setTitle:fileName];
    }
}


#pragma mark - Initializers

/**
 Designated initializer; create an FXI video from a linked file with a given thumbnail
 
 @param urlOfVideo: The URL of the video
 @param urlOfThumbnail: The URL of the video's thumbnail
 
 @return An FXI Video object
 */
- (instancetype)initWithURL:(NSURL *)urlOfVideo andThumbnailURL:(NSURL *)urlOfThumbnail
{
    self = [super init];
    
    if (self)
    {
        // Set the video URL
        [self setVideoURL:urlOfVideo];
        
        // Valid file extensions for thumbnails
        NSArray *validExtensions = @[@"png", @"PNG"];
        // The file extension of the given thumbnail
        NSString *fileExtension = [urlOfThumbnail pathExtension];
        
        // If given a thumbnail and the file extension is a valid extension, set the thumbnail as given
        if (urlOfThumbnail && [validExtensions containsObject:fileExtension])
        {
            [self setThumbnail:[NSData dataWithContentsOfURL:urlOfThumbnail]];
        }
        // Else (if invalid extension or file), default the thumbnail
        else
        {
            [self setThumbnail:[self getThumbnailForVideo:urlOfVideo
                                                   atTime:3]];
        }
    }
    
    return self;
}

/**
 Alterate initializer; create an FXI video from a linked file, default thumbnail
 
 @param urlOfVideo: The URL of the video
 
 @return An FXI Video object
 */
- (instancetype)initWithURL:(NSURL *)urlOfVideo
{
    // Invoke the designated initializer and default the thumbnail
    self = [self initWithURL:urlOfVideo andThumbnailURL:nil];
    
    return self;
}


#pragma mark - Private Methods

/**
 Generate a default thumbnail for a video by taken a frame at the given time
 
 @param fileURL: The video from which to pull a thumbnail
 @param seconds: The time in video to grab the frame capture
 
 @return The data of a PNG representation of the thumbnail
 */
- (NSData *)getThumbnailForVideo:(NSURL *)fileURL atTime:(NSUInteger)seconds
{
    // Create an AV asset from the linked video
    AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:fileURL
                                                options:nil];
    // Create an AV image generator from the AV asset
    AVAssetImageGenerator *imageGenerator = [[AVAssetImageGenerator alloc] initWithAsset:asset];

    // An error holder
    NSError *error = NULL;
    
    // Set the maximum size for the image (assumes a widescreen, 16x9 ratio)
    [imageGenerator setMaximumSize:CGSizeMake(160.0f, 90.0f)];
    
    // Get a primitive unsigned int representing the timestamp, and then create a time object
    uint s = (uint)seconds;
    CMTime time = CMTimeMake(s, 1);
    
    // Generate an image from the frame at the givent ime
    CGImageRef imageReference = [imageGenerator copyCGImageAtTime:time
                                                       actualTime:NULL
                                                            error:&error];
    // Convert the image reference into a UI image
    UIImage *image = [[UIImage alloc] initWithCGImage:imageReference];
    
    // Return PNG representation
    return UIImagePNGRepresentation(image);
}

@end
