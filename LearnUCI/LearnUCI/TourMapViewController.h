//
//  TourMapViewController.h
//  LearnUCI
//
//  Created by Richard Lee on 3/2/14.
//  Copyright (c) 2014 gbc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "UIAlertViewController.h"

@class UIAlertViewController;

@interface TourMapViewController : UIViewController <MKMapViewDelegate>

@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) MKPointAnnotation *currAnnotation;
@property (strong, nonatomic) NSArray *locationPoints;
@property (nonatomic) int currLocationIndex;

//we keep a VC reference so we dont get memory error once alert is out of code scope.
@property (nonatomic) UIAlertViewController* alertVC;

@property (strong, nonatomic) NSArray *tourPoints;
-(void) getAndSetNextAnnotation;
@end
