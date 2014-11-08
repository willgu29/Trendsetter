//
//  CardSet.h
//  Decidio
//
//  Created by William Gu on 10/18/14.
//  Copyright (c) 2014 William Gu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface CardSet : NSObject


-(instancetype)init;
-(Card *)getCardNumber:(int)number;
-(Card *)getRandomCard;
-(NSArray *)getNumberOfRandomCards:(int)number;
-(void)resetDeck;
-(Card *)getNextCard;
-(NSArray *)getNextFiveCards;
-(void)shuffleDeck;
-(int)count;
-(int)cardsLeftNormal;

@end
