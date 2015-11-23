//
//  TableViewCell.h
//  喜马拉雅项目
//
//  Created by 大米 on 15/11/17.
//  Copyright © 2015年 rice. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *titleType;

@property (strong, nonatomic) IBOutlet CYImageView *image1;
@property (strong, nonatomic) IBOutlet UILabel *title1;
@property (strong, nonatomic) IBOutlet UILabel *trackTitle1;

@property (strong, nonatomic) IBOutlet CYImageView *image2;
@property (strong, nonatomic) IBOutlet UILabel *title2;
@property (strong, nonatomic) IBOutlet UILabel *trackTitle2;

@property (strong, nonatomic) IBOutlet CYImageView *image3;
@property (strong, nonatomic) IBOutlet UILabel *title3;
@property (strong, nonatomic) IBOutlet UILabel *trackTitle3;

@property (nonatomic,strong) NSMutableArray * focusImageArray;
@property (nonatomic,strong) NSMutableArray * focusImageDictionary;

@property (nonatomic,strong) NSMutableArray * fxzhibotuijianArray;
@property (nonatomic,strong) NSMutableArray * fxpaihangbangArray;

@end
