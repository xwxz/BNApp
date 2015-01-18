//
//  BNWeatherListViewController.m
//  BNApp
//
//  Created by wujianqiang on 15/1/16.
//  Copyright (c) 2015年 wujianqiang. All rights reserved.
//

#import "BNWeatherListViewController.h"

@interface BNWeatherListViewController ()

@end

@implementation BNWeatherListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"天气列表";
    [self registerTableViewCell];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)registerTableViewCell {
    [self.tableView registerNibWithClass:[BNWeatherListCell class]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BNWeatherListCell *cell = nil;
    cell = [self.tableView dequeueReusableCellWithIdentifier:@"BNWeatherListCell" forIndexPath:indexPath];
    return cell;
}

@end
