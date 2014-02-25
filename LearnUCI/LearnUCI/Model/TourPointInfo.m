#import <Foundation/Foundation.h>
#import "TourPointInfo.h"

#import "Base64.h"
@implementation TourPointInfo {
  NSArray* _locIds;
}

- (id)initWithJson:(NSDictionary*)obj {
    self = [super init];
    if (self) {
        _name = [obj objectForKey:@"name"];
        _description = [obj objectForKey:@"desc"];
        _image = [Base64 base64DataFromString: [obj objectForKey:@"img"]];
        _tourPointId = [[obj objectForKey:@"id"] longValue];
        _locationPoints = [obj objectForKey:@"points"];
        _locIds = [NSArray array];
    }
    return self;
}

@synthesize name = _name;
@synthesize description = _description;
@synthesize image = _image;
@synthesize tourPointId = _tourPointId;
@synthesize locationPoints = _locationPoints;
@end