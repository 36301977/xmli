//
//  faxiantuijianViewController.m
//  喜马拉雅项目
//
//  Created by 大米 on 15/11/17.
//  Copyright © 2015年 rice. All rights reserved.
//

#import "faxiantuijianViewController.h"
#import "scrollView.h"

#define kViewWidth self.view.frame.size.width
#define kViewHeight self.view.frame.size.height
#define kPageHeight 160

@interface faxiantuijianViewController ()<UITableViewDataSource,UITableViewDelegate,SDRefreshViewAnimationDelegate>
@property (nonatomic,strong)faxianDataHandle * datahandle;
@property (nonatomic,strong) UITableView * tabelView;
@property (nonatomic,strong)NSMutableArray * mutableArray;
@property (nonatomic,strong)NSMutableDictionary * mutableDictionary;
@property (nonatomic,strong)NSMutableArray * mutableDictionaryArray;
@property (nonatomic, weak) SDRefreshHeaderView *refreshHeader;

@property (nonatomic, weak) UIImageView *animationView;
@property (nonatomic, weak) UIImageView *boxView;
@property (nonatomic, weak) UILabel *label;
@end

@implementation faxiantuijianViewController
-(void)viewWillAppear:(BOOL)animated{
    self.datahandle = [faxianDataHandle createDataHandle];
    [self uploadInfo];
////    下拉刷新
//    [self setupHeader];

}

- (void)uploadInfo{
    
    //    加载提示图
    Indicator *indicator = [[Indicator alloc]initWithFrame:CGRectMake((kViewWidth - 50) / 2, 250, 50, 50)];
    [indicator startAnimating];
    [self.view addSubview:indicator];
    [self.datahandle tuijianData:^(id jsonObject1,id jsonObject2,id jsonObject3) {
        self.mutableArray = [NSMutableArray array];
        self.mutableDictionary = [NSMutableDictionary dictionary];
        
        _mutableArray = jsonObject1;
        _mutableDictionary = jsonObject2;
        _mutableDictionaryArray = jsonObject3;
        
        [_tabelView reloadData];
        [indicator setHidden:YES];
    }];

}


#pragma mark - SDRefreshView Animation Delegate

- (void)refreshView:(SDRefreshView *)refreshView didBecomeNormalStateWithMovingProgress:(CGFloat)progress
{
    refreshView.hidden = NO;
    if (progress == 0) {
        _animationView.transform = CGAffineTransformMakeScale(0.1, 0.1);
        _boxView.hidden = NO;
        _label.text = @"下拉加载最新数据";
        [_animationView stopAnimating];
    }
    
    self.animationView.transform = CGAffineTransformConcat(CGAffineTransformMakeTranslation(progress * 10, -20 * progress), CGAffineTransformMakeScale(progress, progress));
    self.boxView.transform = CGAffineTransformMakeTranslation(- progress * 85, progress * 35);
    
}

- (void)refreshView:(SDRefreshView *)refreshView didBecomeRefreshingStateWithMovingProgress:(CGFloat)progress
{
    _label.text = @"客官别急，正在加载数据...";
    [UIView animateWithDuration:1.5 animations:^{
        self.animationView.transform = CGAffineTransformMakeTranslation(200, -20);
    }];
}

- (void)refreshView:(SDRefreshView *)refreshView didBecomeWillRefreshStateWithMovingProgress:(CGFloat)progress
{
    _boxView.hidden = YES;
    _label.text = @"放开我，我才帮你加载数据";
    _animationView.transform = CGAffineTransformConcat(CGAffineTransformMakeTranslation(10, -20), CGAffineTransformMakeScale(1, 1));
    [_animationView startAnimating];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    self.tabelView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kViewWidth, kViewHeight - 64 - 49) style:(UITableViewStyleGrouped)];
    _tabelView.sectionFooterHeight = 1;
    _tabelView.sectionHeaderHeight = 1;

    
    _tabelView.dataSource = self;
    _tabelView.delegate = self;
    
    
    [_tabelView registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:@"cellReuse"];
    
    scrollView * scroll = [[scrollView alloc]init];
    _tabelView.tableHeaderView = scroll.view;
    
    [self.view addSubview:_tabelView];
    [_tabelView reloadData];
}


#pragma mark tableViewDataSource

// 可选择实现 设置分区个数  不写 默认为1
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

// 必须实现 设置每个分区有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (_mutableArray.count == 0) {
        return 1;
    }
    else{
        return (_mutableArray.count + _mutableDictionaryArray.count);
    }
}

//必须实现  每一行显示的信息 cell


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //    注册后 重用cell
    TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cellReuse"];
    if (indexPath.row == 0) {
        if (_mutableArray != NULL) {
            cell.focusImageArray = _mutableArray;
            
            faXianTuiJianlieBiaoModel * liebiaoModel1 = _mutableArray[0];
            NSMutableDictionary *dic1 = [NSMutableDictionary dictionary];
            //添加字典
            [dic1 setObject:liebiaoModel1.albumId forKey:@"albumId"];
            [dic1 setObject:@"1" forKey:@"position"];
            [dic1 setObject:liebiaoModel1.title forKey:@"title"];
            [cell.image1 addClickedWithTarget:self action:@selector(clickToAlbumld:) withObjcet:dic1];
            
            faXianTuiJianlieBiaoModel * liebiaoModel2 = _mutableArray[1];
            NSMutableDictionary *dic2 = [NSMutableDictionary dictionary];
            //添加字典
            [dic2 setObject:liebiaoModel2.albumId forKey:@"albumId"];
            [dic2 setObject:@"2" forKey:@"position"];
            [dic2 setObject:liebiaoModel2.title forKey:@"title"];
            [cell.image2 addClickedWithTarget:self action:@selector(clickToAlbumld:) withObjcet:dic2];
            
            faXianTuiJianlieBiaoModel * liebiaoModel3 = _mutableArray[2];
            NSMutableDictionary *dic3 = [NSMutableDictionary dictionary];
            //添加字典
            [dic3 setObject:liebiaoModel3.albumId forKey:@"albumId"];
            [dic3 setObject:@"3" forKey:@"position"];
            [dic3 setObject:liebiaoModel3.title forKey:@"title"];
            [cell.image3 addClickedWithTarget:self action:@selector(clickToAlbumld:) withObjcet:dic3];
            

        }
    }
    else {
        if (indexPath.row < _mutableDictionaryArray.count) {
            cell.titleType.text = _mutableDictionaryArray[indexPath.row  - 1];
            cell.focusImageDictionary = _mutableDictionary[_mutableDictionaryArray[indexPath.row  - 1]];
            
            
            faXianTuiJianlieBiaoModel * liebiaoModel1 = _mutableDictionary[_mutableDictionaryArray[indexPath.row  - 1]][0];
            NSMutableDictionary *dic1 = [NSMutableDictionary dictionary];
            //添加字典
            [dic1 setObject:liebiaoModel1.albumId forKey:@"albumId"];
            [dic1 setObject:@"1" forKey:@"position"];
            [dic1 setObject:liebiaoModel1.title forKey:@"title"];
            [cell.image1 addClickedWithTarget:self action:@selector(clickToAlbumld:) withObjcet:dic1];
            
            faXianTuiJianlieBiaoModel * liebiaoModel2 = _mutableDictionary[_mutableDictionaryArray[indexPath.row  - 1]][1];
            NSMutableDictionary *dic2 = [NSMutableDictionary dictionary];
            //添加字典
            [dic2 setObject:liebiaoModel2.albumId forKey:@"albumId"];
            [dic2 setObject:@"2" forKey:@"position"];
            [dic2 setObject:liebiaoModel2.title forKey:@"title"];
            [cell.image2 addClickedWithTarget:self action:@selector(clickToAlbumld:) withObjcet:dic2];
            
            faXianTuiJianlieBiaoModel * liebiaoModel3 = _mutableDictionary[_mutableDictionaryArray[indexPath.row  - 1]][2];
            NSMutableDictionary *dic3 = [NSMutableDictionary dictionary];
            //添加字典
            [dic3 setObject:liebiaoModel3.albumId forKey:@"albumId"];
            [dic3 setObject:@"3" forKey:@"position"];
            [dic3 setObject:liebiaoModel3.title forKey:@"title"];
            [cell.image3 addClickedWithTarget:self action:@selector(clickToAlbumld:) withObjcet:dic3];

        }
    }
    return cell;
    
}

- (void)clickToAlbumld:(NSMutableDictionary *)dic{
    
    //使用Storyboard初始化根界面
//    1、加载storyboard
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"ZhuanjiStoryboard" bundle:nil];
//    2、下面这个方法代表着创建storyboard中箭头指向的控制器（初始控制器）
    UINavigationController *nav= [storyBoard instantiateInitialViewController];
    ZhuanjiTableViewController *zhunji = nav.viewControllers[0];
    zhunji.paramDictionary = dic;
    [self showDetailViewController:nav sender:nil];

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 160;
}

//// 设置显示数据 与viewForHeaderInSection 不可以共存
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//    return @"猜你喜欢";
//}

#pragma mark tableViewDelegate

// 必须实现 设置行高
////必须实现 分区header的高度
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    return 100;
//}
//
////必须实现 分区footer的高度
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
//    return 10;
//}

// 点击row时 获取路径
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
