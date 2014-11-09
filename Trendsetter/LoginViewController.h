//
//  LoginViewController.h
//  Trendsetter
//
//  Created by William Gu on 11/8/14.
//  Copyright (c) 2014 William Gu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MDCSwipeToChoose.h"
#import "CardSet.h"

#import <Parse/Parse.h>

@interface LoginViewController : UIViewController <MDCSwipeToChooseDelegate>


@property (nonatomic, strong) CardSet *cardSet;
@property (nonatomic, strong) CardSet *tableSet;

@end
