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

#import "ImageScrollView.h"

@interface IntroViewController ()

@property (nonatomic, weak) IBOutlet UIPageControl *pageControl;
@property (nonatomic, weak) IBOutlet UIView *currentPage;
@property (nonatomic, weak) IBOutlet UILabel *text;
@property (nonatomic, weak) IBOutlet UIButton *loginButton;


@end

@implementation IntroViewController

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    //TODO: Save to database
}

-(IBAction)login:(UIButton *)sender
{
    
    LoginViewController *loginVC = [[LoginViewController alloc] init];
    TableViewController *tableVC = [[TableViewController alloc] init];
    MyIdeasViewController *myVC = [[MyIdeasViewController alloc] init];
    
    loginVC.title = @"Swipe";
    tableVC.title = @"Trending";
    myVC.title = @"Ideas";
    
    TabBarViewController *tabBarVC = [[TabBarViewController alloc] init];
    tabBarVC.viewControllers = [NSArray arrayWithObjects:loginVC, tableVC, myVC, nil];
    
    
    
    
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

    
    
    ImageScrollView *imageScroll = [[ImageScrollView alloc] initWithFrame:CGRectMake(40, 20, 162, 338)];
    
    UIImage *image1 = [UIImage imageNamed:@"Clipped.png"];
    UIImage *image2 = [UIImage imageNamed:@"contacts.png"];
    UIImage *image3 = [UIImage imageNamed:@"Heart40x40.png"];
    UIImage *image4 = [UIImage imageNamed:@"Info40x40.png"];
    
    [imageScroll setScrollViewContents:@[image1, image2, image3, image4]];
    imageScroll.imageControlPos = ImageControlPositionCenterBottom;
    
    [self.view addSubview:imageScroll];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
