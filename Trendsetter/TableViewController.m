//
//  TableViewController.m
//  Trendsetter
//
//  Created by William Gu on 11/8/14.
//  Copyright (c) 2014 William Gu. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"
#import "SettingsViewController.h"
#import "PostIdeaViewController.h"

@interface TableViewController ()

@property (nonatomic, weak) NSMutableArray *tableData;
@property (nonatomic, weak) IBOutlet UISegmentedControl *segmentControl;

@end

@implementation TableViewController

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

-(IBAction)segmentChanged:(UISegmentedControl *)sender
{
    if (sender.selectedSegmentIndex == 0)
    {
        //Top
    }
    else if (sender.selectedSegmentIndex == 1)
    {
        //Controversial
    }
    else if (sender.selectedSegmentIndex == 2)
    {
        //Worst
    }
    else
    {
        NSLog(@"IMPOSSIBLE.");
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableData = [[NSMutableArray alloc] init];
    [self.tableView setContentInset:UIEdgeInsetsMake(0,0,0,0)];
    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated
{
    //Get data
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *tableViewCell = @"TableViewCell";
    
    TableViewCell *cell = (TableViewCell *)[tableView dequeueReusableCellWithIdentifier:tableViewCell];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    //cell.IdeaSummaryLabel.text = [tableSumData objectAtIndex:indexPath.row];
    cell.IdeaImageView.image = [UIImage imageNamed:@"HappyFace.png"];
    cell.NumOfHeartsLabel.text = @"+ 10";
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
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
