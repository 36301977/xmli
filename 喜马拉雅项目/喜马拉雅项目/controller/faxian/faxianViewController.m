//
//  faxianViewController.m
//  喜马拉雅项目
//
//  Created by 大米 on 15/11/17.
//  Copyright © 2015年 rice. All rights reserved.
//

#import "faxianViewController.h"
#import "faxiantuijianViewController.h"

#define LINE_TAG 100
#define BTN_TAG  200
#define kBigScrollTag 300

#define kViewWidth self.view.frame.size.width
#define kViewHeight self.view.frame.size.height
#define kClassify_BtnWeight (kViewWidth/5 )
#define kClassify_BtnHeight 30


@interface faxianViewController ()<UIScrollViewDelegate>

@property (nonatomic,retain)UIScrollView * scrollView;

@end

@implementation faxianViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self loadsTypeView];
}

- (void)loadsTypeView{
    UILabel * line = [[UILabel alloc]initWithFrame:CGRectMake(20, 26, 40, 2)];
    [line setBackgroundColor:[UIColor orangeColor]];
    line.tag = LINE_TAG;
    [self.view addSubview:line];
    
    NSArray * titleNames = @[@"推荐",@"分类",@"直播",@"榜单",@"主播"];
    for (int i = 0; i < titleNames.count; i ++) {
        UIButton * button = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [button setFrame:CGRectMake(i * kClassify_BtnWeight, 0, kClassify_BtnWeight, 25)];
        [button setTitle:titleNames[i] forState:(UIControlStateNormal)];
        [button setTitleColor:[UIColor darkGrayColor] forState:(UIControlStateNormal)];
        button.titleLabel.font = [UIFont fontWithName:@"宋体" size:16];
        [button setTitleColor:[UIColor orangeColor] forState:(UIControlStateSelected)];
        [button.titleLabel setFont:[UIFont systemFontOfSize:15]];
        [button addTarget:self action:@selector(changeView:) forControlEvents:(UIControlEventTouchUpInside)];
        button.tag = BTN_TAG + i;
        [self.view addSubview:button];
        if (i == 0) {
            button.selected = YES;
        }
    }
    
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 25, kViewWidth, kViewHeight - 49 - 30)];
    _scrollView.delegate = self;
    _scrollView.pagingEnabled = YES;
    _scrollView.contentSize = CGSizeMake(kViewWidth * 5, kViewHeight - 49 - 30);
    _scrollView.contentOffset = CGPointMake(0, 0);
    _scrollView.backgroundColor = [UIColor purpleColor];
    _scrollView.tag = kBigScrollTag;
    _scrollView.bounces = NO;
    [self.view addSubview:_scrollView];

    NSArray * array = @[@"faxiantuijian",@"faxianfenlei",@"faxianzhibo",@"faxianbangdan",@"faxianzhubo"];
    
    for (int i = 0; i < 5; i ++) {

        NSString * classString = [NSString stringWithFormat:@"%@ViewController",array[i]];
        Class myClass = NSClassFromString(classString);
        UIViewController *vc = [[myClass alloc]init];
        vc.view.frame = CGRectMake(i * kViewWidth, 0, kViewWidth, 480);
        [_scrollView addSubview:vc.view];
        [self addChildViewController:vc];
    }

}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

    int index = scrollView.contentOffset.x / kViewWidth;
    UIButton * btn = (UIButton *)[self.view viewWithTag:BTN_TAG + index];
    [self changeView:btn];
    
}

- (void)changeView:(UIButton *)btn{
    int tabIndex = btn.tag - BTN_TAG;
    [_scrollView setContentOffset:CGPointMake(kViewWidth*tabIndex, 0) animated:NO];
    
    UILabel * line = (UILabel *)[self.view viewWithTag:LINE_TAG];
    CGPoint center = line.center;
    center.x = btn.center.x;
    [UIView animateWithDuration:0.1 animations:^{
        line.center = center;
    }];
    NSArray * array  = self.view.subviews;
    for (UIButton * sender in array) {
        if (![sender isMemberOfClass:[UIButton class]]) {
            continue;
        }
        if (sender.tag != btn.tag) {
            sender.selected = NO;
        }
    }
    btn.selected = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
