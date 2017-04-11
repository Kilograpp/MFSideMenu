//
//  MFCenterViewController.m
//  MFSideMenuDemoBasic
//
//  Created by Igor Vedeneev on 11.04.17.
//  Copyright © 2017 University of Wisconsin - Madison. All rights reserved.
//

#import "MFCenterViewController.h"

@interface MFCenterViewController () <UITableViewDelegate, UITableViewDataSource> {
    UITableView *_tableView;
}

@end

@implementation MFCenterViewController

- (void)loadView {
    [super loadView];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 45)];
    _tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 45)];
    [self.view addSubview:_tableView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
//    self.title = @"Some title";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 55;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = @"Some text";
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    MFCenterViewController *vc = [MFCenterViewController new];
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

- (nullable NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewRowAction *action = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"Delete" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        NSLog(@"dd");
    }];
    
    return @[action];
}

@end
