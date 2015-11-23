//
//  faxianzhuboViewController.m
//  喜马拉雅项目
//
//  Created by 大米 on 15/11/18.
//  Copyright © 2015年 rice. All rights reserved.
//

#import "faxianzhuboViewController.h"
#import "faxianzhuboDataHandle.h"
#import "fxzhuboTableViewCell.h"

#define kViewWidth self.view.frame.size.width
#define kViewHeight self.view.frame.size.height

@interface faxianzhuboViewController ()<UITableViewDataSource,UITableViewDelegate,SDRefreshViewAnimationDelegate>
@property (nonatomic,strong) faxianzhuboDataHandle * dataHandle;
@property (nonatomic,strong) UITableView * tabelView;
@property (nonatomic,strong) NSMutableArray * mutableArray;
@property (nonatomic,strong) NSMutableDictionary * mutableDic;

@end

@implementation faxianzhuboViewController

-(void)viewWillAppear:(BOOL)animated{
    self.dataHandle = [faxianzhuboDataHandle createDataHandle];
    [self uploadInfo];
    
}

- (void)uploadInfo{
    [self.dataHandle loadZhubo:^(id jsonObject1, id jsonObject2) {
        self.mutableArray = [NSMutableArray array];
        self.mutableDic = [NSMutableDictionary dictionary];
        
        _mutableArray = jsonObject1;
        _mutableDic = jsonObject2;
        [_tabelView reloadData];
    }];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tabelView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kViewWidth, kViewHeight - 64 - 49) style:(UITableViewStyleGrouped)];
    
    _tabelView.dataSource = self;
    _tabelView.delegate = self;
    
    [_tabelView registerNib:[UINib nibWithNibName:@"fxzhuboTableViewCell" bundle:nil] forCellReuseIdentifier:@"cellZhubo"];
    
    UIView * view1 = [[UIView alloc]initWithFrame:CGRectMake(1, 1, 1, 1)];
    _tabelView.tableHeaderView = view1;
    
    [self.view addSubview:_tabelView];
}


#pragma mark tableViewDataSource
//必须实现 分区header的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 1;
}

//必须实现 分区footer的高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}

// 可选择实现 设置分区个数  不写 默认为1
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _mutableArray.count;
}

// 必须实现 设置每个分区有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

//必须实现  每一行显示的信息 cell

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //    注册后 重用cell
        fxzhuboTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cellZhubo"];
    if (indexPath.section == 0) {
        cell.detailInfo = _mutableDic[_mutableArray[indexPath.section]];
    }
    else if (indexPath.section == 1){
        cell.zhuBoDetailInfo = _mutableDic[_mutableArray[_mutableArray.count -1]];
    }
    else{
        cell.detailInfo = _mutableDic[_mutableArray[indexPath.section - 1]];
    }
        return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
        return 220;
}

#pragma mark tableViewDelegate

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
