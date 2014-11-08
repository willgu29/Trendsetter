//
//  TableViewController.h
//  Trendsetter
//
//  Created by Vivek Vinodh on 11/8/14.
//  Copyright (c) 2014 William Gu. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface TableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end
    
