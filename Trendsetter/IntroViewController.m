//
//  IntroViewController.m
//  Trendsetter
//
//  Created by William Gu on 11/8/14.
//  Copyright (c) 2014 William Gu. All rights reserved.
//

#import "IntroViewController.h"
#import "TabBarViewController.h"
#import "LoginViewController.h"
#import "TableViewController.h"
#import "MyIdeasViewController.h"

//#import "ImageScrollView.h"

@interface IntroViewController ()

@property (nonatomic, weak) IBOutlet UIPageControl *pageControl;
@property (nonatomic, weak) IBOutlet UIView *currentPage;
@property (nonatomic, weak) IBOutlet UILabel *text;
@property (nonatomic, weak) IBOutlet UIButton *loginButton;
@property (nonatomic, weak) IBOutlet UITextField *textField;

@end

@implementation IntroViewController

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self moveVC];
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    //TODO: Save to database
    [self revertVC];
}

-(IBAction)login:(UIButton *)sender
{
    
    if ([_textField.text isEqualToString:@""])
    {
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                            message:@"Please enter a username"
                                                           delegate:nil
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:nil];
        [alertView show];
        return;
    }
    
    PFQuery *query = [PFQuery queryWithClassName:@"User"];
    [query whereKey:@"name" equalTo:_textField.text];
    PFUser *user = (PFUser *)[query getFirstObject];
    
    
    if ([user[@"name"] isEqualToString:_textField.text])
    {
        UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                            message:@"That username is already taken. Please choose another username"
                                                           delegate:nil
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:nil];
        [alertView show];
        return;
    }
    
    LoginViewController *loginVC = [[LoginViewController alloc] init];
    TableViewController *tableVC = [[TableViewController alloc] init];
    MyIdeasViewController *myVC = [[MyIdeasViewController alloc] init];
    
    loginVC.title = @"Swipe";
    tableVC.title = @"Trending";
    myVC.title = @"Ideas";
    
    UIImage *image1 = [[UIImage imageNamed:@"Swipe.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *image2 = [[UIImage imageNamed:@"Trend.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *image3 = [[UIImage imageNamed:@"Ideas.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    

    UIImage *image4 = [[UIImage imageNamed:@"Swipe.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *image5 = [[UIImage imageNamed:@"Trend.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *image6 = [[UIImage imageNamed:@"Ideas.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    loginVC.tabBarItem.image = image1;
    tableVC.tabBarItem.image = image2;
    myVC.tabBarItem.image = image3;
    
    loginVC.tabBarItem.selectedImage = image4;
    tableVC.tabBarItem.selectedImage = image5;
    myVC.tabBarItem.selectedImage = image6;
    
    
    TabBarViewController *tabBarVC = [[TabBarViewController alloc] init];
    tabBarVC.viewControllers = [NSArray arrayWithObjects:loginVC, tableVC, myVC, nil];
    
    
    tabBarVC.username = _textField.text;
    [[NSUserDefaults standardUserDefaults] setObject:_textField.text forKey:@"username"];
    
    
    PFObject *username = [PFObject objectWithClassName:@"User"];
    username[@"name"] = _textField.text;
    [username saveInBackground];
    
    
    [self presentViewController:tabBarVC animated:YES completion:nil];
}

-(IBAction)tap:(id)sender
{
    if (_pageControl.currentPage == 3)
    {
        //do nothing... no pages left
    }
    else
    {
        [self animateToPage:(_pageControl.currentPage + 1)];
        _pageControl.currentPage++;
    }
}

-(IBAction)swipeRight:(id)sender
{
    if (_pageControl.currentPage == 0)
    {
        //do nothing... no pages left
    }
    else
    {
        [self animateToPage:(_pageControl.currentPage - 1)];
        _pageControl.currentPage--;
    }
    
}

-(IBAction)swipeLeft:(id)sender
{
    if (_pageControl.currentPage == 3)
    {
        //do nothing... no pages left
    }
    else
    {
        [self animateToPage:(_pageControl.currentPage + 1)];
        _pageControl.currentPage++;
    }
}

-(void)animateToPage:(NSUInteger)pageNumber
{
    //TODO: Animations to view and what not
    
    self.text.alpha = 0;
    [UIView animateWithDuration:1.0 delay:0 options:UIViewAnimationOptionCurveEaseIn
                     animations:^{ self.text.alpha = 1;}
                     completion:nil];
    
    UIImageView *view = [[UIImageView alloc] initWithFrame:_currentPage.bounds];
    UIImage *image = [[UIImage alloc] init];
    if (pageNumber == 0)
    {
        image = [UIImage imageNamed:@"Heart40x40.png"];
        self.text.text = @"Re-discover Instagram";
    }
    else if (pageNumber == 1)
    {
        image = [UIImage imageNamed:@"contacts.png"];
        self.text.text = @"Hold then drag";
    }
    else if (pageNumber == 2)
    {
        image = [UIImage imageNamed:@"world clock.png"];
        self.text.text = @"Hold to pause";
    }
    else if (pageNumber == 3)
    {
        image = [UIImage imageNamed:@"Heart40x40.png"];
        self.text.text = @"And find new photos";
    }
    else
    {
        //well shit
    }
    
    
    
    [view setImage:image];
    [_currentPage addSubview:view];
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //Our page controller
    _pageControl.currentPage = 0;
    [self animateToPage:0];
    _pageControl.numberOfPages = 4;

    
//    
//    ImageScrollView *imageScroll = [[ImageScrollView alloc] initWithFrame:CGRectMake(40, 20, 162, 338)];
//    
//    UIImage *image1 = [UIImage imageNamed:@"Clipped.png"];
//    UIImage *image2 = [UIImage imageNamed:@"contacts.png"];
//    UIImage *image3 = [UIImage imageNamed:@"Heart40x40.png"];
//    UIImage *image4 = [UIImage imageNamed:@"Info40x40.png"];
//    
//    [imageScroll setScrollViewContents:@[image1, image2, image3, image4]];
//    imageScroll.imageControlPos = ImageControlPositionCenterBottom;
//    
//    [self.view addSubview:imageScroll];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)resignKeyboard
{
    NSLog(@"Resign keyboard");
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self resignKeyboard];
}



-(void)moveVC
{
    [self.view setFrame:CGRectMake(0, -240, self.view.frame.size.width, self.view.frame.size.height)];
}

-(void)revertVC
{
    [self.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
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
