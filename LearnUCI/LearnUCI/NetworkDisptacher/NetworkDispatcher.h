#import <Foundation/Foundation.h>

@interface NetworkDispatcher : NSObject { }
+ (NSString*) getRequest:(NSDictionary*)obj WithUrl:(NSString*)url;
+ (NSString*) postRequest:(NSDictionary*)obj WithUrl:(NSString*)url;
@end