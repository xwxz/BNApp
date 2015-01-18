//
//  BNRequest.m
//  BNApp
//
//  Created by wujianqiang on 15/1/16.
//  Copyright (c) 2015年 wujianqiang. All rights reserved.
//

#import "BNRequest.h"

@implementation BNRequest

static BNRequest *request = nil;

+ (BNRequest *)sharedInstance {
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        request = [[self alloc] init];
    });
    return request;
}

- (void)getWithUrlString:(NSString *)urlString
               parameter:(NSDictionary *)parameter
            successBlock:(BNRequestSuccessBlock)successBlock
               failBlock:(BNRequestFailBlock)failBlock
{
    [self requestWithUrlString:urlString parameter:parameter method:@"GET" successBlock:successBlock failBlock:failBlock];
}

- (void)requestWithUrlString:(NSString *)urlString
                    parameter:(NSDictionary *)parameter
                   method:(NSString *)method
                successBlock:(BNRequestSuccessBlock)successBlock
                failBlock:(BNRequestFailBlock)failBlock
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer  = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    if ([[method uppercaseString] isEqual:@"GET"]) {
        [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSString *responseString =  [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
            NSData *resultData = [[NSData alloc] initWithData:[responseString dataUsingEncoding:NSUTF8StringEncoding]];
            NSDictionary *result = [NSJSONSerialization JSONObjectWithData:resultData options:NSJSONReadingMutableLeaves error:nil];
            successBlock(result);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            failBlock(@{});
        }];
    } else {
        [manager POST:urlString parameters:parameter success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
        }];
    }
}

@end
