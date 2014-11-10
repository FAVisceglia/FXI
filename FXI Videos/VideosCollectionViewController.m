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

// Array of the objects to represent in the table
@property (copy, nonatomic) NSMutableArray *videos;
// Filtered array of the objects to represent in the search results table
@property (copy, nonatomic) NSArray *filteredVideos;

@end

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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
//    [[self collectionView] registerClass:[VideosCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    [layout setItemSize:CGSizeMake(200.0f, 200.0f)];
    [layout setSectionInset:UIEdgeInsetsMake(0.0f, 0.0f, 0.0f, 0.0f)];
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    [layout setMinimumLineSpacing:0.0f];
    [layout setMinimumInteritemSpacing:0.0f];
    
    [[self collectionView] setCollectionViewLayout:layout];
    
    // array
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"MOV"];
    unsigned long long fileSize = [[NSFileManager defaultManager] attributesOfItemAtPath:path error:nil].fileSize;
    NSLog(@"%llul", fileSize);
    NSLog(@"Da path: %@", path);
    NSURL *fileURL = [[NSBundle mainBundle] URLForResource:@"test" withExtension:@"MOV"];
    
    FXIVideo *video = [[FXIVideo alloc] initWithURL:fileURL];
    
    [[self videos] addObject:video];
    
    NSString *path2 = [[NSBundle mainBundle] pathForResource:@"cars test" ofType:@"MOV"];
    unsigned long long fileSize2 = [[NSFileManager defaultManager] attributesOfItemAtPath:path2 error:nil].fileSize;
    NSLog(@"%llul", fileSize2);
    NSLog(@"Da path: %@", path2);
    NSURL *fileURL2 = [[NSBundle mainBundle] URLForResource:@"cars test" withExtension:@"MOV"];
    
    FXIVideo *video2 = [[FXIVideo alloc] initWithURL:fileURL2];
    
    [[self videos] addObject:video2];
    
//    [[self collectionView] reloadData];
}

- (void)didReceiveMemoryWarning {
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
    NSLog(@"Items in section called");
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSLog(@"Count of items: %lu", (unsigned long)[[self videos] count]);
    return [[self videos] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"HERE");
 //   [[self collectionView] registerClass:[VideosCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    VideosCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    
    FXIVideo *video = nil;
    video = [[self videos] objectAtIndex:[indexPath row]];

    // Set cells
    
    [[cell videoThumbnailButtonView] setBackgroundImage:[[UIImage alloc] initWithData:[video thumbnail]] forState:UIControlStateNormal];
    [[cell videoTitleLabelView] setText:[video title]];
    [[cell videoTitleLabelView] setTextColor:[UIColor colorWithRed:(18.0/255.0) green:(52.0/255.0) blue:(88.0/255.0) alpha:1.0f]];

    return cell;
}

- (IBAction)playVideo:(UIButton *)sender
{
    if ([[[sender superview] superview] isKindOfClass:[VideosCollectionViewCell class]])
    {
        VideosCollectionViewCell *cell = [[sender superview] superview];
        NSIndexPath *indexPath = [[self collectionView] indexPathForCell:cell];
        
        FXIVideo *video = [[self videos] objectAtIndex:[indexPath row]];
        
        MPMoviePlayerViewController *player = [[MPMoviePlayerViewController alloc] initWithContentURL:[video videoURL]];
        [[player moviePlayer] setFullscreen:YES];
        [[player moviePlayer] setScalingMode:MPMovieScalingModeAspectFit];

        [self presentMoviePlayerViewControllerAnimated:player];
    }
    
    NSLog(@"Button view: %@", NSStringFromClass([sender class]));
    NSLog(@"Button superview: %@", NSStringFromClass([[sender superview] class]));
    NSLog(@"Button superview superview: %@", NSStringFromClass([[[sender superview] superview] class]));
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
