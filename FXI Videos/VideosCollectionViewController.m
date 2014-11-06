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

@interface VideosCollectionViewController ()

// Array of the objects to represent in the table
@property (copy, nonatomic) NSMutableArray *videos;
// Filtered array of the objects to represent in the search results table
@property (copy, nonatomic) NSArray *filteredVideos;

@end

@implementation VideosCollectionViewController

static NSString * const reuseIdentifier = @"Video Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"MOV"];
    unsigned long long fileSize = [[NSFileManager defaultManager] attributesOfItemAtPath:path error:nil].fileSize;
    NSLog(@"%llul", fileSize);
    NSLog(@"%@", path);
    NSURL *fileURL = [[NSBundle mainBundle] URLForResource:@"test" withExtension:@"MOV"];
    
    FXIVideo *video = [[FXIVideo alloc] initWithURL:fileURL];
    [[self videos] addObject:video];
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
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [[self videos] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    [[self collectionView] registerClass:[VideosCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    VideosCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    
    FXIVideo *video = nil;
    video = [[self videos] objectAtIndex:[indexPath row]];

    // Set cells
    [cell setVideoThumbnailImage:[[UIImageView alloc] init]];
    [cell setVideoTitleLabel:[[UILabel alloc] init]];
    
    return cell;
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
