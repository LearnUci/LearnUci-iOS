//
//  QueryHandler.h
//  LearnUCI
//
//  Created by Yuhao Ma on 2/22/14.
//  Copyright (c) 2014 gbc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LocationPoint.h"

@interface QueryHandler : NSObject { }
+ (NSArray*) GetTours;
+ (NSArray*) Search:(NSString*)query;
+ (NSArray*) ProximityOfLat:(double)lat Lng:(double)lng;
+ (NSArray*) GetLocationsFromTour:(long long)tourId;
+ (NSArray*) GetLocationsFromId: (long long) locId;
@end
