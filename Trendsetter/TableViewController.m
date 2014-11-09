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
#import <Parse/Parse.h>

@interface TableViewController ()

@property (nonatomic, strong) NSMutableArray *tableData;
@property (nonatomic, weak) IBOutlet UISegmentedControl *segmentControl;
@property (nonatomic, strong) NSArray *temporaryArray;
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
    PFQuery *query = [PFQuery queryWithClassName:@"Ideas"];
    query.limit = 25;
    if (sender.selectedSegmentIndex == 0)
    {
        //Top
        [query orderByDescending:@"likes"];
        _temporaryArray = [query findObjects];
        _tableData = _temporaryArray.copy;
    }
    else if (sender.selectedSegmentIndex == 1)
    {
        //Controversial

        [query orderByAscending:@"difference"];
        _temporaryArray = [query findObjects];
        _tableData = _temporaryArray.copy;
    }
    else if (sender.selectedSegmentIndex == 2)
    {
        //Worst
        [query orderByDescending:@"dislikes"];
        _temporaryArray = [query findObjects];
        _tableData = _temporaryArray.copy;
    }
    else
    {
        NSLog(@"IMPOSSIBLE.");
    }
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableData = [[NSMutableArray alloc] init];
    [self.tableView setContentInset:UIEdgeInsetsMake(0,0,0,0)];
    // Do any additional setup after loading the view from its nib.
    
    _temporaryArray = [[NSMutableArray alloc] init];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    //Get data
    //TODO: Load top posts
    PFQuery *query = [PFQuery queryWithClassName:@"Ideas"];
    query.limit = 25;
    [query orderByDescending:@"likes"];
    _temporaryArray = [query findObjects];
    _tableData = _temporaryArray.copy;
    [self.tableView reloadData];
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
//    static NSString *tableViewCell = @"NoReuse";
    TableViewCell *cell = (TableViewCell *)[tableView dequeueReusableCellWithIdentifier:tableViewCell];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    id myObject = [_tableData objectAtIndex:indexPath.row];
    cell.IdeaSummaryLabel.text = myObject[@"ideaText"];
    if (_segmentControl.selectedSegmentIndex == 0)
    {
        cell.IdeaImageView.image = [UIImage imageNamed:@"HappyFace.png"];
        cell.NumOfHeartsLabel.text = [NSString stringWithFormat:@"+%@",myObject[@"likes"]];
    }
    else if (_segmentControl.selectedSegmentIndex == 1)
    {
//        NSString *likes = myObject[@"likes"];
//        NSString *dislikes = myObject[@"dislikes"];
//        int difference = likes.intValue - dislikes.intValue;
//        cell.NumOfHeartsLabel.text = [NSString stringWithFormat:@"%d",difference];
        cell.IdeaImageView.image = [UIImage imageNamed:@"NeutralFace.png"];
        cell.NumOfHeartsLabel.text = myObject[@"difference"];
    }
    else if (_segmentControl.selectedSegmentIndex == 2)
    {
        cell.IdeaImageView.image = [UIImage imageNamed:@"NegativeFace.png"];
        cell.NumOfHeartsLabel.text = [NSString stringWithFormat:@"-%@",myObject[@"dislikes"]];
    }
    
    cell.timeAndAuthor.text = [NSString stringWithFormat:@"Posted by %@", myObject[@"name"]];
    
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
