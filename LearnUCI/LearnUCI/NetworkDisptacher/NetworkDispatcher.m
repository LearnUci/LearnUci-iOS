#import <Foundation/Foundation.h>
#import "NetworkDispatcher.h"

@interface NetworkDispatcher()
+ (NSString*) buildParamString:(NSDictionary*)obj;
+ (NSString*) encodeData:(NSString*)str;
@end

@implementation NetworkDispatcher { }
+ (NSString*) getRequest:(NSDictionary*)obj WithUrl:(NSString*)url {
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    NSString *encodedParams = [NetworkDispatcher buildParamString:obj];
    NSString *paramUrl = @"";
    paramUrl = [paramUrl stringByAppendingString:url];
    paramUrl = [paramUrl stringByAppendingString:@"?"];
    paramUrl = [paramUrl stringByAppendingString:encodedParams];
    [request setURL: [NSURL URLWithString:paramUrl]];
    [request setHTTPMethod:@"GET"];
    
    NSHTTPURLResponse* response = nil;
    NSError* error = [[NSError alloc] init];
    NSData* responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    return [[NSString alloc] initWithData: responseData encoding:NSUTF8StringEncoding];
}

+ (NSString*) postRequest:(NSDictionary*)obj WithUrl:(NSString*)url {
    //set headers
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField: @"Content-Type"];
    [request setURL: [NSURL URLWithString:url]];
    [request setHTTPMethod:@"POST"];
    
    //create the body
    NSData* postData = [[NetworkDispatcher buildParamString:obj] dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:postData];
    
    //get response
    NSHTTPURLResponse* urlResponse = nil;
    NSError *error = [[NSError alloc] init];
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];
    return [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
}

+ (NSString*) buildParamString:(NSDictionary *)obj {
    
    if (obj == nil) {
        return @"";
    }
    NSString *encodedData = @"";
    for (NSString* key in obj) {
        if ([encodedData length] != 0) {
            encodedData = [encodedData stringByAppendingString:@"&"];
        }
        encodedData = [encodedData stringByAppendingString: [NetworkDispatcher encodeData: key]];
        encodedData = [encodedData stringByAppendingString: @"="];
        encodedData = [encodedData stringByAppendingString: [NetworkDispatcher encodeData: [obj valueForKey:key]]];
    }
    return encodedData;
}

+ (NSString*) encodeData:(NSString*) str {
    return (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes(NULL, (CFStringRef) str, NULL, (CFStringRef)@"!*'();:@&=+$,/?%#[]", kCFStringEncodingUTF8);
}

@end