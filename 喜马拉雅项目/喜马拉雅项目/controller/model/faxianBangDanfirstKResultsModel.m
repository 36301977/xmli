//
//  faxianBangDanfirstKResultsModel.m
//  喜马拉雅项目
//
//  Created by 大米 on 15/11/19.
//  Copyright © 2015年 rice. All rights reserved.
//

#import "faxianBangDanfirstKResultsModel.h"

@implementation faxianBangDanfirstKResultsModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        _firstKResultsID = value;
    }
}

-(NSString *)description{
    return [NSString stringWithFormat:@"%@",_title];
}
@end
