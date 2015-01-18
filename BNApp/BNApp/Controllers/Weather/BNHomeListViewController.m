//
//  BNHomeListViewController.m
//  BNApp
//
//  Created by wujianqiang on 15/1/17.
//  Copyright (c) 2015年 wujianqiang. All rights reserved.
//

#import "BNHomeListViewController.h"

@interface BNHomeListViewController ()

@end

@implementation BNHomeListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self registerTableViewCell];
    self.title = @"我的";
}

- (void)registerTableViewCell {
    [self.tableView registerNibWithClass:[BNWeatherListCell class]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BNWeatherListCell *cell = nil;
    cell = [self.tableView dequeueReusableCellWithIdentifier:@"BNWeatherListCell" forIndexPath:indexPath];
    return cell;
}

@end
