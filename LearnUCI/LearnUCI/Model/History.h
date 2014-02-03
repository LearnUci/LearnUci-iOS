#import <Foundation/Foundation.h>

@interface History : NSObject { }
@property (copy) NSString* type;
@property (copy) NSString* keyword;
@property (copy) NSString* historyId;
@property (copy) NSString* timestamp;

- (id)initWithJson:(NSDictionary*)obj;
- (id)initWithType:(NSString*)type WithKeyword:(NSString*)keyword WithId:(NSString*)_id WithTimestamp:(NSString*)timestamp;
- (NSDictionary*) json;
- (NSString*) str;

@end