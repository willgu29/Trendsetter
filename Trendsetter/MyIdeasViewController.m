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
#import <Parse/Parse.h>
#import "CardView.h"
#import "TabBarViewController.h"
#import "MyIdeasTableViewCell.h"

@interface MyIdeasViewController ()

@property (nonatomic, strong) NSMutableArray *tableData;

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
    _tableData = [[NSMutableArray alloc] init];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Ideas"];
    [query whereKey:@"name" equalTo:[(TabBarViewController *)self.presentingViewController username]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *tableViewCell = @"IdeaCell";
    //    static NSString *tableViewCell = @"NoReuse";
    MyIdeasTableViewCell *cell = (MyIdeasTableViewCell *)[tableView dequeueReusableCellWithIdentifier:tableViewCell];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"MyIdeasTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    id myObject = [_tableData objectAtIndex:indexPath.row];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 180;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_tableData count];
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
