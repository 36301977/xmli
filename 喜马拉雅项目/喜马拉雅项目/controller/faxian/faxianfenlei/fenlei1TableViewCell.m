//
//  fenlei1TableViewCell.m
//  喜马拉雅项目
//
//  Created by 大米 on 15/11/19.
//  Copyright © 2015年 rice. All rights reserved.
//

#import "fenlei1TableViewCell.h"

@implementation fenlei1TableViewCell
-(void)setArrayCatagory:(NSMutableArray *)arrayCatagory{
    faxianfenleiModel * model1 =[faxianfenleiModel new];
    faxianfenleiModel * model2 =[faxianfenleiModel new];
    faxianfenleiModel * model3 =[faxianfenleiModel new];
    faxianfenleiModel * model4 =[faxianfenleiModel new];
    faxianfenleiModel * model5 =[faxianfenleiModel new];
    model1 = arrayCatagory[0];
    model2 = arrayCatagory[1];
    model3 = arrayCatagory[2];
    model4 = arrayCatagory[3];
    model5 = arrayCatagory[4];
    
    [_image1 sd_setImageWithURL:[NSURL URLWithString:model1.coverPath] placeholderImage:[UIImage imageNamed:@"loads"]];
    [_image2 sd_setImageWithURL:[NSURL URLWithString:model2.coverPath] placeholderImage:[UIImage imageNamed:@"loads"]];
    [_image3 sd_setImageWithURL:[NSURL URLWithString:model3.coverPath] placeholderImage:[UIImage imageNamed:@"loads"]];
    [_image4 sd_setImageWithURL:[NSURL URLWithString:model4.coverPath] placeholderImage:[UIImage imageNamed:@"loads"]];
    [_image5 sd_setImageWithURL:[NSURL URLWithString:model5.coverPath] placeholderImage:[UIImage imageNamed:@"loads"]];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
