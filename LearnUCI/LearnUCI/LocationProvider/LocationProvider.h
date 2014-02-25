//
//  LocationProvider.h
//  LearnUCI
//
//  Created by Yuhao Ma on 2/22/14.
//  Copyright (c) 2014 gbc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface LocationProvider : NSObject<CLLocationManagerDelegate>

+ (LocationProvider*) instance;
- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation;

- (void)AskStartLocationManager;
- (void)AskStopLocationManager;

@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (nonatomic) bool loaded;
@property (nonatomic) bool isRunning;

@end
