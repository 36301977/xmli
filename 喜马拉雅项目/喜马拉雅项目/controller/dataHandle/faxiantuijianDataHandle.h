//
//  faxiantuijianDataHandle.h
//  喜马拉雅项目
//
//  Created by 大米 on 15/11/19.
//  Copyright © 2015年 rice. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^CBlock) (id jsonObject);

@interface faxiantuijianDataHandle : NSObject

@property (nonatomic,strong)NSMutableArray * arrayFenlei;

+ (instancetype)createDataHandle;

- (void)loadCategory:(CBlock)callBack;

@end
