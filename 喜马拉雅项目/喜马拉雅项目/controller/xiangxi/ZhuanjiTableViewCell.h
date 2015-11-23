//
//  ZhuanjiTableViewCell.h
//  喜马拉雅项目
//
//  Created by 大米 on 15/11/23.
//  Copyright © 2015年 rice. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZhuanjiTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *image1;

@property (strong, nonatomic) IBOutlet UILabel *labelTitle;
@property (strong, nonatomic) IBOutlet UILabel *labelTime;
@property (strong, nonatomic) IBOutlet UILabel *labelsinger;
@property (strong, nonatomic) IBOutlet UILabel *label1;
@property (strong, nonatomic) IBOutlet UILabel *label2;
@property (strong, nonatomic) IBOutlet UILabel *label3;
@property (strong, nonatomic) IBOutlet UILabel *label4;

- (IBAction)btn1:(id)sender;

@end
