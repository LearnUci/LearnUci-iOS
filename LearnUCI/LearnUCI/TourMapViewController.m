//
//  TourMapViewController.m
//  LearnUCI
//
//  Created by Richard Lee on 3/2/14.
//  Copyright (c) 2014 gbc. All rights reserved.
//

#import "TourMapViewController.h"

@interface TourMapViewController ()

@end

@implementation TourMapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _mapView.showsUserLocation = YES;
    
    //manually set location to middle of UCI
    MKCoordinateRegion region =
    MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake(33.645, -117.839), 3600, 3600);
    [_mapView setRegion:region animated:YES];
    _mapView.mapType = MKMapTypeHybrid;
    
    NSLog([@(_tourPoints.count) stringValue]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
