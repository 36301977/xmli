//
//  ZhuanjiTableViewController.h
//  喜马拉雅项目
//
//  Created by 大米 on 15/11/21.
//  Copyright © 2015年 rice. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZhuanjiTableViewController : UITableViewController
@property (strong, nonatomic) IBOutlet UIImageView *image1;
@property (strong, nonatomic) IBOutlet UIImageView *image2;
@property (strong, nonatomic) IBOutlet UILabel *label1;
@property (strong, nonatomic) IBOutlet UILabel *label2;

@property (strong, nonatomic) IBOutlet UIButton *btn2B;
@property (strong, nonatomic) IBOutlet UIButton *btn3B;
@property (strong, nonatomic) IBOutlet UIButton *btn4B;

- (IBAction)btn1:(id)sender;
- (IBAction)btn2:(id)sender;
- (IBAction)btn3:(id)sender;
- (IBAction)btn4:(id)sender;

- (IBAction)segment1:(id)sender;

@property (nonatomic,strong)NSMutableDictionary * paramDictionary;

@end
