//
//  fenlie2TableViewCell.m
//  喜马拉雅项目
//
//  Created by 大米 on 15/11/19.
//  Copyright © 2015年 rice. All rights reserved.
//

#import "fenlie2TableViewCell.h"

@implementation fenlie2TableViewCell
-(void)setArrayCategory:(NSMutableArray *)arrayCategory{
    
    faxianfenleiModel * model1 =[faxianfenleiModel new];
    faxianfenleiModel * model2 =[faxianfenleiModel new];
    faxianfenleiModel * model3 =[faxianfenleiModel new];
    faxianfenleiModel * model4 =[faxianfenleiModel new];
    faxianfenleiModel * model5 =[faxianfenleiModel new];
    faxianfenleiModel * model6 =[faxianfenleiModel new];
    model1 = arrayCategory[0];
    model2 = arrayCategory[1];
    model3 = arrayCategory[2];
    model4 = arrayCategory[3];
    model5 = arrayCategory[4];
    model6 = arrayCategory[5];
    
    
    [_image1 sd_setImageWithURL:[NSURL URLWithString:model1.coverPath] placeholderImage:[UIImage imageNamed:@"loads"]];
    _label1.text = model1.title;
    [_image2 sd_setImageWithURL:[NSURL URLWithString:model2.coverPath] placeholderImage:[UIImage imageNamed:@"loads"]];
    _label2.text = model2.title;
    [_image3 sd_setImageWithURL:[NSURL URLWithString:model3.coverPath] placeholderImage:[UIImage imageNamed:@"loads"]];
    _label3.text = model3.title;
    [_image4 sd_setImageWithURL:[NSURL URLWithString:model4.coverPath] placeholderImage:[UIImage imageNamed:@"loads"]];
    _label4.text = model4.title;
    [_image5 sd_setImageWithURL:[NSURL URLWithString:model5.coverPath] placeholderImage:[UIImage imageNamed:@"loads"]];
    _label5.text = model5.title;
    [_image6 sd_setImageWithURL:[NSURL URLWithString:model6.coverPath] placeholderImage:[UIImage imageNamed:@"loads"]];
    _label6.text = model6.title;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
