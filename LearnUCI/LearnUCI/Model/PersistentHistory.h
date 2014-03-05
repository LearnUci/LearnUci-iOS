//
//  PersistentHistory.h
//  LearnUCI
//
//  Created by Yuhao Ma on 2/26/14.
//  Copyright (c) 2014 gbc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "History.h"

@interface PersistentHistory : NSObject
+ (NSArray*) getHistory;
+ (void) addHistoryWithType:(NSString*)type Keyword:(NSString*)keyword Id:(long long)historyId Timestamp:(long)timestamp;

+ (NSString*) Tour;
+ (NSString*) Search;
+ (NSString*) Location;
@end
