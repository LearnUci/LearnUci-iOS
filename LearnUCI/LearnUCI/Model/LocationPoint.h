#import <Foundation/Foundation.h>

@interface LocationPoint : NSObject { }

@property (readonly) float latitude;
@property (readonly) float longitude;
@property (copy, readonly) NSString* name;
@property (copy, readonly) NSString* abbreviation;
@property (copy, readonly) NSString* type;
@property (copy, readonly) NSString* description;
@property (copy, readonly) NSData* image;
@property (readonly) long long locationPointId;

- (BOOL) hasImage;
- (BOOL) hasDescription;
- (id)initWithJson:(NSDictionary*)obj;
@end