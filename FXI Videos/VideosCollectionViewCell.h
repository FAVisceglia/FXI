//
//  VideosCollectionViewCell.h
//  FXI Videos
//
//  Created by Visceglia Anthony on 11/6/14.
//  Copyright (c) 2014 FXI, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 A view representing a collection view cell
 
 @inherit UICollectionViewCell
 */
@interface VideosCollectionViewCell : UICollectionViewCell


#pragma mark - Public Properties

// A label in the cell to display the video title
@property (weak, nonatomic) IBOutlet UILabel *videoTitleLabelView;

// A button to play the video, displaying the video thumbnail
@property (weak, nonatomic) IBOutlet UIButton *videoThumbnailButtonView;

@end
