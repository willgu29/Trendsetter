//
//  CardSet.m
//  Decidio
//
//  Created by William Gu on 10/18/14.
//  Copyright (c) 2014 William Gu. All rights reserved.
//

#import "CardSet.h"
#import "Card.h"
#import <Parse/Parse.h>

const int NUMBER_OF_CARDS_IN_DECK = 89;

@interface CardSet()
{
    BOOL outOfCards;
}

@property (nonatomic, strong) NSArray *cardSet;
@property (nonatomic) int onCardNumber;

@end

@implementation CardSet

-(instancetype)init
{
    self = [super init];
    if (self)
    {
        [self addCardsToArray];
        _onCardNumber = 0;
        outOfCards = NO;
    }
    return self;
}

-(void)addCardsFromParse
{
    //TODO:
    PFQuery *query = [PFQuery queryWithClassName:@"Ideas"];
    query.limit = 100;
    [query orderByDescending:@"updatedAt"];
    PFUser *user = (PFUser *)[query getFirstObject];
    
    NSLog(@"User? :%@",user);
    
    
}


-(void)addCardsToArray
{

    //TODO: REPLACE THIS METHOD WITH DATABASE PULL
    
    NSMutableArray *temporaryArray = [[NSMutableArray alloc] init];
    
    NSString* path = [[NSBundle mainBundle] pathForResource:@"Card List"
                                                     ofType:@"txt"];
    NSString* content = [NSString stringWithContentsOfFile:path
                                                  encoding:NSUTF8StringEncoding
                                                     error:NULL];
    NSLog(@"%@",path);
    NSLog(@"%@", content);
    
    int counter = 0;
    NSArray *eachLine = [content componentsSeparatedByString:@"\n"];
    for (NSString *lineItem in eachLine)
    {
        counter++;
        NSArray *numberAndText = [lineItem componentsSeparatedByString:@"."];
        if ([numberAndText count] < 2)
        {
            break;
        }
        NSString *text = [numberAndText objectAtIndex:1];
        
        Card *card = [[Card alloc] initWithText:text andNumber:counter];
        [temporaryArray addObject:card];
    }
    
    _cardSet = temporaryArray;
}



-(NSInteger)randomNumberFrom:(int)min toMax:(int)max
{
    int r = (arc4random_uniform(max-min) + min);
    return r;
}

#pragma mark - Public

-(Card *)getRandomCard
{
    return [_cardSet objectAtIndex:[self randomNumberFrom:0 toMax:([_cardSet count]-1)]];
}

-(NSArray *)getNumberOfRandomCards:(int)number
{
    NSMutableArray *temporaryArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < number; i++)
    {
        [temporaryArray addObject:[self getRandomCard]];
    }
    return temporaryArray.copy;
}

-(Card *)getNextCard
{
    //TODO: PULL CARDS FROM DATABASE, add to _cardSet array.
    
    
    _onCardNumber++;
    
    if (NUMBER_OF_CARDS_IN_DECK <= _onCardNumber)
    {
        outOfCards = YES;
        return nil;
    }
    
    return [_cardSet objectAtIndex:_onCardNumber];
}

-(Card *)getCardNumber:(int)number
{
    return [_cardSet objectAtIndex:number];
}

-(NSArray *)getNextFiveCards
{
    
    //TODO: GET DATABASE PULL
    
    NSMutableArray *temporaryArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < 5; i++)
    {
        Card *card = [self getNextCard];
        if (card == nil)
        {
            break;
        }
        [temporaryArray addObject:card];
    }
    return temporaryArray.copy;
}

-(void)shuffleDeck
{
    
    NSUInteger count = [_cardSet count];
    NSMutableArray *temporaryArray = _cardSet.mutableCopy;
    for (NSUInteger i = 0; i < count; ++i)
    {
        NSInteger remainingCount = count - i;
        NSInteger exchangeIndex = i + arc4random_uniform(remainingCount);
        [temporaryArray exchangeObjectAtIndex:i withObjectAtIndex:exchangeIndex];
    }
    
    outOfCards = NO;
    _onCardNumber = 0;
    _cardSet = temporaryArray.copy;
}

-(int)count
{
    return [_cardSet count];
}

-(int)cardsLeftNormal
{
    return ([_cardSet count] - _onCardNumber);
}

@end
