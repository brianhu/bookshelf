//
//  RecordSummaryCell.m
//  BookShelf
//
//  Created by Brian Hu on 7/8/14.
//  Copyright (c) 2014 Brian Hu. All rights reserved.
//

#import "RecordSummaryCell.h"

@implementation RecordSummaryCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
