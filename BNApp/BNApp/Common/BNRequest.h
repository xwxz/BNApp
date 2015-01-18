//
//  BNRequest.h
//  BNApp
//
//  Created by wujianqiang on 15/1/16.
//  Copyright (c) 2015年 wujianqiang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^BNRequestSuccessBlock)(NSDictionary *responseData);
typedef void(^BNRequestFailBlock)(NSDictionary *responseData);

@interface BNRequest : NSObject
+ (id)sharedInstance;
- (void)getWithUrlString:(NSString *)urlString
               parameter:(NSDictionary *)parameter
            successBlock:(BNRequestSuccessBlock)successBlock
               failBlock:(BNRequestFailBlock)failBlock;
@end
