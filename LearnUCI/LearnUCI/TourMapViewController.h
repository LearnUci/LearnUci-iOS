//
//  TourMapViewController.h
//  LearnUCI
//
//  Created by Richard Lee on 3/2/14.
//  Copyright (c) 2014 gbc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface TourMapViewController : UIViewController
    <MKMapViewDelegate>

@property (strong, nonatomic) IBOutlet MKMapView *mapView;

@property (strong, nonatomic) NSArray *tourPoints;
@end
