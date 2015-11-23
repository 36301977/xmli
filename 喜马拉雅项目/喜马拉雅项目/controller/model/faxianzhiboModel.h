//
//  faxianzhiboModel.h
//  喜马拉雅项目
//
//  Created by 大米 on 15/11/19.
//  Copyright © 2015年 rice. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface faxianzhiboModel : NSObject
@property (nonatomic,strong)NSString * endTime;
@property (nonatomic,strong)NSString * picPath;
@property (nonatomic,strong)NSString * programName;
@property (nonatomic,strong)NSString * programScheduleId;
@property (nonatomic,strong)NSString * radioId;
@property (nonatomic,strong)NSString * radioPlayCount;
@property (nonatomic,strong)NSMutableDictionary * radioPlayUrl;
@property (nonatomic,strong)NSString * recommendType;
@property (nonatomic,strong)NSString * rname;
@property (nonatomic,strong)NSString * startTime;
@property (nonatomic,strong)NSString * radioCoverLarge;
@property (nonatomic,strong)NSString * radioCoverSmall;
@end
