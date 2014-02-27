//
//  TourViewController.m
//  LearnUCI
//
//  Created by Yuhao Ma on 2/21/14.
//  Copyright (c) 2014 gbc. All rights reserved.
//

#import "LocationCell.h"
#import "TourViewController.h"
#import "TourPointInfo.h"
#import "QueryHandler.h"
#import "PersistentHistory.h"

@interface TourViewController ()
@end

@implementation TourViewController

UIActivityIndicatorView* loading;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    CGRect rect = [self.view frame];
    loading = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    loading.center = CGPointMake(rect.size.width / 2, rect.size.height / 2);
    loading.hidesWhenStopped = YES;
    [self.view addSubview:loading];
    [loading startAnimating];
    [NSThread detachNewThreadSelector:@selector(asyncLoad) toTarget:self withObject:nil];
    
    //self.values = [QueryHandler GetTours];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void) asyncLoad {
    self.values = [QueryHandler GetTours];
    loading.hidden = YES;
    [loading removeFromSuperview];
    [((UITableView*) self.view) reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.values == nil) {
        return 0;
    } else {
        return [self.values count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LocationCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LocationCell"];
    if (self.values != nil) {
        TourPointInfo* tourObj = [self.values objectAtIndex:[indexPath row]];
        [LocationCell SetLocationCell:cell WithLocation:[tourObj name] AndImage: [tourObj image]];
    }
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TourPointInfo* tour = [self.values objectAtIndex:indexPath.row];
    [PersistentHistory addHistoryWithType:[PersistentHistory Tour] Keyword:tour.name Id: tour.tourPointId Timestamp:[[NSDate date] timeIntervalSince1970]];
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
