//
//  LocationProvider.m
//  LearnUCI
//
//  Created by Yuhao Ma on 2/22/14.
//  Copyright (c) 2014 gbc. All rights reserved.
//

#import "LocationProvider.h"

@implementation LocationProvider
static LocationProvider* instance = nil;
CLLocationManager* manager = nil;

+ (LocationProvider*)instance {
    @synchronized(self) {
        if (instance == nil) {
            instance = [[self alloc] init];
            instance.loaded = NO;
        }
    }
    return instance;
}

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation {
    self.coordinate = newLocation.coordinate;
    self.loaded = YES;
}

- (void) AskStartLocationManager {
    @synchronized(self) {
        if (!self.isRunning) {
            self.isRunning = true;
            if (manager == nil) {
                manager = [[CLLocationManager alloc] init];
                manager.delegate = self;
                manager.distanceFilter = kCLDistanceFilterNone;
                manager.desiredAccuracy = kCLLocationAccuracyBest;
            }
            [manager startUpdatingLocation];
        }
    }
}

- (void) AskStopLocationManager {
    @synchronized(self) {
        if (self.isRunning) {
            self.isRunning = false;
            [manager stopUpdatingLocation];
        }
    }
}

@end
