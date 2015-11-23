//
//  faxianfenleiModel.m
//  喜马拉雅项目
//
//  Created by 大米 on 15/11/19.
//  Copyright © 2015年 rice. All rights reserved.
//

#import "faxianfenleiModel.h"

@implementation faxianfenleiModel

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        _categoryID = value;
    }
}

-(NSString *)description{
    return [NSString stringWithFormat:@"%@",_title];
}

@end
