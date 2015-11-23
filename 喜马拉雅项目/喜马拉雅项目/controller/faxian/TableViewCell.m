//
//  TableViewCell.m
//  喜马拉雅项目
//
//  Created by 大米 on 15/11/17.
//  Copyright © 2015年 rice. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (void)awakeFromNib {
}

-(void)setFocusImageArray:(NSMutableArray *)focusImageArray{
    _titleType.text  = @"小编推荐";
    [self showInfo:(focusImageArray)];
}

- (void)showInfo:(NSMutableArray *)arrayInfo{
    
    faXianTuiJianlieBiaoModel * liebiaoModel1 = [faXianTuiJianlieBiaoModel new];
    faXianTuiJianlieBiaoModel * liebiaoModel2 = [faXianTuiJianlieBiaoModel new];
    faXianTuiJianlieBiaoModel * liebiaoModel3 = [faXianTuiJianlieBiaoModel new];
    liebiaoModel1 = arrayInfo[0];
    [_image1 sd_setImageWithURL:[NSURL URLWithString:liebiaoModel1.coverLarge] placeholderImage:[UIImage imageNamed:@"loads"]];
    _title1.text = liebiaoModel1.title;
    _trackTitle1.text = liebiaoModel1.trackTitle;
    
    liebiaoModel2 = arrayInfo[1];
    [_image2 sd_setImageWithURL:[NSURL URLWithString:liebiaoModel2.coverLarge] placeholderImage:[UIImage imageNamed:@"loads"]];
    _title2.text = liebiaoModel2.title;
    _trackTitle2.text = liebiaoModel2.trackTitle;
    
    liebiaoModel3 = arrayInfo[2];
    [_image3 sd_setImageWithURL:[NSURL URLWithString:liebiaoModel3.coverLarge] placeholderImage:[UIImage imageNamed:@"loads"]];
    _title3.text = liebiaoModel3.title;
    _trackTitle3.text = liebiaoModel3.trackTitle;

}

-(void)setFocusImageDictionary:(NSMutableArray *)focusImageDictionary{
    
    faXianTuiJianlieBiaoModel * liebiaoModel1 = [faXianTuiJianlieBiaoModel new];
    faXianTuiJianlieBiaoModel * liebiaoModel2 = [faXianTuiJianlieBiaoModel new];
    faXianTuiJianlieBiaoModel * liebiaoModel3 = [faXianTuiJianlieBiaoModel new];
    liebiaoModel1 = focusImageDictionary[0];
    [_image1 sd_setImageWithURL:[NSURL URLWithString:liebiaoModel1.coverLarge] placeholderImage:[UIImage imageNamed:@"loads"]];
    _title1.text = liebiaoModel1.title;
    _trackTitle1.text = liebiaoModel1.trackTitle;
    
    liebiaoModel2 = focusImageDictionary[1];
    [_image2 sd_setImageWithURL:[NSURL URLWithString:liebiaoModel2.coverLarge] placeholderImage:[UIImage imageNamed:@"loads"]];
    _title2.text = liebiaoModel2.title;
    _trackTitle2.text = liebiaoModel2.trackTitle;
    
    liebiaoModel3 = focusImageDictionary[2];
    [_image3 sd_setImageWithURL:[NSURL URLWithString:liebiaoModel3.coverLarge] placeholderImage:[UIImage imageNamed:@"loads"]];
    _title3.text = liebiaoModel3.title;
    _trackTitle3.text = liebiaoModel3.trackTitle;

}
//
-(void)setFxzhibotuijianArray:(NSMutableArray *)fxzhibotuijianArray{
    _titleType.text = @"推荐电台";
    
    faxianzhiboModel * model1 = [faxianzhiboModel new];
    faxianzhiboModel * model2 = [faxianzhiboModel new];
    faxianzhiboModel * model3 = [faxianzhiboModel new];
    model1 = fxzhibotuijianArray[0];
    [_image1 sd_setImageWithURL:[NSURL URLWithString:model1.picPath] placeholderImage:[UIImage imageNamed:@"loads"]];
    _title1.hidden = YES;
    _trackTitle1.text = model1.rname;
    
    model2 = fxzhibotuijianArray[1];
    [_image2 sd_setImageWithURL:[NSURL URLWithString:model2.picPath] placeholderImage:[UIImage imageNamed:@"loads"]];
    _title2.hidden = YES;
    _trackTitle2.text = model2.rname;
    
    model3 = fxzhibotuijianArray[2];
    [_image3 sd_setImageWithURL:[NSURL URLWithString:model3.picPath] placeholderImage:[UIImage imageNamed:@"loads"]];
    _title3.hidden = YES;
    _trackTitle3.text = model3.rname;

}

- (void)setFxpaihangbangArray:(NSMutableArray *)fxpaihangbangArray{
    
    _titleType.text = @"排行榜";
    
    faxianzhiboModel * model1 = [faxianzhiboModel new];
    faxianzhiboModel * model2 = [faxianzhiboModel new];
    faxianzhiboModel * model3 = [faxianzhiboModel new];
    model1 = fxpaihangbangArray[0];
    [_image1 sd_setImageWithURL:[NSURL URLWithString:model1.radioCoverSmall] placeholderImage:[UIImage imageNamed:@"loads"]];
    _title1.hidden = YES;
    _trackTitle1.text = model1.rname;
    
    model2 = fxpaihangbangArray[1];
    [_image2 sd_setImageWithURL:[NSURL URLWithString:model2.radioCoverSmall] placeholderImage:[UIImage imageNamed:@"loads"]];
    _title2.hidden = YES;
    _trackTitle2.text = model2.rname;
    
    model3 = fxpaihangbangArray[2];
    [_image3 sd_setImageWithURL:[NSURL URLWithString:model3.radioCoverSmall] placeholderImage:[UIImage imageNamed:@"loads"]];
    _title3.hidden = YES;
    _trackTitle3.text = model3.rname;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
