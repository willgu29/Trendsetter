//
//  ImageScrollView.h
//  Trendsetter
//
//  Created by Vivek Vinodh on 11/8/14.
//  Copyright (c) 2014 William Gu. All rights reserved.
//

#import <UIKit/UIKit.h>

enum ImageControlPositions
{
    ImageControlPositionRightCorner = 0,
    ImageControlPositionCenterBottom = 1,
    ImageControlPositionLeftCorner = 2,
};

@interface ImageScrollView : UIView <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, assign) enum ImageControlPositions imageControlPos;

- (void)setScrollViewContents: (NSArray *)images;


@end