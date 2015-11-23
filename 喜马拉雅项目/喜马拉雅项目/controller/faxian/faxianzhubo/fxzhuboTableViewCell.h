//
//  fxzhuboTableViewCell.h
//  喜马拉雅项目
//
//  Created by 大米 on 15/11/20.
//  Copyright © 2015年 rice. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface fxzhuboTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet CYImageView *image1;
@property (strong, nonatomic) IBOutlet CYImageView *image2;
@property (strong, nonatomic) IBOutlet CYImageView *image3;

@property (strong, nonatomic) IBOutlet UILabel *nicknameLab1;
@property (strong, nonatomic) IBOutlet UILabel *nicknameLab2;
@property (strong, nonatomic) IBOutlet UILabel *nicknameLab3;

@property (strong, nonatomic) IBOutlet UIButton *btn11;
@property (strong, nonatomic) IBOutlet UIButton *btn22;
@property (strong, nonatomic) IBOutlet UIButton *btn33;


- (IBAction)btn1:(id)sender;
- (IBAction)btn2:(id)sender;
- (IBAction)btn3:(id)sender;

@property (nonatomic,strong) NSMutableArray * detailInfo;
@property (nonatomic,strong) NSMutableArray * zhuBoDetailInfo;
@end
