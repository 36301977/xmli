//
//  faxianzhiboViewController.m
//  喜马拉雅项目
//
//  Created by 大米 on 15/11/18.
//  Copyright © 2015年 rice. All rights reserved.
//

#import "faxianzhiboViewController.h"

#define kViewWidth self.view.frame.size.width
#define kViewHeight self.view.frame.size.height

@interface faxianzhiboViewController ()<UITableViewDataSource,UITableViewDelegate,SDRefreshViewAnimationDelegate>
@property (nonatomic,strong) faxianzhiboDataHandle * dataHandle;
@property (nonatomic,strong) UITableView * tabelView;
@property (nonatomic,strong) NSMutableArray * mutableArray;
@property (nonatomic,strong) NSMutableArray * mutableArray2;

@end

@implementation faxianzhiboViewController

-(void)viewWillAppear:(BOOL)animated{
    self.dataHandle = [faxianzhiboDataHandle createDataHandle];
    [self uploadInfo];
}

- (void)uploadInfo{
    [self.dataHandle loadHomePageRadiosList:^(id jsonObject1,id jsonObject2) {
        self.mutableArray = [NSMutableArray array];
        _mutableArray = jsonObject1;
        self.mutableArray2 = [NSMutableArray array];
        _mutableArray2 = jsonObject2;
        [_tabelView reloadData];
    }];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tabelView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kViewWidth, kViewHeight - 64 - 49) style:(UITableViewStyleGrouped)];
    
    _tabelView.dataSource = self;
    _tabelView.delegate = self;
    
    [_tabelView registerNib:[UINib nibWithNibName:@"zhibotuijian1TableViewCell" bundle:nil] forCellReuseIdentifier:@"cellzhibotuijian1"];
    [_tabelView registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:@"cellReuse"];
    
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
    return 3;
}

// 必须实现 设置每个分区有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

//必须实现  每一行显示的信息 cell

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //    注册后 重用cell
    if (indexPath.section == 0) {
        zhibotuijian1TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cellzhibotuijian1"];
        return cell;
    }
    else
    {
        TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cellReuse"];
        if (indexPath.section == 1) {
            cell.fxzhibotuijianArray = _mutableArray;
        }
        else if(indexPath.section == 2){
            cell.fxpaihangbangArray = _mutableArray2;
        }
        return  cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 100;
    }
    else{
        return 160;
    }
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
