//
//  SearchResultsTableViewController.h
//  FXI Videos
//
//  Created by Visceglia Anthony on 2/9/15.
//  Copyright (c) 2015 FXI, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchResultsTableViewController : UITableViewController <UITableViewDelegate, UISearchResultsUpdating>

// An import of the full data through which to search
@property (copy, nonatomic) NSArray *fullResults;

@end
