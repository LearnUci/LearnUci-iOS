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
NSString* ACTION_SEARCH = @"QUERY";
NSString* ACTION_PROXIMITY = @"PROXIMITY";

+ (NSArray*) ToJsonObject:(NSString*) str {
    NSError* err;
    return [NSJSONSerialization JSONObjectWithData:[str dataUsingEncoding:NSUTF8StringEncoding]
                                options:NSJSONReadingAllowFragments
                                error:&err];
}

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

+ (NSArray*) ProximityOfLat:(NSString*)lat Lng:(NSString*)lng {
    NSString* jsonString = [NSString stringWithFormat:@"{\"latitude\"%@,\"longitude\":%@}}", lat, lng];
    NSMutableArray* res = [NSMutableArray array];
    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    [dict setValue:ACTION_PROXIMITY forKey:@"action"];
    [dict setValue:jsonString forKey:@"value"];
    NSArray* arr = [QueryHandler ToJsonObject: [NetworkDispatcher getRequest:dict WithUrl:PATH]];
    for (int i = 0; i < [arr count]; i++) {
        [res addObject:[[LocationPoint alloc] initWithJson:[arr objectAtIndex:i]]];
    }
    return res;}
@end
