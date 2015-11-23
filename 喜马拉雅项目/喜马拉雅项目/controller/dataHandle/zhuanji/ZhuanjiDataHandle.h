//
//  ZhuanjiDataHandle.h
//  喜马拉雅项目
//
//  Created by 大米 on 15/11/23.
//  Copyright © 2015年 rice. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZhuanjiInfoModel.h"
#import "ZhuanjiDetailModel.h"

typedef void (^JBlock) (id jsonObject,id jsonObject1);

@interface ZhuanjiDataHandle : NSObject
@property (nonatomic,strong)NSMutableDictionary * paramDic;

@property (nonatomic,strong)ZhuanjiInfoModel * infoModel;
@property (nonatomic,strong)NSMutableArray * mutableArray;

+(instancetype)createDataHandle;

- (void)zhuanjiData:(JBlock)callJBack;

@end
