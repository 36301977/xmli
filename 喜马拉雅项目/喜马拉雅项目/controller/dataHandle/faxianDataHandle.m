//
//  faxianDataHandle.m
//  喜马拉雅项目
//
//  Created by 大米 on 15/11/17.
//  Copyright © 2015年 rice. All rights reserved.
//

#import "faxianDataHandle.h"

@implementation faxianDataHandle

static faxianDataHandle * dataHandle = nil;

+(instancetype)createDataHandle{
    if (dataHandle == nil) {
        dataHandle = [[faxianDataHandle alloc]init];
    }
    return dataHandle;
}

- (void)analysisData:(CBlock)callBack{
    NSURL *url = [NSURL URLWithString:kFaxianTuijianUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL: url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSString *html = operation.responseString;
        NSData *data = [html dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *dataDic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSDictionary *dic = dataDic[@"focusImages"];
        NSArray *array = dic[@"list"];
        self.arrayFocusImages = [NSMutableArray array];
        for (NSDictionary * dic in array) {
            faxianFocusImages * focusImages = [faxianFocusImages new];
            [focusImages setValuesForKeysWithDictionary:dic];
            NSLog(@"%@",focusImages);
            [_arrayFocusImages addObject:focusImages];
        }
        callBack(_arrayFocusImages);
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        NSLog(@"error:%@", error);
    }];
    [[NSOperationQueue mainQueue] addOperation:operation];
}

- (void)tuijianData:(TJBlock)callTJBack{
    
    NSURL *url = [NSURL URLWithString:kFaxianTuijianUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL: url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSString *html = operation.responseString;
        NSData *data = [html dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *dataDic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];

        NSDictionary *dicEditorRecommendAlbums = dataDic[@"editorRecommendAlbums"];
        NSArray *arrayEditorRecommendAlbums = dicEditorRecommendAlbums[@"list"];
        self.arrayRecommentAlbums = [NSMutableArray array];
        for (NSDictionary * dic in arrayEditorRecommendAlbums) {
            faXianTuiJianlieBiaoModel * liebiaoModel = [faXianTuiJianlieBiaoModel new];
            [liebiaoModel setValuesForKeysWithDictionary:dic];
            NSLog(@"%@",liebiaoModel);
            [_arrayRecommentAlbums addObject:liebiaoModel];
        }
        
        NSDictionary *dicHotRecommends = dataDic[@"hotRecommends"];
        NSArray *arrayHotRecommends = dicHotRecommends[@"list"];
        self.arrayHotRecommends = [NSMutableArray array];
        self.dicHotRecommends = [NSMutableDictionary dictionary];
        for (NSDictionary * dic in arrayHotRecommends) {
            NSString * titleString = dic[@"title"];
            NSArray * arrayList = dic[@"list"];
            NSMutableArray * mutableArray = [NSMutableArray array];
            for (NSDictionary * dicList in arrayList) {
                faXianTuiJianlieBiaoModel * liebiaoModel = [faXianTuiJianlieBiaoModel new];
                [liebiaoModel setValuesForKeysWithDictionary:dicList];
                NSLog(@"%@",liebiaoModel);
                [mutableArray addObject:liebiaoModel];
            }
            [_arrayHotRecommends addObject:titleString];
            [_dicHotRecommends setObject:mutableArray forKey:titleString];
        }
        
        callTJBack(_arrayRecommentAlbums,_dicHotRecommends,_arrayHotRecommends);
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        NSLog(@"error:%@", error);
    }];
    [[NSOperationQueue mainQueue] addOperation:operation];

}
@end
