//
//  LocationCell.m
//  LearnUCI
//
//  Created by Yuhao Ma on 2/24/14.
//  Copyright (c) 2014 gbc. All rights reserved.
//

#import "LocationCell.h"

@implementation LocationCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


+ (void)SetLocationCell:(id)cell WithLocation:(NSString*)location AndImage:(NSData*)img {
    LocationCell* lc = (LocationCell*) cell;
    lc.location.text = location;
    if (img != nil) {
        lc.image.image = [UIImage imageWithData:img];
    }
}

@synthesize location = _location;
@synthesize image = _image;
@end
