//
//  IntroViewController.m
//  Decidio
//
//  Created by William Gu on 10/18/14.
//  Copyright (c) 2014 William Gu. All rights reserved.
//

#import "IntroViewController.h"
#include <stdlib.h> //for random numbers
#import "MDCSwipeToChoose.h"
#import "CardView.h"



@interface IntroViewController ()
{
    BOOL isTable; //DEFAULT NO;
    BOOL isNotRandom; //DEFAULT YES;
    int cardsInStack;
    int cardsGoneThrough;
}

@property (nonatomic, weak) IBOutlet UIButton *randomCard;
@property (nonatomic, weak) IBOutlet UIButton *toggleDisplay;
@property (nonatomic, weak) IBOutlet UIView *outOfCards;
@property (nonatomic, weak) IBOutlet UIStepper *stepper;
@property (nonatomic, weak) IBOutlet UILabel *randomNumber;
@property (nonatomic, weak) IBOutlet UILabel *cardsLeft;


@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end

@implementation IntroViewController

#pragma mark - IBActions

-(void)swipeFromView
{
    for (UIView *view in self.view.subviews)
    {
        if ([view isKindOfClass:[CardView class]])
        {
//            cardsInStack--;
            [view mdc_swipe:MDCSwipeDirectionLeft];
        }
        
    }
}

-(void)swipeDelay
{
    for (UIView *view in self.view.subviews)
    {
        if ([view isKindOfClass:[CardView class]])
        {
//            cardsInStack--;
            [view mdc_swipe:MDCSwipeDirectionLeft];
            break;
        }
        
    }
    [self performSelector:@selector(swipeDelay) withObject:nil afterDelay:0.05];
}

-(IBAction)randomCard:(UIButton *)sender
{
    isNotRandom = NO;
    NSArray *arrayOfRandomCards = [_cardSet getNumberOfRandomCards:_randomNumber.text.integerValue];
//    [self removeCardsFromView];
    [self swipeFromView];
    cardsGoneThrough = 0;
    _cardsLeft.text = [NSString stringWithFormat:@"Cards left: %d",_randomNumber.text.integerValue];
    [self performSelector:@selector(forArrayAddToView:) withObject:arrayOfRandomCards afterDelay:0.5];
//    [self forArrayAddToView:arrayOfRandomCards];
}

-(IBAction)resetDeck:(UIButton *)sender
{
    isNotRandom = YES;
    cardsGoneThrough = 0;
    _cardsLeft.text = [NSString stringWithFormat:@"Cards left: %d",([_cardSet count] - cardsGoneThrough)];
    [_cardSet shuffleDeck];
    [self displayNewDeckTop];
}

-(IBAction)toggleDisplay:(UIButton *)sender
{
    if (isTable == NO)
    {
        isTable = YES;
        _tableView.hidden = NO;
    }
    else
    {
        isTable = NO;
        _tableView.hidden = YES;
    }
}

-(IBAction)stepper:(UIStepper *)sender
{
    _randomNumber.text = [NSString stringWithFormat:@"%.f", sender.value];
}

//-(IBAction)nextCardButton:(UIButton *)sender
//{
//    UIView *view = [self.view.subviews firstObject];
//    [view mdc_swipe:MDCSwipeDirectionLeft];
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _cardSet = [[CardSet alloc] init];
    _tableSet = [[CardSet alloc] init];
    
    [_cardSet shuffleDeck];
    isTable = NO;
    cardsInStack = 0;
    cardsGoneThrough = 0;
    _tableView.hidden = YES;
    _randomNumber.text = [NSString stringWithFormat:@"%.f", _stepper.value];
    _cardsLeft.text = [NSString stringWithFormat:@"Cards left: %d", [_cardSet count]];
    isNotRandom = YES;

}

-(void)viewWillAppear:(BOOL)animated
{
    [self displayNewDeckTop];
}

-(void)displayNewDeckTop
{
    Card *card = [_cardSet getCardNumber:0];
    [self addCardToView:card.cardText andNumber:card.cardNumber];
    
    NSArray *arrayOfCards = [_cardSet getNextFiveCards];
    [self forArrayAddToView:arrayOfCards];
}

-(void)forArrayAddToView:(NSArray *)arrayOfCards;
{
    for (Card *card in arrayOfCards)
    {
        if (card == nil)
        {
            break;
        }
        [self addCardToView:card.cardText andNumber:card.cardNumber];
    }
}


-(void)addCardToView:(NSString *)text andNumber:(int)number
{
    cardsInStack++;
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CardView" owner:self options:nil];
    CardView *cardView  = [nib objectAtIndex:0];
    cardView.cardNumber.text = [NSString stringWithFormat:@"%d/%d",number, [_cardSet count]];
    cardView.cardText.text = text;
    
    MDCSwipeOptions *options = [MDCSwipeOptions new];
    options.delegate = self;
    options.onPan = ^(MDCPanState *state){
        if (state.thresholdRatio == 1.f && state.direction == MDCSwipeDirectionLeft) {
            NSLog(@"Let go now to delete the photo!");
        }
        if (state.thresholdRatio == 1.f && state.direction == MDCSwipeDirectionRight) {
            NSLog(@"Let go now to delete the photo!");
        }
    };
    [cardView setFrame:CGRectMake(18, 70, cardView.frame.size.width, cardView.frame.size.height)];
    [cardView mdc_swipeToChooseSetup:options];

//    [self.view addSubview:cardView];
    
    //TODO: animate
    if (isNotRandom)
    {
        //ANIMATE
    }
    
    [self.view insertSubview:cardView aboveSubview:_outOfCards];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)removeCardsFromView
{
    for (UIView *view in self.view.subviews)
    {
        if ([view isKindOfClass:[CardView class]])
        {
            cardsInStack--;
            [view removeFromSuperview];
        }
    }
}


#pragma mark - Helper function





#pragma mark - Swipe Delegates

-(void)viewDidCancelSwipe:(UIView *)view
{
    
}

-(BOOL)view:(UIView *)view shouldBeChosenWithDirection:(MDCSwipeDirection)direction
{
    if (direction == MDCSwipeDirectionLeft) {
        return YES;

    }
    else if (direction == MDCSwipeDirectionRight)
    {
        return YES;
    }
    else
    {
        // Snap the view back and cancel the choice.
        [UIView animateWithDuration:0.16 animations:^{
            view.transform = CGAffineTransformIdentity;
            view.center = self.view.window.center; //superview
        }];
        return NO;
    }
}

-(void)view:(UIView *)view wasChosenWithDirection:(MDCSwipeDirection)direction
{
    if (direction == MDCSwipeDirectionLeft) {
//        NSLog(@"Photo deleted!");
    } else {
//        NSLog(@"Photo saved!");
    }
    cardsInStack--;
    cardsGoneThrough++;
    if (isNotRandom)
    {
        _cardsLeft.text = [NSString stringWithFormat:@"Cards left: %d",([_cardSet count] - cardsGoneThrough)];
    }
    else
    {
        _cardsLeft.text = [NSString stringWithFormat:@"Cards left: %d",cardsInStack];
    }
    
    if (cardsInStack < 3 && isNotRandom)
    {
        NSLog(@"Add cards!");
        NSArray *arrayOfCards = [_cardSet getNextFiveCards];
        [self forArrayAddToView:arrayOfCards];

    }
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_tableSet count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //FOR custom cell later
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        //TODO: if user.. if hashtag... if location
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        
    }
    Card *card = [_tableSet getCardNumber:indexPath.row];
    
    cell.textLabel.text = card.cardText;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%d/%d",card.cardNumber, [_tableSet count]];
    cell.textLabel.adjustsFontSizeToFitWidth = YES;
    return cell;
}



@end
