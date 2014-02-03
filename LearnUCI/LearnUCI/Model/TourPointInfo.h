#import <Foundation/Foundation.h>

@interface TourPointInfo : NSObject { }

@property (copy) NSString* name;
@property (copy) NSString* description;
@property (copy) NSData* image;
@property (readonly) long tourPointId;
@property (copy) NSArray* locationPoints;

- (id)initWithJson:(NSDictionary*)obj;

@end