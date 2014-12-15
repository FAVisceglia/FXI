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
#import "VideosCollectionHeaderView.h"


@interface VideosCollectionViewController ()

#pragma mark - Private Properties

// Array of the videos to represent in the table
@property (copy, nonatomic) NSMutableArray *videos;

// Filtered array of the videos to represent in the search results table
@property (copy, nonatomic) NSArray *filteredVideos;

// Array of the mapping (section two) videos
@property (copy, nonatomic) NSMutableArray *mappingVideos;

@end


#pragma mark

@implementation VideosCollectionViewController

static NSString * const reuseIdentifier = @"Video Cell";


#pragma mark - Getters

/**
 Getter for the private videos array
 
 @return The local array variable, fully instantiated
 */
- (NSMutableArray *)videos
{
    // Lazy array instantiation
    if (!_videos)
    {
        _videos = [[NSMutableArray alloc] init];
    }
    
    return _videos;
}

/**
 Getter for the private filtered videos array
 
 @return The local array variable, fully instantiated
 */
- (NSArray *)filteredVideos
{
    // Lazy array instantiation
    if (!_filteredVideos)
    {
        _filteredVideos = [[NSArray alloc] init];
    }
    
    return _filteredVideos;
}

/**
 Getter for the private mapping videos array
 
 @return The local array variable, fully instantiated
 */
- (NSMutableArray *)mappingVideos
{
    // Lazy array instantiation
    if (!_mappingVideos)
    {
        _mappingVideos = [[NSMutableArray alloc] init];
    }
    
    return _mappingVideos;
}


#pragma mark - View Controller Delegation

/**
 View-controller-lifecycle message sent whevener the root view is loaded
 */
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Define, adjust and set the layout for the collection view
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    [layout setItemSize:CGSizeMake(180.0f, 200.0f)];
    [layout setSectionInset:UIEdgeInsetsMake(20.0f, 20.0f, 0.0f, 20.0f)];
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    [layout setMinimumLineSpacing:0.0f];
    [layout setMinimumInteritemSpacing:10.0f];
    
    [[self collectionView] setCollectionViewLayout:layout];
    
    // The video to be added to the array
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
    
    fileURL = [[NSBundle mainBundle] URLForResource:@"08 Topper Instructions"
                                      withExtension:@"m4v"];
    if (fileURL)
    {
        video = [[FXIVideo alloc] initWithURL:fileURL
                              andThumbnailURL:[[NSBundle mainBundle] URLForResource:@"08 Topper Instructions"
                                                                      withExtension:@"png"]];
        [[self videos] addObject:video];
    }
    
    fileURL = [[NSBundle mainBundle] URLForResource:@"09 Aerus Max"
                                      withExtension:@"m4v"];
    if (fileURL)
    {
        video = [[FXIVideo alloc] initWithURL:fileURL
                              andThumbnailURL:[[NSBundle mainBundle] URLForResource:@"09 Aerus Max"
                                                                      withExtension:@"png"]];
        [[self videos] addObject:video];
    }
    
    fileURL = [[NSBundle mainBundle] URLForResource:@"10 Ambiessence"
                                      withExtension:@"m4v"];
    if (fileURL)
    {
        video = [[FXIVideo alloc] initWithURL:fileURL
                              andThumbnailURL:[[NSBundle mainBundle] URLForResource:@"10 Ambiessence"
                                                                      withExtension:@"png"]];
        [[self videos] addObject:video];
    }
    
    fileURL = [[NSBundle mainBundle] URLForResource:@"11 MaxPerm"
                                      withExtension:@"m4v"];
    if (fileURL)
    {
        video = [[FXIVideo alloc] initWithURL:fileURL
                              andThumbnailURL:[[NSBundle mainBundle] URLForResource:@"11 MaxPerm"
                                                                      withExtension:@"png"]];
        [[self videos] addObject:video];
    }
    
    fileURL = [[NSBundle mainBundle] URLForResource:@"12 MemGel Swirl"
                                      withExtension:@"m4v"];
    if (fileURL)
    {
        video = [[FXIVideo alloc] initWithURL:fileURL
                              andThumbnailURL:[[NSBundle mainBundle] URLForResource:@"12 MemGel Swirl"
                                                                      withExtension:@"png"]];
        [[self videos] addObject:video];
    }
    
    fileURL = [[NSBundle mainBundle] URLForResource:@"13 GelTrix"
                                      withExtension:@"m4v"];
    if (fileURL)
    {
        video = [[FXIVideo alloc] initWithURL:fileURL
                              andThumbnailURL:[[NSBundle mainBundle] URLForResource:@"13 GelTrix"
                                                                      withExtension:@"png"]];
        [[self videos] addObject:video];
    }
    
    fileURL = [[NSBundle mainBundle] URLForResource:@"14 Back Support Topper"
                                      withExtension:@"m4v"];
    if (fileURL)
    {
        video = [[FXIVideo alloc] initWithURL:fileURL
                              andThumbnailURL:[[NSBundle mainBundle] URLForResource:@"14 PM - All Videos"
                                                                      withExtension:@"png"]];
        [[self mappingVideos] addObject:video];
    }
 
    fileURL = [[NSBundle mainBundle] URLForResource:@"15 Customizable Relief Topper"
                                      withExtension:@"m4v"];
    if (fileURL)
    {
        video = [[FXIVideo alloc] initWithURL:fileURL
                              andThumbnailURL:[[NSBundle mainBundle] URLForResource:@"14 PM - All Videos"
                                                                      withExtension:@"png"]];
        [[self mappingVideos] addObject:video];
    }
    
    fileURL = [[NSBundle mainBundle] URLForResource:@"16 Elite Performance Topper"
                                      withExtension:@"m4v"];
    if (fileURL)
    {
        video = [[FXIVideo alloc] initWithURL:fileURL
                              andThumbnailURL:[[NSBundle mainBundle] URLForResource:@"14 PM - All Videos"
                                                                      withExtension:@"png"]];
        [[self mappingVideos] addObject:video];
    }
    
    fileURL = [[NSBundle mainBundle] URLForResource:@"17 Energizing Performance Topper"
                                      withExtension:@"m4v"];
    if (fileURL)
    {
        video = [[FXIVideo alloc] initWithURL:fileURL
                              andThumbnailURL:[[NSBundle mainBundle] URLForResource:@"14 PM - All Videos"
                                                                      withExtension:@"png"]];
        [[self mappingVideos] addObject:video];
    }
    
    fileURL = [[NSBundle mainBundle] URLForResource:@"18 Gel Topper"
                                      withExtension:@"m4v"];
    if (fileURL)
    {
        video = [[FXIVideo alloc] initWithURL:fileURL
                              andThumbnailURL:[[NSBundle mainBundle] URLForResource:@"14 PM - All Videos"
                                                                      withExtension:@"png"]];
        [[self mappingVideos] addObject:video];
    }
    
    fileURL = [[NSBundle mainBundle] URLForResource:@"19 Smart Foam Alone1"
                                      withExtension:@"m4v"];
    if (fileURL)
    {
        video = [[FXIVideo alloc] initWithURL:fileURL
                              andThumbnailURL:[[NSBundle mainBundle] URLForResource:@"14 PM - All Videos"
                                                                      withExtension:@"png"]];
        [[self mappingVideos] addObject:video];
    }
    
    fileURL = [[NSBundle mainBundle] URLForResource:@"20 Total Support Topper"
                                      withExtension:@"m4v"];
    if (fileURL)
    {
        video = [[FXIVideo alloc] initWithURL:fileURL
                              andThumbnailURL:[[NSBundle mainBundle] URLForResource:@"14 PM - All Videos"
                                                                      withExtension:@"png"]];
        [[self mappingVideos] addObject:video];
    }
    
    
}

/**
 View controller lifecycle message sent when the OS issues a memory warning
 */
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark - Collection View Data Source

/**
 Returns the number of sections in the collection view
 
 @param collectionView: The collection view
 
 @return The number of sections
 */
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

/**
 Returns the number of cells in a given section
 
 @param collectionView: The collection view
 @param section: The given section
 
 @return The number of the cells in the given section
 */
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    // If the first section, return the number of videos in the array
    if (section == 0)
    {
        return [[self videos] count];
    }
    // Else (if the second section), return the number of mapping videos in the array
    else
    {
        return [[self mappingVideos] count];
    }
}

/**
 Create, design and return the cell at a given indexpath
 
 @param collectionView: The collection view
 @param indexPath: The section and index (column or row) of the cell
 
 @return The cell to be displayed in the collection view
 */
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // Define a cell and assign the reusable identifier from the storyboard
    VideosCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier
                                                                               forIndexPath:indexPath];
    
    // The video represented in the cell
    FXIVideo *video = nil;
    
    // If the first section, get the corresponding video from the main array
    if ([indexPath section] == 0)
    {
        video = [[self videos] objectAtIndex:[indexPath row]];
    }
    // Else (if the second section), get the corresponding video from the mapping videos array
    else
    {
        video = [[self mappingVideos] objectAtIndex:[indexPath row]];
    }

    // Set the thumbnail image of the video to the cell's button background
    [[cell videoThumbnailButtonView] setBackgroundImage:[[UIImage alloc] initWithData:[video thumbnail]]
                                               forState:UIControlStateNormal];
    
    // Set a paragraph style for the video title (alignment, truncation, hyphenation)
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setHyphenationFactor:1.0f];
    [paragraphStyle setAlignment:NSTextAlignmentCenter];
    [paragraphStyle setLineBreakMode:NSLineBreakByTruncatingTail];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:[[video title] substringFromIndex:3]
                                                                                         attributes:@{ NSParagraphStyleAttributeName : paragraphStyle }];
    // Set the cell's video label text and text color
    [[cell videoTitleLabelView] setAttributedText:attributedString];
    [[cell videoTitleLabelView] setTextColor:[UIColor colorWithRed:(18.0/255.0)
                                                             green:(52.0/255.0)
                                                              blue:(88.0/255.0)
                                                             alpha:1.0f]];

    return cell;
}

/**
 Returns the view to use for supplemental elements of the collection view (such as section headers and footers)
 
 @param collectionView: The collection view
 @param kind: The type of supplemental view (e.g. header)
 @param indexPath: The section and, if applicable, index of the cell for which the supplement view applies
 
 @return The supplmental view to display
 */
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    // The view that will be returned
    UICollectionReusableView *reusableView = nil;
    
    // Define a header view and assign it to a reusable indentifier from the storyboard
    VideosCollectionHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                                                                withReuseIdentifier:@"Header View"
                                                                                       forIndexPath:indexPath];
    // The section (header) title
    NSString *sectionTitle = nil;

    // If the second section, set the section title
    if ([indexPath section] == 1)
    {
        sectionTitle = @"PRESSURE MAPPING VIDEOS";
        
        NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:sectionTitle
                                                                               attributes:@{ NSKernAttributeName : @(0.25f),
                                                                                             NSFontAttributeName : [UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline] }];
        
        [[headerView sectionTitleLabel] setAttributedText:attributedString];
    }
    // Else (if the first section), leave the section title as nil (there is no title)
    else
    {
        [[headerView sectionTitleLabel] setText:sectionTitle];
    }
    
    reusableView = headerView;
    
    return reusableView;
}


#pragma mark - Target Actions

/**
 Action triggered when the play video button is touched
 
 @param sender: The button that was touched
 */
- (IBAction)playVideo:(UIButton *)sender
{
    // If this is indeed coming from a video cell, proceed
    if ([[[sender superview] superview] isKindOfClass:[VideosCollectionViewCell class]])
    {
        // Get the cell containing the button that was pressed
        VideosCollectionViewCell *cell = (VideosCollectionViewCell *)[[sender superview] superview];
        // Get the indexpath of the sending cell
        NSIndexPath *indexPath = [[self collectionView] indexPathForCell:cell];
        // The video represented by the cell
        FXIVideo *video = nil;
        
        // If the first section, grab the corresponding video from the main array
        if ([indexPath section] == 0)
        {
            video = [[self videos] objectAtIndex:[indexPath row]];
        }
        // Else (if the second section), grab the corresponding video from the mapping array
        else
        {
            video = [[self mappingVideos] objectAtIndex:[indexPath row]];
        }
        
        // Create a movie player view controller, define playback settings and present the view with animation
        MPMoviePlayerViewController *player = [[MPMoviePlayerViewController alloc] initWithContentURL:[video videoURL]];
        [[player moviePlayer] setFullscreen:YES
                                   animated:YES];
        [[player moviePlayer] setScalingMode:MPMovieScalingModeAspectFit];

        [self presentMoviePlayerViewControllerAnimated:player];
    }
}


#pragma mark - Collection View Delegation

/**
 Return the size of the header for the given section
 
 @param collectionView: The collection view
 @param section: The section
 
 @return The size of the header view
 */
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (section == 1)
    {
        return CGSizeMake(0.0f, 50.0f);
    }
    // Else (if the first section), there is no section title, so return a zero size for header
    else
    {
        return CGSizeZero;
    }
}

@end
