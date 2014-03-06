//
//  UIAlertViewController.h
//  LearnUCI
//
//  Created by Richard Lee on 3/6/14.
//  Copyright (c) 2014 gbc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TourMapViewController.h"
#import "LocationPoint.h"

@class TourMapViewController;

@interface UIAlertViewController : UIViewController <UIAlertViewDelegate>

@property (nonatomic, strong) TourMapViewController* caller;
//+(int) TOUR_DONE_ALERT;
//+(int) NEXT_POINT_ALERT;
@end
