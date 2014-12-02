//
//  VideosCollectionHeaderView.m
//  FXI Videos
//
//  Created by Visceglia Anthony on 11/25/14.
//  Copyright (c) 2014 FXI, Inc. All rights reserved.
//

#import "VideosCollectionHeaderView.h"

@implementation VideosCollectionHeaderView

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // Drop Shadow
    UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:self.bounds];
    [[self layer] setMasksToBounds:NO];
    [[self layer] setShadowColor:[UIColor darkGrayColor].CGColor];
    [[self layer] setShadowOffset:CGSizeMake(0.0f, 2.5f)];
    [[self layer] setShadowOpacity:0.5f];
    [[self layer] setShadowPath:shadowPath.CGPath];
    
    /**
    // Border
    CALayer *bottomBorder = [CALayer layer];
    CALayer *topBorder = [CALayer layer];
    CGFloat borderWidth = 0.5f;
    
    [bottomBorder setFrame:CGRectMake(0.0f, [self frame].size.height-borderWidth, [self frame].size.width, borderWidth)];
    [bottomBorder setBackgroundColor:[UIColor colorWithRed:(18.0/255.0)
                                                     green:(52.0/255.0)
                                                      blue:(88.0/255.0)
                                                     alpha:1.0f].CGColor];
    [[self layer] addSublayer:bottomBorder];
    
    [topBorder setFrame:CGRectMake(0.0f, 0.0f, [self frame].size.width, borderWidth)];
    [topBorder setBackgroundColor:[UIColor colorWithRed:(18.0/255.0)
                                                  green:(52.0/255.0)
                                                   blue:(88.0/255.0)
                                                  alpha:1.0f].CGColor];
    [[self layer] addSublayer:topBorder];
     **/
}

@end
