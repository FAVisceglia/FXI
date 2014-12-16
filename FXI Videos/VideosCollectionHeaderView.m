//
//  VideosCollectionHeaderView.m
//  FXI Videos
//
//  Created by Visceglia Anthony on 11/25/14.
//  Copyright (c) 2014 FXI, Inc. All rights reserved.
//

#import "VideosCollectionHeaderView.h"

@implementation VideosCollectionHeaderView

/**
 Automatically called when the view's bounds change (e.g. device rotation), the bounds of a subview change, or a subview is added/removed.
 */
- (void)layoutSubviews
{
    [super layoutSubviews];

    // Declare new layers representing the top and bottom borders, and set border width
    CALayer *bottomBorder = [CALayer layer];
    CALayer *topBorder = [CALayer layer];
    CGFloat borderWidth = 0.5f;
    
    // Set the frame of the bottom border and set the border's color
    [bottomBorder setFrame:CGRectMake(0.0f, [self frame].size.height-borderWidth, [self frame].size.width, borderWidth)];
    [bottomBorder setBackgroundColor:[UIColor colorWithRed:(18.0/255.0)
                                                     green:(52.0/255.0)
                                                      blue:(88.0/255.0)
                                                     alpha:0.5f].CGColor];
    
    // Add the bottom border layer to the view's main layer
    [[self layer] addSublayer:bottomBorder];
    
    // Set the frame of the top border and se the border's color
    [topBorder setFrame:CGRectMake(0.0f, 0.0f, [self frame].size.width, borderWidth)];
    [topBorder setBackgroundColor:[UIColor colorWithRed:(18.0/255.0)
                                                  green:(52.0/255.0)
                                                   blue:(88.0/255.0)
                                                  alpha:0.5f].CGColor];
    
    // Add the top border layer to the view's main layer
    [[self layer] addSublayer:topBorder];
}

@end
