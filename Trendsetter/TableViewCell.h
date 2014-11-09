//
//  TableViewCell.h
//  Trendsetter
//
//  Created by Vivek Vinodh on 11/8/14.
//  Copyright (c) 2014 William Gu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *IdeaSummaryLabel;
@property (nonatomic, weak) IBOutlet UILabel *NumOfHeartsLabel;
@property (nonatomic, weak) IBOutlet UIImageView *IdeaImageView;
@property (nonatomic, weak) IBOutlet UILabel *timeAndAuthor;

@end
