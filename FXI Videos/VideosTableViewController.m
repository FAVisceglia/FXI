//
//  VideosTableViewController.m
//  FXI Videos
//
//  Created by Visceglia Anthony on 11/6/14.
//  Copyright (c) 2014 FXI, Inc. All rights reserved.
//

#import "VideosTableViewController.h"
#import "FXIVideo.h"


@interface VideosTableViewController()

#pragma mark - Private Properties

// Array of the objects to represent in the table
@property (copy, nonatomic) NSMutableArray *videos;

// Filtered array of the objects to represent in the search results table
@property (copy, nonatomic) NSArray *filteredVideos;

// Filtered array of the objects to represent in the search results table
@property (copy, nonatomic) NSArray *filteredMappingVideos;

// Array of section two objects
@property (copy, nonatomic) NSMutableArray *mappingVideos;

// Array of all videos
@property (copy, nonatomic) NSArray *allVideos;

@end


#pragma mark

@implementation VideosTableViewController


#pragma mark - Constants

// Buffer space to be added between cells in the table view
#define CELL_BUFFER_SPACING 15.0


#pragma mark - Getters

/**
 Getter for the private videos array
 
 @return The local array variable, fully instantiated
 */
- (NSMutableArray *)videos
{
    // Lazy array instantiation (instantiates the array if not already done)
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
    // Lazy array instantiation (instantiates the array if not already done)
    if (!_filteredVideos)
    {
        _filteredVideos = [[NSArray alloc] init];
    }
    
    return _filteredVideos;
}

/**
 Getter for the private filtered mapping videos array
 
 @return The local array variable, fully instantiated
 */
- (NSArray *)filteredMappingVideos
{
    // Lazy array instantiation (instantiates the array if not already done)
    if (!_filteredMappingVideos)
    {
        _filteredMappingVideos = [[NSArray alloc] init];
    }
    
    return _filteredMappingVideos;
}

/**
 Getter for the private mapping videos array
 
 @return The local array variable, fully instantiated
 */
- (NSMutableArray *)mappingVideos
{
    // Lazy array instantiation (instantiates the array if not already done)
    if (!_mappingVideos)
    {
        _mappingVideos = [[NSMutableArray alloc] init];
    }
    
    return _mappingVideos;
}

/**
 Getter for the private all videos array
 
 @return The local array variable, fully instantiated
 */
- (NSArray *)allVideos
{
    // Lazy array instantiation (instantiates the array if not already done)
    if (!_allVideos)
    {
        _allVideos = [[NSArray alloc] init];
    }
    
    return _allVideos;
}


#pragma mark - View Controller Delegation

/**
 View-controller-lifecycle message sent whevener the root view is loaded
 */
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // The video to be added to the array
    FXIVideo *video = nil;
    
    NSURL *fileURL = [[NSBundle mainBundle] URLForResource:@"01 FXI About - Main"
                                             withExtension:@"m4v"];
    if (fileURL)
    {
        video = [[FXIVideo alloc] initWithURL:fileURL];
        [[self videos] addObject:video];
    }
    
    fileURL = [[NSBundle mainBundle] URLForResource:@"02 FXI About - Web"
                                      withExtension:@"m4v"];
    if (fileURL)
    {
        video = [[FXIVideo alloc] initWithURL:fileURL];
        [[self videos] addObject:video];
    }
    
    fileURL = [[NSBundle mainBundle] URLForResource:@"03 FXI Who We Are"
                                      withExtension:@"m4v"];
    if (fileURL)
    {
        video = [[FXIVideo alloc] initWithURL:fileURL];
        [[self videos] addObject:video];
    }
    
    fileURL = [[NSBundle mainBundle] URLForResource:@"04 FXI Journey"
                                      withExtension:@"m4v"];
    if (fileURL)
    {
        video = [[FXIVideo alloc] initWithURL:fileURL];
        [[self videos] addObject:video];
    }
    
    fileURL = [[NSBundle mainBundle] URLForResource:@"05 Molecules to Mattresses"
                                      withExtension:@"m4v"];
    if (fileURL)
    {
        video = [[FXIVideo alloc] initWithURL:fileURL];
        [[self videos] addObject:video];
    }
    
    fileURL = [[NSBundle mainBundle] URLForResource:@"06 Aston Tour"
                                      withExtension:@"m4v"];
    if (fileURL)
    {
        video = [[FXIVideo alloc] initWithURL:fileURL];
        [[self videos] addObject:video];
    }
    
    fileURL = [[NSBundle mainBundle] URLForResource:@"07 FXI at Nascar"
                                      withExtension:@"m4v"];
    if (fileURL)
    {
        video = [[FXIVideo alloc] initWithURL:fileURL];
        [[self videos] addObject:video];
    }
    
    fileURL = [[NSBundle mainBundle] URLForResource:@"08 Topper Instructions"
                                      withExtension:@"m4v"];
    if (fileURL)
    {
        video = [[FXIVideo alloc] initWithURL:fileURL];
        [[self videos] addObject:video];
    }
    
    fileURL = [[NSBundle mainBundle] URLForResource:@"09 Aerus Max"
                                      withExtension:@"m4v"];
    if (fileURL)
    {
        video = [[FXIVideo alloc] initWithURL:fileURL];
        [[self videos] addObject:video];
    }
    
    fileURL = [[NSBundle mainBundle] URLForResource:@"10 Ambiessence"
                                      withExtension:@"m4v"];
    if (fileURL)
    {
        video = [[FXIVideo alloc] initWithURL:fileURL];
        [[self videos] addObject:video];
    }
    
    fileURL = [[NSBundle mainBundle] URLForResource:@"11 MaxPerm"
                                      withExtension:@"m4v"];
    if (fileURL)
    {
        video = [[FXIVideo alloc] initWithURL:fileURL];
        [[self videos] addObject:video];
    }
    
    fileURL = [[NSBundle mainBundle] URLForResource:@"12 MemGel Swirl"
                                      withExtension:@"m4v"];
    if (fileURL)
    {
        video = [[FXIVideo alloc] initWithURL:fileURL];
        [[self videos] addObject:video];
    }
    
    fileURL = [[NSBundle mainBundle] URLForResource:@"13 GelTrix"
                                      withExtension:@"m4v"];
    if (fileURL)
    {
        video = [[FXIVideo alloc] initWithURL:fileURL];
        [[self videos] addObject:video];
    }
    
    fileURL = [[NSBundle mainBundle] URLForResource:@"14 Back Support Topper"
                                      withExtension:@"m4v"];
    if (fileURL)
    {
        video = [[FXIVideo alloc] initWithURL:fileURL];
        [[self mappingVideos] addObject:video];
    }
    
    fileURL = [[NSBundle mainBundle] URLForResource:@"15 Customizable Relief Topper"
                                      withExtension:@"m4v"];
    if (fileURL)
    {
        video = [[FXIVideo alloc] initWithURL:fileURL];
        [[self mappingVideos] addObject:video];
    }
    
    fileURL = [[NSBundle mainBundle] URLForResource:@"16 Elite Performance Topper"
                                      withExtension:@"m4v"];
    if (fileURL)
    {
        video = [[FXIVideo alloc] initWithURL:fileURL];
        [[self mappingVideos] addObject:video];
    }
    
    fileURL = [[NSBundle mainBundle] URLForResource:@"17 Energizing Performance Topper"
                                      withExtension:@"m4v"];
    if (fileURL)
    {
        video = [[FXIVideo alloc] initWithURL:fileURL];
        [[self mappingVideos] addObject:video];
    }
    
    fileURL = [[NSBundle mainBundle] URLForResource:@"18 Gel Topper"
                                      withExtension:@"m4v"];
    if (fileURL)
    {
        video = [[FXIVideo alloc] initWithURL:fileURL];
        [[self mappingVideos] addObject:video];
    }
    
    fileURL = [[NSBundle mainBundle] URLForResource:@"19 Smart Foam Alone1"
                                      withExtension:@"m4v"];
    if (fileURL)
    {
        video = [[FXIVideo alloc] initWithURL:fileURL];
        [[self mappingVideos] addObject:video];
    }
    
    fileURL = [[NSBundle mainBundle] URLForResource:@"20 Total Support Topper"
                                      withExtension:@"m4v"];
    if (fileURL)
    {
        video = [[FXIVideo alloc] initWithURL:fileURL];
        [[self mappingVideos] addObject:video];
    }
    
    for (id video in [self mappingVideos])
    {
        [video setCategory:@"Pressure Mapping"];
    }
    
    // Combine all the videos into a separate array
    [self setAllVideos:[[self videos] arrayByAddingObjectsFromArray:[self mappingVideos]]];
        
    // Hides search bar on view load by offsetting the table (scrolling it down)
    [[self tableView] setContentOffset:CGPointMake(0, [[[self searchDisplayController] searchBar] frame].size.height - [[self tableView] contentOffset].y)];
    
    // Disables autocorrect and autocapitalization for the searchbar
    [[[self searchDisplayController] searchBar] setAutocorrectionType:UITextAutocorrectionTypeNo];
    [[[self searchDisplayController] searchBar] setAutocapitalizationType:UITextAutocapitalizationTypeNone];
}

/**
 View controller lifecycle message sent whenever the root view will appear on screen
 */
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

/**
 View controller lifecycle message sent whenever the root view will disappear from screen
 */
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

/**
 View controller lifecycle message sent when the OS issues a memory warning
 */
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark - Search Display Delegation

/**
 Message sent whenever the text in the search bar changes
 
 @param controller: The UISearchDisplayController for the search bar
 @param searchString: The text in the search bar
 
 @return Whether or not to reload the table cells
 */
- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    // Run the filtering algorithm
    [self filterContentForSearchText:searchString
                             inScope:[[[[self searchDisplayController] searchBar] scopeButtonTitles] objectAtIndex:[[[self searchDisplayController] searchBar] selectedScopeButtonIndex]]];
    
    // Returning YES means the table should reload its cells
    return YES;
}


#pragma mark - Table View Data Source

/**
 Returns the number of sections in the main table view
 
 @param tableView: The table view for which the data is sourced
 
 @return The number of sections in the table view
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // If the active table view is the search results, there is only 1 section (the results section)
    if (tableView == [[self searchDisplayController] searchResultsTableView] && [[self filteredMappingVideos] count] == 0)
    {
        return 1;
    }
    // Else (if the table view is the main one), there are 2 sections (regular videos and mapping videos)
    else
    {
        return 2;
    }
}

/**
 Returns the number of rows in a given section
 
 @param tableView: The table view for which the data is sourced
 @param section: The section in the table
 
 @return The number of rows in the section
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // If the active table view is the search results, return the count of the filtered search results array
    if (tableView == [[self searchDisplayController] searchResultsTableView] && section == 0)
    {
        return [[self filteredVideos] count];
    }
    else if (tableView == [[self searchDisplayController] searchResultsTableView] && section == 1)
    {
        return [[self filteredMappingVideos] count];
    }
    // Else if this is the first section, return the count of the main array
    else if (section == 0)
    {
        return [[self videos] count];
    }
    // Else (if this is the second section), return the count of the mapping videos array
    else
    {
        return [[self mappingVideos] count];
    }
}

/**
 Returns the title for a given section
 
 @param tableView: The table view for which the data is sourced
 @param section: The section in the table
 
 @return The title of the given section
 */
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    // The title of the section
    NSString *sectionTitle;
    
    switch (section)
    {
        // First section
        case 0:
            sectionTitle = nil;
            break;
        // Second section
        case 1:
            sectionTitle = @"Pressure Mapping Videos";
            break;
        // All other sections
        default:
            sectionTitle = nil;
    }
    
    return sectionTitle;
}

/**
 Returns the cell for the given indexpath
 
 @param tableView: The table view for which the data is sourced
 @param indexPath: The section and row of the cell
 
 @return The cell to be used in the given indexpath
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Reuse the storyboard cells with the given identifier
    UITableViewCell *cell = [[self tableView] dequeueReusableCellWithIdentifier:@"Video Cell"];
    
    // The video that will be represented in the cell
    FXIVideo *video = nil;
    
    // If the active table view is the search results, get the corresponding video from the search results array
    if (tableView == [[self searchDisplayController] searchResultsTableView] && [indexPath section] == 0)
    {
        video = [[self filteredVideos] objectAtIndex:[indexPath row]];
    }
    else if (tableView == [[self searchDisplayController] searchResultsTableView] && [indexPath section] == 1)
    {
        video = [[self filteredMappingVideos] objectAtIndex:[indexPath row]];
    }
    // Else if this is the first section, get the corresponding video from the main array
    else if ([indexPath section] == 0)
    {
        video = [[self videos] objectAtIndex:[indexPath row]];
    }
    // Else (if this is the second section), get the corresponding video from the mapping array
    else
    {
        video = [[self mappingVideos] objectAtIndex:[indexPath row]];
    }
    
    // Set the text and text color for the label of the cell (to the video's title and FXI dark blue, respectfully)
    [[cell textLabel] setText:[[video title] substringFromIndex:3]];
    [[cell textLabel] setTextColor:[UIColor colorWithRed:(18.0/255.0)
                                                   green:(52.0/255.0)
                                                    blue:(88.0/255.0)
                                                   alpha:1.0f]];
    
    return cell;
}


#pragma mark - Table View Delegate

/**
 Table view message sent when a section header view will be displayed
 
 @param tableView: The table view for which the section
 @param section: The section for which the header view is assigned
 */
- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    // Set the text color for all the section header view to FXI dark blue
    UITableViewHeaderFooterView *sectionHeader = (UITableViewHeaderFooterView *)view;
    [[sectionHeader textLabel] setTextColor:[UIColor colorWithRed:(18.0/255.0)
                                                            green:(52.0/255.0)
                                                             blue:(88.0/255.0)
                                                            alpha:1.0f]];
}

/**
 Table view message sent when a user selects a cell
 
 @param tableView: The table view in which a cell was selected
 @param indexPath: The section and row of the selected cell
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // The FXI video that corresponds to the selected cell
    FXIVideo *video = nil;
    
    // If active table view is the search results, grab selected video from search results array
    if (tableView == [[self searchDisplayController] searchResultsTableView] && [indexPath section] == 0)
    {
        video = [[self filteredVideos] objectAtIndex:[indexPath row]];
    }
    else if (tableView == [[self searchDisplayController] searchResultsTableView] && [indexPath section] == 0)
    {
        video = [[self filteredMappingVideos] objectAtIndex:[indexPath row]];
    }
    // Else if selected cell is in the first section, grab selected video from main array
    else if ([indexPath section] == 0)
    {
        video = [[self videos] objectAtIndex:[indexPath row]];
    }
    // Else (if selected cell is in the second section), grab the selected video from mapping array
    else
    {
        video = [[self mappingVideos] objectAtIndex:[indexPath row]];
    }

    // Initialize a movie player controller with the selected video and set playback settings
    MPMoviePlayerViewController *player = [[MPMoviePlayerViewController alloc] initWithContentURL:[video videoURL]];
    [[player moviePlayer] setFullscreen:YES
                               animated:YES];
    [[player moviePlayer] setScalingMode:MPMovieScalingModeAspectFit];
    
    // Present the movie player controller with animation
    [self presentMoviePlayerViewControllerAnimated:player];
}


#pragma mark - Target Actions

/**
 Action triggered when the search button is touched
 
 @param sender: The button that was touched
 */
- (IBAction)searchButtonTouched:(UIBarButtonItem *)sender
{
    // Activate the search bar and search display controller with animation
    [[self tableView] setContentOffset:CGPointMake(0.0f, -self.tableView.contentInset.top)
                              animated:NO];
    [[self searchDisplayController] setActive:YES
                                     animated:YES];
    [[[self searchDisplayController] searchBar] becomeFirstResponder];
}


#pragma mark - Private Methods

/**
 Filter the video results based on the search query
 
 @param searchText: The search query to filter by
 @param scope: The search scope to filter in
 */
- (void)filterContentForSearchText:(NSString *)searchText inScope:(NSString *)scope
{
    // Reset and clear any previous search results
    [self setFilteredVideos:nil];
    [self setFilteredMappingVideos:nil];
    
    // Use a predicate to parse search query and populate filtered results
    // "title" refers to the property to search against
    // "CONTAINS[c]" means that if the title contains the search query (case-insensitive)
    // "category" refers to an additional property to search against, using a logical OR
    // "BEGINSWITH[c] means that if the category begins with the search query (case-insensitive)
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"title CONTAINS[c] %@ OR category BEGINSWITH[c] %@", searchText, searchText];
    [self setFilteredVideos:[[self videos] filteredArrayUsingPredicate:predicate]];
    [self setFilteredMappingVideos:[[self mappingVideos] filteredArrayUsingPredicate:predicate]];
}

@end
