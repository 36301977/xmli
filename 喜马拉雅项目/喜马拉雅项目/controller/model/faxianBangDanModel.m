//
//  faxianBangDanModel.m
//  喜马拉雅项目
//
//  Created by 大米 on 15/11/19.
//  Copyright © 2015年 rice. All rights reserved.
//

#import "faxianBangDanModel.h"

@implementation faxianBangDanModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"firstKResults"]) {
        for (NSDictionary * dic in value) {
            faxianBangDanfirstKResultsModel * model = [faxianBangDanfirstKResultsModel new];
            [model setValuesForKeysWithDictionary:dic];
            [_firstKResults addObject:model];
        }
    }
}

-(NSString *)description{
    return [NSString stringWithFormat:@"%@",_title];
}
@end
