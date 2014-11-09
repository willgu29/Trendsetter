//
//  MyIdeasTableViewCell.h
//  Trendsetter
//
//  Created by William Gu on 11/8/14.
//  Copyright (c) 2014 William Gu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyIdeasTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *likes;
@property (nonatomic, weak) IBOutlet UILabel *dislikes;
@property (nonatomic, weak) IBOutlet UILabel *textIdea;
@property (nonatomic, weak) IBOutlet UILabel *timeSincePost;

@end
