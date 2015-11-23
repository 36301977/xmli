//
//  fxbangdanTableViewCell.h
//  喜马拉雅项目
//
//  Created by 大米 on 15/11/19.
//  Copyright © 2015年 rice. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "faxianBangDanModel.h"

@interface fxbangdanTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet CYImageView *image;
@property (strong, nonatomic) IBOutlet UILabel *label1;
@property (strong, nonatomic) IBOutlet UILabel *label2;
@property (strong, nonatomic) IBOutlet UILabel *label3;

@property (nonatomic,strong)faxianBangDanModel * bdModel;

@end
