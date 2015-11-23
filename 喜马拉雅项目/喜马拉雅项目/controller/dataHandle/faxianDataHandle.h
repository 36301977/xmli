//
//  faxianDataHandle.h
//  喜马拉雅项目
//
//  Created by 大米 on 15/11/17.
//  Copyright © 2015年 rice. All rights reserved.
//

#import <Foundation/Foundation.h>
// 1:首页轮播图
typedef void  (^CBlock) (id jsonObject);
// 1：小编推荐。2：听新闻-听游戏的dic。3：听新闻-听游戏的名字
typedef void  (^TJBlock) (id jsonObject1,id jsonObject2,id jsonObject3);

@interface faxianDataHandle : NSObject

@property (nonatomic,retain) NSMutableArray * arrayFocusImages;

@property (nonatomic,retain) NSMutableArray * arrayRecommentAlbums;

@property (nonatomic,retain) NSMutableArray * arrayHotRecommends;

@property (nonatomic,retain) NSMutableDictionary * dicHotRecommends;

+ (instancetype)createDataHandle;

- (void)analysisData:(CBlock)callBack;

- (void)tuijianData:(TJBlock)callTJBack;

@end
