//
//  faxianzhiboDataHandle.h
//  喜马拉雅项目
//
//  Created by 大米 on 15/11/19.
//  Copyright © 2015年 rice. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ZBlock) (id jsonObject1,id jsonObject2);

@interface faxianzhiboDataHandle : NSObject

@property (nonatomic,strong)NSMutableArray * arrayCommand;
@property (nonatomic,strong)NSMutableArray * arrayTop;

+ (instancetype)createDataHandle;

- (void)loadHomePageRadiosList:(ZBlock)callBack;

@end
