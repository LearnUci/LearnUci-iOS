//
//  PersistentHistory.m
//  LearnUCI
//
//  Created by Yuhao Ma on 2/26/14.
//  Copyright (c) 2014 gbc. All rights reserved.
//

#import "PersistentHistory.h"

@interface PersistentHistory()
+ (void) loadFromPersistentStorage;
+ (void) saveToPersistentStorage:(NSArray*) arr;
@end

@implementation PersistentHistory
static NSMutableArray* arr = nil;
static NSString* TOUR = @"Tour";
static NSString* SEARCH = @"Search";
static NSString* LOCATION = @"Location";

+ (void) loadFromPersistentStorage {
    if (arr == nil) {
        arr = [NSMutableArray array];
        NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        NSArray* readArr = [NSArray arrayWithContentsOfFile:[rootPath stringByAppendingString:@"/history.plist"]];
        for (int i = 0; i < readArr.count; i++) {
            [arr addObject:[[History alloc] initWithJson:[readArr objectAtIndex:i]]];
        }
    }
}

+ (void) saveToPersistentStorage:(NSArray*) arrToWrite {
    if (arrToWrite != nil) {
        NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        NSMutableArray* writeArray = [NSMutableArray array];
        for (int i = 0; i < arrToWrite.count; i++) {
            NSMutableDictionary* dict = [NSMutableDictionary dictionary];
            History* history = [arrToWrite objectAtIndex:i];
            [dict setObject:history.type forKey:@"type"];
            [dict setObject:history.keyword forKey:@"keyword"];
            [dict setObject:history.historyId forKey:@"id"];
            [dict setObject:history.timestamp forKey:@"timestamp"];
            [writeArray addObject:dict];
        }

        [writeArray writeToFile:[rootPath stringByAppendingString:@"/history.plist"] atomically:YES];
    }
}

+ (NSArray*) getHistory {
    [PersistentHistory loadFromPersistentStorage];
    NSMutableArray* res = [NSMutableArray array];
    for (int i = arr.count - 1; i >= 0; i--) {
        [res addObject:[arr objectAtIndex:i]];
    }
    return res;
}

+ (void) addHistoryWithType:(NSString*)type Keyword:(NSString*)keyword Id:(long long)historyId Timestamp:(long)timestamp {
    if (arr == nil) {
        arr = [NSMutableArray array];
    }
    History* history = [[History alloc] initWithType:type
                        WithKeyword:keyword
                        WithId:[NSString stringWithFormat:@"%lld", historyId]
                        WithTimestamp:[NSString stringWithFormat:@"%ld", timestamp]];
    [arr addObject:history];
    // Trim off to keep a max of 100 elements in history
    while ([arr count] > 100) {
        [arr removeObjectAtIndex:0];
    }
    [PersistentHistory saveToPersistentStorage: arr];
}

+ (NSString*) Tour { return TOUR; }
+ (NSString*) Location { return LOCATION; }
+ (NSString*) Search { return SEARCH; }

@end
