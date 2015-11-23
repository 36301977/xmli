//
//  ZhuanjiInfoModel.h
//  喜马拉雅项目
//
//  Created by 大米 on 15/11/23.
//  Copyright © 2015年 rice. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZhuanjiInfoModel : NSObject
@property (nonatomic,assign) NSInteger albumId;
@property (nonatomic,assign) NSInteger  categoryId;
@property (nonatomic,strong) NSString * categoryName;
@property (nonatomic,strong) NSString * title;
@property (nonatomic,strong) NSString * coverOrigin;
@property (nonatomic,strong) NSString * coverSmall;
@property (nonatomic,strong) NSString * coverMiddle;
@property (nonatomic,strong) NSString * coverLarge;
@property (nonatomic,strong) NSString * coverWebLarge;
@property (nonatomic,strong) NSString * createdAt;
@property (nonatomic,assign) NSInteger updatedAt;
@property (nonatomic,assign) NSInteger uid;
@property (nonatomic,strong) NSString * nickname;
@property (nonatomic,assign) BOOL isVerified;
@property (nonatomic,strong) NSString * avatarPath;
@property (nonatomic,strong) NSString * intro;
@property (nonatomic,strong) NSString * introRich;
@property (nonatomic,strong) NSString * tags;
@property (nonatomic,assign) NSInteger * tracks;
@property (nonatomic,assign) NSInteger * shares;
@property (nonatomic,strong) NSString * hasNew;
@property (nonatomic,assign) BOOL isFavorite;
@property (nonatomic,assign) NSInteger playTimes;
@property (nonatomic,assign) NSInteger status;
@property (nonatomic,assign) NSInteger serializeStatus;
@property (nonatomic,assign) NSInteger * serialState;
@end
