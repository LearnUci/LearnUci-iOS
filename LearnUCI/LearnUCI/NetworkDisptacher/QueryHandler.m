//
//  QueryHandler.m
//  LearnUCI
//
//  Created by Yuhao Ma on 2/22/14.
//  Copyright (c) 2014 gbc. All rights reserved.
//

#import "QueryHandler.h"
#import "NetworkDispatcher.h"
#import "LocationPoint.h"
#import "TourPointInfo.h"

@interface QueryHandler()
+ (NSArray*) ToJsonObject:(NSString*)str;
@end

@implementation QueryHandler
NSString* PATH = @"http://learnuci.appspot.com/query";
NSString* ACTION_TOUR = @"TOURS";
NSString* ACTION_SEARCH = @"SEARCH";
NSString* ACTION_PROXIMITY = @"PROXIMITY";
NSString* ACTION_EXPAND_TOUR = @"EXPAND_TOUR";
NSString* ACTION_MATCH_ID = @"MATCH";
NSString* TYPE_ID = @"id";

+ (NSArray*) ToJsonObject:(NSString*) str {
    NSError* err;
    return [NSJSONSerialization JSONObjectWithData:[str dataUsingEncoding:NSUTF8StringEncoding]
                                options:NSJSONReadingAllowFragments
                                error:&err];
}

//Gets a list of all Tours
+ (NSArray*) GetTours {
    NSMutableArray* res = [NSMutableArray array];
    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    [dict setValue:ACTION_TOUR forKey:@"action"];
    NSArray* arr = [QueryHandler ToJsonObject:[NetworkDispatcher getRequest:dict WithUrl:PATH]];
    for (int i = 0; i < [arr count]; i++) {
        [res addObject:[[TourPointInfo alloc] initWithJson:[arr objectAtIndex:i]]];
    }
    return res;
}

//Input: User text input
//Output: Result Set of Location Points
+ (NSArray*) Search:(NSString*)query {
    NSMutableArray* res = [NSMutableArray array];
    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    [dict setValue:ACTION_SEARCH forKey:@"action"];
    [dict setValue:query forKey:@"value"];
    NSArray* arr = [QueryHandler ToJsonObject: [NetworkDispatcher getRequest:dict WithUrl:PATH]];
    for (int i = 0; i < [arr count]; i++) {
        [res addObject:[[LocationPoint alloc] initWithJson:[arr objectAtIndex:i]]];
    }
    return res;
}

//Input: User GPS coord
//Output: Result Set of nearby Location Points
+ (NSArray*) ProximityOfLat:(double)lat Lng:(double)lng {
    NSString* jsonString = [NSString stringWithFormat:@"{\"latitude\":%f,\"longitude\":%f}", lat, lng];
    NSMutableArray* res = [NSMutableArray array];
    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    [dict setValue:ACTION_PROXIMITY forKey:@"action"];
    [dict setValue:jsonString forKey:@"value"];
    NSArray* arr = [QueryHandler ToJsonObject: [NetworkDispatcher getRequest:dict WithUrl:PATH]];
    for (int i = 0; i < [arr count]; i++) {
        [res addObject:[[LocationPoint alloc] initWithJson:[arr objectAtIndex:i]]];
    }
    return res;
}

//Input: unique tour id from TourViewController
//Output: List of LocationPoint objects
+ (NSArray*) GetLocationsFromTour:(long long)tourId {
    NSMutableArray* res = [NSMutableArray array];
    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    [dict setValue:ACTION_EXPAND_TOUR forKey:@"action"];
    [dict setValue:[@(tourId) stringValue] forKey:@"value"];
    NSArray* arr = [QueryHandler ToJsonObject: [NetworkDispatcher getRequest:dict WithUrl:PATH]];

    for (int i = 0; i < [arr count]; i++) {
        [res addObject:[[LocationPoint alloc] initWithJson:[arr objectAtIndex:i]]];
    }
    return res;
}

//takes a location or tour id and returns locations
+ (NSArray*)  GetLocationsFromId:(long long)locId {
    //http://learnuci.appspot.com/query?action=MATCH&value=5079606281371648&type=id
    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    [dict setValue:ACTION_MATCH_ID forKey:@"action"];
    [dict setValue:[@(locId) stringValue] forKey:@"value"];
    [dict setValue:TYPE_ID forKey:@"type"];
    NSArray* arr = [QueryHandler ToJsonObject: [NetworkDispatcher getRequest:dict WithUrl:PATH]];
    if (arr == nil) {
        //maybe id wasn't a location id, but rather a tour id
        return [QueryHandler GetLocationsFromTour:locId];
    }
    return arr;
}
@end
