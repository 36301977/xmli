//
//  faxianBangdanDataHandle.m
//  喜马拉雅项目
//
//  Created by 大米 on 15/11/19.
//  Copyright © 2015年 rice. All rights reserved.
//

#import "faxianBangdanDataHandle.h"

@implementation faxianBangdanDataHandle

static faxianBangdanDataHandle * dataHandel = nil;

+ (instancetype)createDataHandle{
    if (dataHandel == nil) {
        dataHandel = [[faxianBangdanDataHandle alloc]init];
    }
    return dataHandel;
}

- (void)loadBangdan:(BBlock)callBack{
    NSURL *url = [NSURL URLWithString:kFaxianBangdanUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL: url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSString *html = operation.responseString;
        NSData *data = [html dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *dataDic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSMutableArray * array = dataDic[@"datas"];
        
        self.arrayTitle = [NSMutableArray array];
        self.arrayInfo = [NSMutableDictionary dictionary];
        for (NSDictionary * dic in array) {
            
            [_arrayTitle addObject:dic[@"title"]];
            NSArray * arrayList = dic[@"list"];
            NSMutableArray * resultArray = [NSMutableArray array];
            for (NSDictionary * dict in arrayList) {
            faxianBangDanModel * results = [faxianBangDanModel new];
            [results setValuesForKeysWithDictionary:dict];
            NSLog(@"%@",results);
            [resultArray addObject:results];
            }
            [_arrayInfo setObject:resultArray forKey:dic[@"title"]];
        }
        
        NSMutableDictionary * didfocus = dataDic[@"focusImages"];
        NSArray * arrayList = didfocus[@"list"];
        NSMutableDictionary * focusImageDic = arrayList[0];
        faxianBangDanFocusImagesModel * focusModel = [faxianBangDanFocusImagesModel new];
        [focusModel setValuesForKeysWithDictionary:focusImageDic];
        
        callBack(focusModel,_arrayTitle,_arrayInfo);
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        NSLog(@"error:%@", error);
    }];
    [[NSOperationQueue mainQueue] addOperation:operation];
}

@end
