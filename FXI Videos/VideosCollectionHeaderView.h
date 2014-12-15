//
//  VideosCollectionHeaderView.h
//  FXI Videos
//
//  Created by Visceglia Anthony on 11/25/14.
//  Copyright (c) 2014 FXI, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 A view representing a reusable header in a collection view
 */
@interface VideosCollectionHeaderView : UICollectionReusableView


#pragma mark - Public Properties

// Label to display the section title
@property (weak, nonatomic) IBOutlet UILabel *sectionTitleLabel;

@end
