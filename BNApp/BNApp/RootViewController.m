//
//  ViewController.m
//  BNApp
//
//  Created by wujianqiang on 15/1/16.
//  Copyright (c) 2015年 wujianqiang. All rights reserved.
//

#import "RootViewController.h"
#import "BNRequest.h"
#import "BNWeatherListViewController.h"
#import "BNWorkbenchViewController.h"

NSString *const kBaseUrl = @"http://m.weather.com.cn/data/%@.html";

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *url = [NSString stringWithFormat:kBaseUrl,@"101010100"];
    
    BNRequest *request = [BNRequest sharedInstance];
    [request getWithUrlString:url parameter:nil successBlock:^(NSDictionary *data){
        NSLog(@"%@",data);
    } failBlock:^(NSDictionary *data){
                        
    }];
    [self showWorkbench];
}

- (void)showWorkbench {
    BNWorkbenchViewController *blc = [[BNWorkbenchViewController alloc] init];
    [self addChildViewController:blc];
    [self.view addSubview:blc.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
