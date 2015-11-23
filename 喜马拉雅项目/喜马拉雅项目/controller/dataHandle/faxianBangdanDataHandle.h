//
//  faxianBangdanDataHandle.h
//  喜马拉雅项目
//
//  Created by 大米 on 15/11/19.
//  Copyright © 2015年 rice. All rights reserved.
//

#import <Foundation/Foundation.h>

// 1:focusImage 2:titleArray 3:allInfo
typedef void (^BBlock) (id jsonObject1,id jsonObject2,id jsonObject3);

@interface faxianBangdanDataHandle : NSObject

@property (nonatomic,strong)NSMutableArray * arrayTitle;
@property (nonatomic,strong)NSMutableDictionary * arrayInfo;

+ (instancetype)createDataHandle;

- (void)loadBangdan:(BBlock)callBack;
@end
