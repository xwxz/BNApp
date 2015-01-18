//
//  BNUIKitBundle.h
//  BNUIKit
//
//  Created by wujianqiang on 15/1/17.
//  Copyright (c) 2015年 wujianqiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNUIKitBundle : NSObject

+ (NSBundle*)resourcesBundle;
+ (UIImage*)imageNamed:(NSString*)name;
+ (UINib *)nibWithName:(NSString *)name;

@end
