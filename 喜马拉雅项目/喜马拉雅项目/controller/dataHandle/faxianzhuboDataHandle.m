//
//  faxianzhuboDataHandle.m
//  喜马拉雅项目
//
//  Created by 大米 on 15/11/20.
//  Copyright © 2015年 rice. All rights reserved.
//

#import "faxianzhuboDataHandle.h"

@implementation faxianzhuboDataHandle

static faxianzhuboDataHandle * dataHandel = nil;

+ (instancetype)createDataHandle{
    if (dataHandel == nil) {
        dataHandel = [[faxianzhuboDataHandle alloc]init];
    }
    return dataHandel;
}

- (void)loadZhubo:(ZBBlock)callBack{
    NSURL *url = [NSURL URLWithString:kFaxianZhuboUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL: url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSString *html = operation.responseString;
        NSData *data = [html dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *dataDic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        self.arrayTitle = [NSMutableArray array];
        self.arrayInfo = [NSMutableDictionary dictionary];
        
        NSMutableArray * array = dataDic[@"list"];
        for (NSDictionary * dic in array) {
            [_arrayTitle addObject:dic[@"title"]];
            NSArray * arrayList = dic[@"list"];
            NSMutableArray * resultArray = [NSMutableArray array];
            for (NSDictionary * dict in arrayList) {
                faxianZhuboModel * model = [faxianZhuboModel new];
                [model setValuesForKeysWithDictionary:dict];
                model.name = dic[@"title"];
                NSLog(@"%@",model);
                [resultArray addObject:model];
            }
            [_arrayInfo setObject:resultArray forKey:dic[@"title"]];
        }
        
        NSMutableDictionary * arrayZB = dataDic[@"recommendBozhu"];
        [_arrayTitle addObject:@"新晋主播"];
        NSArray * zhuboModel = arrayZB[@"list"];
        NSMutableArray * resultArray = [NSMutableArray array];
        for (NSDictionary * dict in zhuboModel) {
            faxianZhuboModel * model = [faxianZhuboModel new];
            [model setValuesForKeysWithDictionary:dict];
            NSLog(@"%@",model);
            [resultArray addObject:model];
        }
        [_arrayInfo setObject:resultArray forKey:@"新晋主播"];
        
        callBack(_arrayTitle,_arrayInfo);
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        NSLog(@"error:%@", error);
    }];
    [[NSOperationQueue mainQueue] addOperation:operation];
}

@end
