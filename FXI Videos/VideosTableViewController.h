//
//  VideosTableViewController.h
//  FXI Videos
//
//  Created by Visceglia Anthony on 11/6/14.
//  Copyright (c) 2014 FXI, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>


/** 
 Controller for main table view on iPhone devices
    
 @inherit UITableViewController
 @conform UISearchBarDelegate
 @confrom UISeachDisplayDelegate
 */
@interface VideosTableViewController : UITableViewController <UISearchBarDelegate, UISearchDisplayDelegate>

@end
