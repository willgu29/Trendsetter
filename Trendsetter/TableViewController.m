//
//  TableViewController.m
//  Trendsetter
//
//  Created by William Gu on 11/8/14.
//  Copyright (c) 2014 William Gu. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"
@interface TableViewController ()
{
    NSArray *tableData;
    NSArray *tableSumData;
}

@end

@implementation TableViewController

-(IBAction)backButton:(UIButton *)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.tableView setContentInset:UIEdgeInsetsMake(60,0,0,0)];

    
    tableData = [NSArray arrayWithObjects:@"Idea 1: by KANYEWEST" , @"Idea 2: by JAYZ", @"Idea 3 by OBAMA", @"Idea 4: CREATED BY LIFE", nil];
    tableSumData = [NSArray arrayWithObjects:@"Idea1SUMMARY", @"IDEA2Summary", @"IDEA3SUMMARY", @"IDEA4SUMMARY", nil];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableData count];
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
    
    cell.IdeaNameLabel.text = [tableData objectAtIndex:indexPath.row];
    cell.IdeaSummaryLabel.text = [tableSumData objectAtIndex:indexPath.row];
    cell.IdeaImageView.image = [UIImage imageNamed:@"lightbulb.jpg"];
    //cell.NumOfXsLabel.text = [prepTime objectAtIndex:indexPath.row];
    //cell.NumOfHeartsLabel.text
    
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
