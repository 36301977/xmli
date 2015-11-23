//
//  fxzhuboTableViewCell.m
//  喜马拉雅项目
//
//  Created by 大米 on 15/11/20.
//  Copyright © 2015年 rice. All rights reserved.
//

#import "fxzhuboTableViewCell.h"
#import "faxianZhuboModel.h"

@implementation fxzhuboTableViewCell
-(void)setDetailInfo:(NSMutableArray *)detailInfo{
    for (int i = 0 ; i < detailInfo.count; i ++) {
        faxianZhuboModel * models = detailInfo[i];
        _name.text = models.name;
        CYImageView *image = (CYImageView *)[self viewWithTag:101 + i];
        [image sd_setImageWithURL:[NSURL URLWithString:models.smallLogo] placeholderImage:[UIImage imageNamed:@"loads"]];
        UILabel * labelNick = (UILabel *)[self  viewWithTag:201 + i];
        labelNick.text = models.nickname;
    }
}

-(void)setZhuBoDetailInfo:(NSMutableArray *)zhuBoDetailInfo{
    _name.text = @"新晋主播";
    for (int i = 0 ; i < zhuBoDetailInfo.count; i ++) {
        faxianZhuboModel * model = zhuBoDetailInfo[i];
        CYImageView *image = (CYImageView *)[self viewWithTag:101 + i];
        UILabel * labelNick = (UILabel *)[self  viewWithTag:201 + i];
        [image sd_setImageWithURL:[NSURL URLWithString:model.smallLogo] placeholderImage:[UIImage imageNamed:@"loads"]];
        labelNick.text = model.nickname;
    }
}

- (void)awakeFromNib {
    //    设置阴影的颜色
    [_btn11 setTitleShadowColor:[UIColor greenColor] forState:UIControlStateNormal];
    //    设置偏移量
    _btn11.titleLabel.shadowOffset = CGSizeMake(1, 1);
    //    设置阴影的颜色
    [_btn22 setTitleShadowColor:[UIColor greenColor] forState:UIControlStateNormal];
    //    设置偏移量
    _btn22.titleLabel.shadowOffset = CGSizeMake(1, 1);
    //    设置阴影的颜色
    [_btn33 setTitleShadowColor:[UIColor greenColor] forState:UIControlStateNormal];
    //    设置偏移量
    _btn33.titleLabel.shadowOffset = CGSizeMake(1, 1);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (IBAction)btn1:(id)sender {
}

- (IBAction)btn2:(id)sender {
}

- (IBAction)btn3:(id)sender {
}
@end
