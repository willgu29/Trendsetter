//
//  Card.h
//  Trendsetter
//
//  Created by William Gu on 11/8/14.
//  Copyright (c) 2014 William Gu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (nonatomic, strong) NSString *cardText;
@property (nonatomic) int cardNumber;

-(instancetype)initWithText:(NSString *)text andNumber:(int)number;

@end
