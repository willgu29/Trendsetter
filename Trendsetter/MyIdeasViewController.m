//
//  MyIdeasViewController.m
//  Trendsetter
//
//  Created by William Gu on 11/8/14.
//  Copyright (c) 2014 William Gu. All rights reserved.
//

#import "MyIdeasViewController.h"
#import "PostIdeaViewController.h"
#import "SettingsViewController.h"


@interface MyIdeasViewController ()

@end

@implementation MyIdeasViewController

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
