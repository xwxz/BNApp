//
//  UITableView+Register.m
//  BNUIKit
//
//  Created by wujianqiang on 15/1/17.
//  Copyright (c) 2015年 wujianqiang. All rights reserved.
//

#import "UITableView+Register.h"

@implementation UITableView (Register)

- (void)registerNibWithClass:(Class)classid
{
    NSString *identifier = NSStringFromClass(classid);
    UINib *nib = [BNUIKitBundle nibWithName:identifier];
    [self registerNib:nib forCellReuseIdentifier:identifier];
}

- (void)registerNibForHeaderFooterWithClass:(Class)classid
{
    NSString *identifier = NSStringFromClass(classid);
    UINib *normalHeaderViewNib = [BNUIKitBundle nibWithName:identifier];
    [self registerNib:normalHeaderViewNib  forHeaderFooterViewReuseIdentifier:identifier];
}

- (void)registerNibWithString:(NSString *)classString
{
    UINib *nib = [BNUIKitBundle nibWithName:classString];
    [self registerNib:nib forCellReuseIdentifier:classString];
}

@end
