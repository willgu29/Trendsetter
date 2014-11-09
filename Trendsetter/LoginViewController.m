//
//  LoginViewController.m
//  Trendsetter
//
//  Created by William Gu on 11/8/14.
//  Copyright (c) 2014 William Gu. All rights reserved.
//

#import "LoginViewController.h"
#import "CardView.h"
#import "PostIdeaViewController.h"
#import "SettingsViewController.h"
#import "DisplayIdeaViewController.h"
@interface LoginViewController ()
{
    int cardsInStack;
    int cardsGoneThrough;
}

@property (nonatomic, weak) IBOutlet UIView *outOfCards;
@property (nonatomic, weak) IBOutlet UIButton *postButton;
@property (nonatomic, weak) IBOutlet UILabel *authorOf;
@property (nonatomic, weak) IBOutlet UILabel *hashTags;


@end

@implementation LoginViewController





-(IBAction)postButton:(UIButton *)sender
{
    PostIdeaViewController *postVC = [[PostIdeaViewController alloc] init];
    [self presentViewController:postVC animated:YES completion:nil];
}

-(IBAction)settingsButton:(UIButton *)sender
{
    SettingsViewController *settingsVC = [[SettingsViewController alloc] init];
    [self presentViewController:settingsVC animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _cardSet = [[CardSet alloc] init];
    _tableSet = [[CardSet alloc] init];
    
    [_cardSet shuffleDeck];
    cardsInStack = 0;
    cardsGoneThrough = 0;
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [self displayNewDeckTop];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
        [self addCardToView:card.cardText andAuthor:card.authorOf];
    }
}

-(void)addCardToView:(NSString *)text andAuthor:(NSString *)author
{
    
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
//            NSLog(@"Let go now to delete the photo!");
        }
        if (state.thresholdRatio == 1.f && state.direction == MDCSwipeDirectionRight) {
//            NSLog(@"Let go now to delete the photo!");
        }
    };
    [cardView setFrame:CGRectMake(18, 90, cardView.frame.size.width, cardView.frame.size.height)];
    [cardView mdc_swipeToChooseSetup:options];
    
    //    [self.view addSubview:cardView];
    
    //TODO: animate
   
    //ANIMATE
    
    [self.view insertSubview:cardView aboveSubview:_outOfCards];
}


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


#pragma mark - Swipe Delegates

-(void)viewDidCancelSwipe:(UIView *)view
{
    NSLog(@"SUP");
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
                NSLog(@"Left!");
    } else if (direction == MDCSwipeDirectionRight) {
                NSLog(@"Right!");
    }
    else if (direction == MDCSwipeDirectionNone)
    {
        NSLog(@"Direction none!");
    }
    else
    {
        NSLog(@"What.");
    }
    cardsInStack--;
    cardsGoneThrough++;
    
    if (cardsInStack < 3)
    {
        NSLog(@"Add cards!");
        NSArray *arrayOfCards = [_cardSet getNextFiveCards];
        [self forArrayAddToView:arrayOfCards];
        
    }
    
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject];
    
    if ([[self.view.window hitTest:[touch locationInView:self.view.window] withEvent:event] isKindOfClass:[CardView class]])
    {
        
    }

}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject];
    
    if ([[self.view.window hitTest:[touch locationInView:self.view.window] withEvent:event] isKindOfClass:[CardView class]])
    {
        NSLog(@"touch ended in CardView!");
        DisplayIdeaViewController *ideaVC = [[DisplayIdeaViewController alloc] init];
        [self presentViewController:ideaVC animated:YES completion:nil];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
