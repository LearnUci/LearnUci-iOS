#import <Foundation/Foundation.h>
#import "History.h"

@implementation History { }

- (id)initWithJson:(NSDictionary*)obj {
    self = [super init];
    if (self) {
        _type = [obj objectForKey:@"type"];
        _keyword = [obj objectForKey:@"keyword"];
        _historyId = [obj objectForKey:@"id"];
        _timestamp = [obj objectForKey:@"timestamp"];
    }
    return self;
}

- (id)initWithType:(NSString*)type
        WithKeyword:(NSString*)keyword
        WithId:(NSString*)_id
        WithTimestamp:(NSString*)timestamp {
    self = [super init];
    if (self) {
        _type = type;
        _keyword = keyword;
        _historyId = _id;
        _timestamp = timestamp;
    }
    return self;
}

- (NSDictionary*) json {
    NSMutableDictionary* res = [NSMutableDictionary dictionary];
    [res setObject:_type forKey:@"type"];
    [res setObject:_keyword forKey:@"keyword"];
    [res setObject:_historyId forKey:@"id"];
    [res setObject:_timestamp forKey:@"timestamp"];
    return res;
}

- (NSString*) str {
    return [[_type stringByAppendingString:@": "] stringByAppendingString:_keyword];
}

@synthesize type = _type;
@synthesize keyword = _keyword;
@synthesize historyId = _historyId;
@synthesize timestamp = _timestamp;
@end