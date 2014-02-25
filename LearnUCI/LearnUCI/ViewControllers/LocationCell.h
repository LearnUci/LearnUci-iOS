//
//  LocationCell.h
//  LearnUCI
//
//  Created by Yuhao Ma on 2/24/14.
//  Copyright (c) 2014 gbc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LocationCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel* location;
@property (nonatomic, weak) IBOutlet UIImageView* image;

+ (void)SetLocationCell:(id)cell WithLocation:(NSString*)location AndImage:(NSData*)img;

@end
