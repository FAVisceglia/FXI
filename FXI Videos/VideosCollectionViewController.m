//
//  VideosCollectionViewController.m
//  FXI Videos
//
//  Created by Visceglia Anthony on 11/6/14.
//  Copyright (c) 2014 FXI, Inc. All rights reserved.
//

#import "VideosCollectionViewController.h"
#import "FXIVideo.h"
#import "VideosCollectionViewCell.h"
#import <MediaPlayer/MediaPlayer.h>


@interface VideosCollectionViewController ()

#pragma mark - Private Properties

// Array of the objects to represent in the table
@property (copy, nonatomic) NSMutableArray *videos;

// Filtered array of the objects to represent in the search results table
@property (copy, nonatomic) NSArray *filteredVideos;

@end


#pragma mark

@implementation VideosCollectionViewController

static NSString * const reuseIdentifier = @"Video Cell";

#pragma mark - Getters

// Getter for the faqs array
- (NSMutableArray *)videos
{
    // Lazy array instantiation
    if (!_videos)
    {
        _videos = [[NSMutableArray alloc] init];
    }
    
    return _videos;
}

// Getter for the filtered faqs array
- (NSArray *)filteredVideos
{
    // Lazy array instantiation
    if (!_filteredVideos)
    {
        _filteredVideos = [[NSArray alloc] init];
    }
    
    return _filteredVideos;
}

#pragma mark - Delegation

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    [layout setItemSize:CGSizeMake(180.0f, 200.0f)];
    [layout setSectionInset:UIEdgeInsetsMake(20.0f, 20.0f, 20.0f, 20.0f)];
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    [layout setMinimumLineSpacing:10.0f];
    [layout setMinimumInteritemSpacing:10.0f];
    
    [[self collectionView] setCollectionViewLayout:layout];
    
    // array
    
    FXIVideo *video = nil;
    
    NSURL *fileURL = [[NSBundle mainBundle] URLForResource:@"01 FXI About - Main"
                                             withExtension:@"m4v"];
    if (fileURL)
    {
        video = [[FXIVideo alloc] initWithURL:fileURL
                              andThumbnailURL:[[NSBundle mainBundle] URLForResource:@"01 FXI About - Main"
                                                                      withExtension:@"png"]];
        [[self videos] addObject:video];
    }
    
    fileURL = [[NSBundle mainBundle] URLForResource:@"02 FXI About - Web"
                                      withExtension:@"m4v"];
    if (fileURL)
    {
        video = [[FXIVideo alloc] initWithURL:fileURL
                              andThumbnailURL:[[NSBundle mainBundle] URLForResource:@"02 FXI About - Web"
                                                                      withExtension:@"png"]];
        [[self videos] addObject:video];
    }
    
    fileURL = [[NSBundle mainBundle] URLForResource:@"03 FXI Who We Are"
                                      withExtension:@"m4v"];
    if (fileURL)
    {
        video = [[FXIVideo alloc] initWithURL:fileURL
                              andThumbnailURL:[[NSBundle mainBundle] URLForResource:@"03 FXI Who We Are"
                                                                      withExtension:@"png"]];
        [[self videos] addObject:video];
    }
    
    fileURL = [[NSBundle mainBundle] URLForResource:@"04 FXI Journey"
                                      withExtension:@"m4v"];
    if (fileURL)
    {
        video = [[FXIVideo alloc] initWithURL:fileURL
                              andThumbnailURL:[[NSBundle mainBundle] URLForResource:@"04 FXI Journey"
                                                                      withExtension:@"png"]];
        [[self videos] addObject:video];
    }
    
    fileURL = [[NSBundle mainBundle] URLForResource:@"05 Molecules to Mattresses"
                                      withExtension:@"m4v"];
    if (fileURL)
    {
        video = [[FXIVideo alloc] initWithURL:fileURL
                              andThumbnailURL:[[NSBundle mainBundle] URLForResource:@"05 Molecules to Mattresses"
                                                                      withExtension:@"png"]];
        [[self videos] addObject:video];
    }
    
    fileURL = [[NSBundle mainBundle] URLForResource:@"06 Aston Tour"
                                      withExtension:@"m4v"];
    if (fileURL)
    {
        video = [[FXIVideo alloc] initWithURL:fileURL
                              andThumbnailURL:[[NSBundle mainBundle] URLForResource:@"06 Aston Tour"
                                                                      withExtension:@"png"]];
        [[self videos] addObject:video];
    }
    
    fileURL = [[NSBundle mainBundle] URLForResource:@"07 FXI at Nascar"
                                      withExtension:@"m4v"];
    if (fileURL)
    {
        video = [[FXIVideo alloc] initWithURL:fileURL
                              andThumbnailURL:[[NSBundle mainBundle] URLForResource:@"07 FXI at Nascar"
                                                                      withExtension:@"png"]];
        [[self videos] addObject:video];
    }
    
    fileURL = [[NSBundle mainBundle] URLForResource:@"08 Recovery - Topper Instructions"
                                      withExtension:@"m4v"];
    if (fileURL)
    {
        video = [[FXIVideo alloc] initWithURL:fileURL
                              andThumbnailURL:[[NSBundle mainBundle] URLForResource:@"08 Recovery - Topper Instructions"
                                                                      withExtension:@"png"]];
        [[self videos] addObject:video];
    }
    
    fileURL = [[NSBundle mainBundle] URLForResource:@"09 Airflow - Aerus Max"
                                      withExtension:@"m4v"];
    if (fileURL)
    {
        video = [[FXIVideo alloc] initWithURL:fileURL
                              andThumbnailURL:[[NSBundle mainBundle] URLForResource:@"09 Airflow - Aerus Max"
                                                                      withExtension:@"png"]];
        [[self videos] addObject:video];
    }
    
    fileURL = [[NSBundle mainBundle] URLForResource:@"10 Airflow - Ambiessence"
                                      withExtension:@"m4v"];
    if (fileURL)
    {
        video = [[FXIVideo alloc] initWithURL:fileURL
                              andThumbnailURL:[[NSBundle mainBundle] URLForResource:@"10 Airflow - Ambiessence"
                                                                      withExtension:@"png"]];
        [[self videos] addObject:video];
    }
    
    fileURL = [[NSBundle mainBundle] URLForResource:@"11 Airflow - MaxPerm"
                                      withExtension:@"m4v"];
    if (fileURL)
    {
        video = [[FXIVideo alloc] initWithURL:fileURL
                              andThumbnailURL:[[NSBundle mainBundle] URLForResource:@"11 Airflow - MaxPerm"
                                                                      withExtension:@"png"]];
        [[self videos] addObject:video];
    }
    
    fileURL = [[NSBundle mainBundle] URLForResource:@"12 Gel - MemGel Swirl"
                                      withExtension:@"m4v"];
    if (fileURL)
    {
        video = [[FXIVideo alloc] initWithURL:fileURL
                              andThumbnailURL:[[NSBundle mainBundle] URLForResource:@"12 Gel - MemGel Swirl"
                                                                      withExtension:@"png"]];
        [[self videos] addObject:video];
    }
    
    fileURL = [[NSBundle mainBundle] URLForResource:@"13 Heat Management - GelTrix"
                                      withExtension:@"m4v"];
    if (fileURL)
    {
        video = [[FXIVideo alloc] initWithURL:fileURL
                              andThumbnailURL:[[NSBundle mainBundle] URLForResource:@"13 Heat Management - GelTrix"
                                                                      withExtension:@"png"]];
        [[self videos] addObject:video];
    }
    
    fileURL = [[NSBundle mainBundle] URLForResource:@"14 PM - Back Support Topper"
                                      withExtension:@"m4v"];
    if (fileURL)
    {
        video = [[FXIVideo alloc] initWithURL:fileURL
                              andThumbnailURL:[[NSBundle mainBundle] URLForResource:@"14 PM - All Videos"
                                                                      withExtension:@"png"]];
        [[self videos] addObject:video];
    }
 
    fileURL = [[NSBundle mainBundle] URLForResource:@"15 PM - Customizable Relief Topper"
                                      withExtension:@"m4v"];
    if (fileURL)
    {
        video = [[FXIVideo alloc] initWithURL:fileURL
                              andThumbnailURL:[[NSBundle mainBundle] URLForResource:@"14 PM - All Videos"
                                                                      withExtension:@"png"]];
        [[self videos] addObject:video];
    }
    
    fileURL = [[NSBundle mainBundle] URLForResource:@"16 PM - Elite Performance Topper"
                                      withExtension:@"m4v"];
    if (fileURL)
    {
        video = [[FXIVideo alloc] initWithURL:fileURL
                              andThumbnailURL:[[NSBundle mainBundle] URLForResource:@"14 PM - All Videos"
                                                                      withExtension:@"png"]];
        [[self videos] addObject:video];
    }
    
    fileURL = [[NSBundle mainBundle] URLForResource:@"17 PM - Energizing Performance Topper"
                                      withExtension:@"m4v"];
    if (fileURL)
    {
        video = [[FXIVideo alloc] initWithURL:fileURL
                              andThumbnailURL:[[NSBundle mainBundle] URLForResource:@"14 PM - All Videos"
                                                                      withExtension:@"png"]];
        [[self videos] addObject:video];
    }
    
    fileURL = [[NSBundle mainBundle] URLForResource:@"18 PM - Gel Topper"
                                      withExtension:@"m4v"];
    if (fileURL)
    {
        video = [[FXIVideo alloc] initWithURL:fileURL
                              andThumbnailURL:[[NSBundle mainBundle] URLForResource:@"14 PM - All Videos"
                                                                      withExtension:@"png"]];
        [[self videos] addObject:video];
    }
    
    fileURL = [[NSBundle mainBundle] URLForResource:@"19 PM - Smart Foam Alone1"
                                      withExtension:@"m4v"];
    if (fileURL)
    {
        video = [[FXIVideo alloc] initWithURL:fileURL
                              andThumbnailURL:[[NSBundle mainBundle] URLForResource:@"14 PM - All Videos"
                                                                      withExtension:@"png"]];
        [[self videos] addObject:video];
    }
    
    fileURL = [[NSBundle mainBundle] URLForResource:@"20 PM - Total Support Topper"
                                      withExtension:@"m4v"];
    if (fileURL)
    {
        video = [[FXIVideo alloc] initWithURL:fileURL
                              andThumbnailURL:[[NSBundle mainBundle] URLForResource:@"14 PM - All Videos"
                                                                      withExtension:@"png"]];
        [[self videos] addObject:video];
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [[self videos] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    VideosCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier
                                                                               forIndexPath:indexPath];
    
    // Configure the cell
    
    FXIVideo *video = nil;
    video = [[self videos] objectAtIndex:[indexPath row]];

    // Set cells
    
    [[cell videoThumbnailButtonView] setBackgroundImage:[[UIImage alloc] initWithData:[video thumbnail]]
                                               forState:UIControlStateNormal];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setHyphenationFactor:1.0f];
    [paragraphStyle setAlignment:NSTextAlignmentCenter];
    [paragraphStyle setLineBreakMode:NSLineBreakByTruncatingTail];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:[[video title] substringFromIndex:3]
                                                                                         attributes:@{
                                                                                                      NSParagraphStyleAttributeName : paragraphStyle
                                                                                                      }];
    
    [[cell videoTitleLabelView] setAttributedText:attributedString];
    [[cell videoTitleLabelView] setTextColor:[UIColor colorWithRed:(18.0/255.0)
                                                             green:(52.0/255.0)
                                                              blue:(88.0/255.0)
                                                             alpha:1.0f]];

    return cell;
}

- (IBAction)playVideo:(UIButton *)sender
{
    if ([[[sender superview] superview] isKindOfClass:[VideosCollectionViewCell class]])
    {
        VideosCollectionViewCell *cell = (VideosCollectionViewCell *)[[sender superview] superview];
        NSIndexPath *indexPath = [[self collectionView] indexPathForCell:cell];
        
        FXIVideo *video = [[self videos] objectAtIndex:[indexPath row]];
        
        MPMoviePlayerViewController *player = [[MPMoviePlayerViewController alloc] initWithContentURL:[video videoURL]];
        [[player moviePlayer] setFullscreen:YES
                                   animated:YES];
        [[player moviePlayer] setScalingMode:MPMovieScalingModeAspectFit];

        [self presentMoviePlayerViewControllerAnimated:player];
    }
}


#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
