//
//  TabBarViewController.m
//  THYROSIM
//
//  Created by William Gu on 10/11/14.
//  Copyright (c) 2014 William Gu. All rights reserved.
//

#import "TabBarViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    UITabBar *tabBar = self.tabBar;
    UITabBarItem *targetTabBarItem1 = [[tabBar items] objectAtIndex: 0];
    UITabBarItem *targetTabBarItem2 = [[tabBar items] objectAtIndex: 1];
    UITabBarItem *targetTabBarItem3 = [[tabBar items] objectAtIndex: 2];
    
    UIImage *image1 = [[UIImage imageNamed:@"Swipe.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *image2 = [[UIImage imageNamed:@"Trend.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *image3 = [[UIImage imageNamed:@"Ideas.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //
    //    [targetTabBarItem1 setImage:image1];
    //    [targetTabBarItem2 setImage:image2];
    //    [targetTabBarItem3 setImage:image3];
    
    
    [targetTabBarItem1 setSelectedImage:image1];
    [targetTabBarItem2 setSelectedImage:image2];
    [targetTabBarItem3 setSelectedImage:image3];

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
