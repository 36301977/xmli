//
//  ZhuanjiDetailModel.m
//  喜马拉雅项目
//
//  Created by 大米 on 15/11/23.
//  Copyright © 2015年 rice. All rights reserved.
//

#import "ZhuanjiDetailModel.h"

@implementation ZhuanjiDetailModel

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

-(NSString *)description{
    return [NSString stringWithFormat:@"%@",_title];
}
@end
