//
//  faxianzhiboDataHandle.m
//  喜马拉雅项目
//
//  Created by 大米 on 15/11/19.
//  Copyright © 2015年 rice. All rights reserved.
//

#import "faxianzhiboDataHandle.h"

@implementation faxianzhiboDataHandle
static faxianzhiboDataHandle * dataHandel = nil;

+ (instancetype)createDataHandle{
    if (dataHandel == nil) {
        dataHandel = [[faxianzhiboDataHandle alloc]init];
    }
    return dataHandel;
}

- (void)loadHomePageRadiosList:(ZBlock)callBack{
    NSURL *url = [NSURL URLWithString:kFaxianZhiboUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL: url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSString *html = operation.responseString;
        NSData *data = [html dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *dataDic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSMutableDictionary * dic = dataDic[@"result"];
        NSArray *array1 = dic[@"recommandRadioList"];
        NSArray *array2 = dic[@"topRadioList"];

        self.arrayCommand = [NSMutableArray array];
        self.arrayTop = [NSMutableArray array];
        for (NSDictionary * dic in array1) {
            faxianzhiboModel * zhibo = [faxianzhiboModel new];
            [zhibo setValuesForKeysWithDictionary:dic];
            NSLog(@"%@",zhibo);
            [_arrayCommand addObject:zhibo];
        }
        for (NSDictionary * dic in array2) {
            faxianzhiboModel * zhibo = [faxianzhiboModel new];
            [zhibo setValuesForKeysWithDictionary:dic];
            NSLog(@"%@",zhibo);
            [_arrayTop addObject:zhibo];
        }
        callBack(_arrayCommand,_arrayTop);
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        NSLog(@"error:%@", error);
    }];
    [[NSOperationQueue mainQueue] addOperation:operation];
}

@end
