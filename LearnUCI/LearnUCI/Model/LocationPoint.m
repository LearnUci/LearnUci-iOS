#import <Foundation/Foundation.h>
#import "LocationPoint.h"

#import "Base64.h"

@implementation LocationPoint { }

- (id)initWithJson:(NSDictionary*)obj {
  self = [super init];
  if (self) {
    float tempLat = [[obj objectForKey:@"lat"] floatValue];
    float tempLng = [[obj objectForKey:@"lng"] floatValue];
    _name = [obj objectForKey:@"name"];
    _abbreviation = [obj objectForKey:@"abbr"];
    _type = [obj objectForKey:@"type"];
    _locationPointId = [[obj objectForKey:@"id"] longLongValue];
    _description = [obj objectForKey:@"desc"];
    _image = [Base64 base64DataFromString: [obj objectForKey:@"img"]];
    _latitude = (0.120246f * tempLat) + (-0.0460953f * tempLng) + 24.1819f;
    _longitude = (0.0693213f * tempLat) + (0.118713f * tempLng) - 106.18865f;
  }
  return self;
}

- (BOOL)hasImage {
    return _image == nil;
}

- (BOOL)hasDescription {
    return _description == nil;
}

@synthesize latitude = _latitude;
@synthesize longitude = _longitude;
@synthesize name = _name;
@synthesize abbreviation = _abbreviation;
@synthesize type = _type;
@synthesize description = _description;
@synthesize image = _image;
@synthesize locationPointId = _locationPointId;
@end