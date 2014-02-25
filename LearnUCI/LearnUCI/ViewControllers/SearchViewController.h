//
//  SearchViewController.h
//  LearnUCI
//
//  Created by Yuhao Ma on 2/24/14.
//  Copyright (c) 2014 gbc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchViewController : UITableViewController<UISearchBarDelegate>
@property (strong,nonatomic) NSArray* arr;
@property IBOutlet UISearchBar* searchBar;
@end
