//
//  faxianzhuboDataHandle.h
//  喜马拉雅项目
//
//  Created by 大米 on 15/11/20.
//  Copyright © 2015年 rice. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "faxianZhuboModel.h"

// 1: titlearray 2:key value Info
typedef void (^ZBBlock) (id jsonObject1,id jsonObject2);

@interface faxianzhuboDataHandle : NSObject

@property (nonatomic,strong)NSMutableArray * arrayTitle;
@property (nonatomic,strong)NSMutableDictionary * arrayInfo;

+ (instancetype)createDataHandle;

- (void)loadZhubo:(ZBBlock)callBack;
@end
