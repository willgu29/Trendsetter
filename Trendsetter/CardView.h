//
//  CardView.h
//  Decidio
//
//  Created by William Gu on 10/18/14.
//  Copyright (c) 2014 William Gu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardView : UIView

@property (nonatomic, weak) IBOutlet UILabel *cardText;
@property (nonatomic, strong) NSString *authorOf;
@property (nonatomic, weak) IBOutlet UILabel *authorText;
@property (nonatomic, weak) IBOutlet UILabel *cardNumber;

//-(instancetype)initWithCardText:(NSString *)text andNumber:(int)number;

@end
