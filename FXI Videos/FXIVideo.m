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

// Read & write extension of the public thumbnail
@property (copy, nonatomic, readwrite) NSData *thumbnail;

// Read & write extension of the public title
@property (copy, nonatomic, readwrite) NSString *title;

@end


#pragma mark

@implementation FXIVideo

#pragma mark - Setters

// Setter for the video URL property
- (void)setVideoURL:(NSURL *)videoURL
{
    NSArray *validExtensions = @[@"mp4", @"mov", @"MP4", @"MOV", @"M4V", @"m4v"]; // Array of valid video file extensions
    NSString *fileExtension = [videoURL pathExtension]; // The file extenstion of the video
    NSLog(@"URL in Setter: %@", videoURL);
    NSLog(@"File extension in model: %@", fileExtension);
    
    // Check if the file has a valid extension
    if ([validExtensions containsObject:fileExtension])
    {
        NSLog(@"Valid file");
        // Local variable assignment
        _videoURL = videoURL;
        
        // Set the video thumbnail
        [self setThumbnail:[self getThumbnailForVideo:videoURL atTime:5]];
        
        NSString *filePath = [videoURL path]; // The path of the video
        NSString *fileName = [[filePath lastPathComponent] stringByDeletingPathExtension]; // The file name (no extension) of the video
        
        // Set the video title
        [self setTitle:fileName];
    }
}

#pragma mark - Initializers

// Designated initializer; creates an FXI Video from a file at a given URL
- (instancetype)initWithURL:(NSURL *)urlOfVideo
{
    self = [super init];
    
    if (self)
    {
        [self setVideoURL:urlOfVideo];
    }
    
    return self;
}

#pragma mark - Private Methods

- (NSData *)getThumbnailForVideo:(NSURL *)fileURL atTime:(NSUInteger)seconds
{
    AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:fileURL options:nil];
    AVAssetImageGenerator *imageGenerator = [[AVAssetImageGenerator alloc] initWithAsset:asset];
    NSError *error = NULL;
    
    uint s = (uint)seconds;
    CMTime time = CMTimeMake(s, 1);
    
    CGImageRef imageReference = [imageGenerator copyCGImageAtTime:time
                                                       actualTime:NULL
                                                            error:&error];
    UIImage *image = [[UIImage alloc] initWithCGImage:imageReference];
    
    return UIImagePNGRepresentation(image);
}

@end
