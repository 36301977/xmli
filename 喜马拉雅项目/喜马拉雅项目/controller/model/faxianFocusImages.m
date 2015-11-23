//
//  faxianFocusImages.m
//  喜马拉雅项目
//
//  Created by 大米 on 15/11/17.
//  Copyright © 2015年 rice. All rights reserved.
//

#import "faxianFocusImages.h"

@implementation faxianFocusImages
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        _faxianID = value;
    }
}

-(NSString *)description{
    return [NSString stringWithFormat:@"%@",_longTitle];
}
@end
