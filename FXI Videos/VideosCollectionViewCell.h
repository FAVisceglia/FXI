//
//  VideosCollectionViewCell.h
//  FXI Videos
//
//  Created by Visceglia Anthony on 11/6/14.
//  Copyright (c) 2014 FXI, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideosCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *videoThumbnailImage;
@property (weak, nonatomic) IBOutlet UILabel *videoTitleLabel;

@end