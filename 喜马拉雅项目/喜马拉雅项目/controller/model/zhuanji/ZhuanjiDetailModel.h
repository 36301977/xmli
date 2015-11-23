//
//  ZhuanjiDetailModel.h
//  喜马拉雅项目
//
//  Created by 大米 on 15/11/23.
//  Copyright © 2015年 rice. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZhuanjiDetailModel : NSObject
@property (nonatomic,strong) NSString * trackId;
@property (nonatomic,strong) NSString * uid;
@property (nonatomic,strong) NSString * playUrl64;
@property (nonatomic,strong) NSString * playUrl32;
@property (nonatomic,strong) NSString * downloadUrl;
@property (nonatomic,strong) NSString * playPathAacv164;
@property (nonatomic,strong) NSString * playPathAacv224;
@property (nonatomic,strong) NSString * downloadAacUrl;
@property (nonatomic,strong) NSString * title;
@property (nonatomic,strong) NSString * duration;
@property (nonatomic,strong) NSString * processState;
@property (nonatomic,strong) NSString * createdAt;
@property (nonatomic,strong) NSString * coverSmall;
@property (nonatomic,strong) NSString * coverMiddle;
@property (nonatomic,strong) NSString * coverLarge;
@property (nonatomic,strong) NSString * nickname;
@property (nonatomic,strong) NSString * smallLogo;
@property (nonatomic,strong) NSString * userSource;
@property (nonatomic,strong) NSString * albumId;
@property (nonatomic,strong) NSString * albumTitle;
@property (nonatomic,strong) NSString * albumImage;
@property (nonatomic,strong) NSString * orderNum;
@property (nonatomic,strong) NSString * opType;
@property (nonatomic,strong) NSString * isPublic;
@property (nonatomic,strong) NSString * likes;
@property (nonatomic,strong) NSString * playtimes;
@property (nonatomic,strong) NSString * comments;
@property (nonatomic,strong) NSString * shares;
@property (nonatomic,strong) NSString * status;
@property (nonatomic,strong) NSString * downloadSize;
@property (nonatomic,strong) NSString * downloadAacSize;
@property (nonatomic,strong) NSString * maxPageId;
@property (nonatomic,strong) NSString * pageId;
@property (nonatomic,strong) NSString * pageSize;
@property (nonatomic,strong) NSString * totalCount;
@end
