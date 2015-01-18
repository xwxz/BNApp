//
//  BNAppUIView.m
//  BNApp
//
//  Created by wujianqiang on 15/1/16.
//  Copyright (c) 2015年 wujianqiang. All rights reserved.
//

#import "BNUIView.h"

@implementation BNUIView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

+ (id)defaultView
{
    NSString *nibName = NSStringFromClass([self class]);
    NSArray *cells = [[NSBundle mainBundle] loadNibNamed:nibName owner:self options:nil];
    id cell = cells[0];
    return cell;
}


@end
