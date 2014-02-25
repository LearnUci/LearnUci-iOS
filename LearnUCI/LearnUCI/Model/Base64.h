//
//  Base64.h
//  LearnUCI
//
//  Created by Yuhao Ma on 2/24/14.
//  Copyright (c) 2014 gbc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Base64 : NSObject
+ (NSData *)base64DataFromString: (NSString *)string;
@end
