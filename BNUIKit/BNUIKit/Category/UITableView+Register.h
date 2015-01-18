//
//  UITableView+Register.h
//  BNUIKit
//
//  Created by wujianqiang on 15/1/17.
//  Copyright (c) 2015年 wujianqiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (Register)

- (void)registerNibWithClass:(Class)classid;
- (void)registerNibForHeaderFooterWithClass:(Class)classid;
- (void)registerNibWithString:(NSString *)classString;

@end
