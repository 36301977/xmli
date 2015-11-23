//
//  ZhuanjiDataHandle.m
//  喜马拉雅项目
//
//  Created by 大米 on 15/11/23.
//  Copyright © 2015年 rice. All rights reserved.
//

#import "ZhuanjiDataHandle.h"
#import "ZhuanjiDetailModel.h"

@implementation ZhuanjiDataHandle
static ZhuanjiDataHandle * dataHandle = nil;

+(instancetype)createDataHandle{
    if (dataHandle == nil) {
        dataHandle = [[ZhuanjiDataHandle alloc]init];
    }
    return dataHandle;
}

-(ZhuanjiInfoModel *)infoModel{
    if (_infoModel == nil) {
        _infoModel = [ZhuanjiInfoModel new];
    }
    return _infoModel;
}

-(NSMutableArray *)mutableArray{
    if (_mutableArray == nil) {
        _mutableArray = [NSMutableArray arrayWithCapacity:10];
    }
    return _mutableArray;
}

- (void)zhuanjiData:(JBlock)callJBack{
    
    NSNumber *i = _paramDic[@"albumId"];
    NSInteger albumId = i.integerValue;
    
    NSNumber *j = _paramDic[@"position"];
    NSInteger position = j.integerValue;
    
    NSNumber *pageID = _paramDic[@"pageId"];
    NSInteger pageId = pageID.integerValue;
    
    NSString * title = _paramDic[@"title"];
    
    NSString *urlStr = [NSString stringWithFormat:kZhuanjiInfoUrl,albumId,pageId,position,title];
    
    urlStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL: url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSString *html = operation.responseString;
        NSData *data = [html dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *dataDic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSDictionary *dic = dataDic[@"album"];
        [_infoModel setValuesForKeysWithDictionary:dic];
        
        NSDictionary *dicTracks = dic[@"tracks"];
        NSArray * arrayTracks = dicTracks[@"list"];
        for (NSDictionary * dicTrack in arrayTracks) {
            ZhuanjiDetailModel * detailModel = [ZhuanjiDetailModel new];
            [detailModel setValuesForKeysWithDictionary:dicTrack];
            NSLog(@"%@",detailModel);
            detailModel.maxPageId = dicTracks[@"maxPageId"];
            detailModel.pageId = dicTracks[@"pageId"];
            detailModel.pageSize = dicTracks[@"pageSize"];
            detailModel.totalCount = dicTracks[@"totalCount"];
            [_mutableArray addObject:detailModel];
        }
        callJBack(_infoModel,_mutableArray);
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        NSLog(@"error:%@", error);
    }];
    [[NSOperationQueue mainQueue] addOperation:operation];
}

@end
