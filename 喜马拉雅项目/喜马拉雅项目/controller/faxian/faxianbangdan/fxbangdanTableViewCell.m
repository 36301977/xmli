//
//  fxbangdanTableViewCell.m
//  喜马拉雅项目
//
//  Created by 大米 on 15/11/19.
//  Copyright © 2015年 rice. All rights reserved.
//

#import "fxbangdanTableViewCell.h"

@implementation fxbangdanTableViewCell
-(void)setBdModel:(faxianBangDanModel *)bdModel{
    [_image sd_setImageWithURL:[NSURL URLWithString:bdModel.coverPath] placeholderImage:[UIImage imageNamed:@"loads"]];
    _label1.text = bdModel.subtitle;
    _label2.text = [bdModel.firstKResults objectAtIndex:0][@"title"];
    _label3.text = [bdModel.firstKResults objectAtIndex:1][@"title"];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
