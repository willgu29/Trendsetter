//
//  TableViewCell.m
//  Trendsetter
//
//  Created by Vivek Vinodh on 11/8/14.
//  Copyright (c) 2014 William Gu. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

@synthesize IdeaSummaryLabel = _IdeaSummaryLabel;
@synthesize NumOfHeartsLabel = _NumOfHeartsLabel;
@synthesize IdeaImageView = _IdeaImageView;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
