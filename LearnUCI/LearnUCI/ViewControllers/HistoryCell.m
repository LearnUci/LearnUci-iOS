//
//  HistoryCell.m
//  LearnUCI
//
//  Created by Yuhao Ma on 2/26/14.
//  Copyright (c) 2014 gbc. All rights reserved.
//

#import "HistoryCell.h"

@implementation HistoryCell

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


+ (void)SetHistoryCell:(HistoryCell*)cell WithType:(NSString *)type Keyword:(NSString *)keyword AndTimeStamp:(NSString *)timestamp {
    NSNumberFormatter* numFormatter = [[NSNumberFormatter alloc] init];
    [numFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    long lTimestamp = [[numFormatter numberFromString:timestamp] longValue];
    
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM/dd/yyyy HH:mm"];

    cell.subLabel.text = [formatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:lTimestamp]];
    cell.mainLabel.text = [NSString stringWithFormat:@"%@ - %@", type, keyword];
}

@synthesize mainLabel = _mainLabel;
@synthesize subLabel = _subLabel;
@end
