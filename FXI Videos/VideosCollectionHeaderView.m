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
    
    UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:self.bounds];
    [[self layer] setMasksToBounds:NO];
    [[self layer] setShadowColor:[UIColor darkGrayColor].CGColor];
    [[self layer] setShadowOffset:CGSizeMake(0.0f, 2.5f)];
    [[self layer] setShadowOpacity:0.5f];
    [[self layer] setShadowPath:shadowPath.CGPath];
}

@end
