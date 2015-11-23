//
//  faxianbangdanViewController.m
//  喜马拉雅项目
//
//  Created by 大米 on 15/11/18.
//  Copyright © 2015年 rice. All rights reserved.
//

#import "faxianbangdanViewController.h"

#define kViewWidth self.view.frame.size.width
#define kViewHeight self.view.frame.size.height
#define kHeaderViewHeight 150

@interface faxianbangdanViewController ()<UITableViewDataSource,UITableViewDelegate,SDRefreshViewAnimationDelegate>
@property (nonatomic,strong) faxianBangdanDataHandle * dataHandle;
@property (nonatomic,strong) UITableView * tabelView;
@property (nonatomic,strong) UIImageView * images;
@property (nonatomic,strong) NSMutableArray * mutableArray;
@property (nonatomic,strong) NSMutableDictionary * mutableDic;
@property (nonatomic,strong) faxianBangDanFocusImagesModel * focusImageModel;

@end

@implementation faxianbangdanViewController
-(void)viewWillAppear:(BOOL)animated{
    self.dataHandle = [faxianBangdanDataHandle createDataHandle];
    [self uploadInfo];
    
}

- (void)uploadInfo{
    [self.dataHandle loadBangdan:^(id jsonObject1, id jsonObject2, id jsonObject3){
        self.focusImageModel = [faxianBangDanFocusImagesModel new];
        self.mutableArray = [NSMutableArray array];
        self.mutableDic = [NSMutableDictionary dictionary];
        
        _focusImageModel = jsonObject1;
        _mutableArray = jsonObject2;
        _mutableDic = jsonObject3;
        [_tabelView reloadData];
        
        [_images sd_setImageWithURL:[NSURL URLWithString:_focusImageModel.pic] placeholderImage:[UIImage imageNamed:@"loads"]];
    }];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tabelView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kViewWidth, kViewHeight - 64 - 49) style:(UITableViewStyleGrouped)];
    
    _tabelView.dataSource = self;
    _tabelView.delegate = self;
    
    [_tabelView registerNib:[UINib nibWithNibName:@"fxbangdanTableViewCell" bundle:nil] forCellReuseIdentifier:@"cellReuse2"];
    
    
    self.images = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kViewWidth, kHeaderViewHeight)];
    _tabelView.tableHeaderView = _images;
    
    [self.view addSubview:_tabelView];
}


#pragma mark tableViewDataSource
//必须实现 分区header的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}

//必须实现 分区footer的高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}

// 设置显示数据 与viewForHeaderInSection 不可以共存
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return _mutableArray[section];
}

// 可选择实现 设置分区个数  不写 默认为1
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

// 必须实现 设置每个分区有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

//必须实现  每一行显示的信息 cell

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
 
    fxbangdanTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cellReuse2"];
    NSMutableArray * muArray = _mutableDic[_mutableArray[indexPath.section]];
    faxianBangDanModel * model = muArray[indexPath.row];
    if (model != nil) {
        cell.bdModel = model;
    }
    return  cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
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
