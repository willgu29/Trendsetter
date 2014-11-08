//
//  Card.m
//  Decidio
//
//  Created by William Gu on 10/18/14.
//  Copyright (c) 2014 William Gu. All rights reserved.
//

#import "Card.h"

@implementation Card

-(instancetype)initWithText:(NSString *)text andNumber:(int)number
{
    self = [super init];
    if (self)
    {
        _cardText = text;
        _cardNumber = number;
    }
    return self;
}

@end
