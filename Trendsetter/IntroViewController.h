//
//  IntroViewController.h
//  Decidio
//
//  Created by William Gu on 10/18/14.
//  Copyright (c) 2014 William Gu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardSet.h"
#import "MDCSwipeToChoose.h"

@interface IntroViewController : UIViewController <MDCSwipeToChooseDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) CardSet *cardSet;
@property (nonatomic, strong) CardSet *tableSet;

@end
