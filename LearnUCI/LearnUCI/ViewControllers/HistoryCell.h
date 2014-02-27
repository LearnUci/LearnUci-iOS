//
//  HistoryCell.h
//  LearnUCI
//
//  Created by Yuhao Ma on 2/26/14.
//  Copyright (c) 2014 gbc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HistoryCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel* mainLabel;
@property (nonatomic, weak) IBOutlet UILabel* subLabel;

+ (void)SetHistoryCell:(HistoryCell*)cell WithType:(NSString*)type Keyword:(NSString*)keyword AndTimeStamp:(NSString*)timestamp;
@end
