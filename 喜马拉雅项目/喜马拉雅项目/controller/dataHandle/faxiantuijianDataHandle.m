//
//  faxiantuijianDataHandle.m
//  喜马拉雅项目
//
//  Created by 大米 on 15/11/19.
//  Copyright © 2015年 rice. All rights reserved.
//

#import "faxiantuijianDataHandle.h"

@implementation faxiantuijianDataHandle

static faxiantuijianDataHandle * dataHandel = nil;

+ (instancetype)createDataHandle{
    if (dataHandel == nil) {
        dataHandel = [[faxiantuijianDataHandle alloc]init];
    }
    return dataHandel;
}

- (void)loadCategory:(CBlock)callBack;{
    NSURL *url = [NSURL URLWithString:kFaxianFenleiUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL: url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSString *html = operation.responseString;
        NSData *data = [html dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *dataDic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSArray *array = dataDic[@"list"];
        
        self.arrayFenlei = [NSMutableArray array];
        for (NSDictionary * dic in array) {
            faxianfenleiModel * fenlei = [faxianfenleiModel new];
            [fenlei setValuesForKeysWithDictionary:dic];
            NSLog(@"%@",fenlei);
            [_arrayFenlei addObject:fenlei];
        }
        callBack(_arrayFenlei);
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        NSLog(@"error:%@", error);
    }];
    [[NSOperationQueue mainQueue] addOperation:operation];
}


@end
