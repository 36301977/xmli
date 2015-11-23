//
//  faxianfenleiViewController.m
//  喜马拉雅项目
//
//  Created by 大米 on 15/11/19.
//  Copyright © 2015年 rice. All rights reserved.
//

#import "faxianfenleiViewController.h"

#define kViewWidth self.view.frame.size.width
#define kViewHeight self.view.frame.size.height
#define kPageHeight 160

@interface faxianfenleiViewController ()<UITableViewDataSource,UITableViewDelegate,SDRefreshViewAnimationDelegate>
@property (nonatomic,strong) faxiantuijianDataHandle * dataHandle;
@property (nonatomic,strong) UITableView * tabelView;
@property (nonatomic,strong) NSMutableArray * mutableArray;
@end

@implementation faxianfenleiViewController
-(void)viewWillAppear:(BOOL)animated{
    self.dataHandle = [faxiantuijianDataHandle createDataHandle];
    [self uploadInfo];
}

- (void)uploadInfo{
    [self.dataHandle loadCategory:^(id jsonObject1) {
        self.mutableArray = [NSMutableArray array];
        _mutableArray = jsonObject1;
        [_tabelView reloadData];
    }];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tabelView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kViewWidth, kViewHeight - 64 - 49) style:(UITableViewStyleGrouped)];

    _tabelView.dataSource = self;
    _tabelView.delegate = self;
    
    [_tabelView registerNib:[UINib nibWithNibName:@"fenlei1TableViewCell" bundle:nil] forCellReuseIdentifier:@"cell1"];
    [_tabelView registerNib:[UINib nibWithNibName:@"fenlie2TableViewCell" bundle:nil] forCellReuseIdentifier:@"cell2"];
    
    UIView * view1 = [[UIView alloc]initWithFrame:CGRectMake(1, 1, 1, 1)];
    _tabelView.tableHeaderView = view1;
    
    [self.view addSubview:_tabelView];
    [_tabelView reloadData];

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

////分区footer的视图
//-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
//        UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kViewWidth, 10)];
//        view.backgroundColor = [UIColor grayColor];
//    return view;
//}

// 可选择实现 设置分区个数  不写 默认为1
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

// 必须实现 设置每个分区有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

//必须实现  每一行显示的信息 cell

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //    注册后 重用cell
    if (indexPath.section == 0) {
        fenlei1TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
            if (_mutableArray != NULL) {
                NSMutableArray * array = [NSMutableArray array];
                for (int i = 0; i < 5; i ++) {
                    [array addObject:_mutableArray[i]];
                }
                cell.arrayCatagory = array;
            }
        return cell;
    }
    else
    {
        fenlie2TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell2"];
        if (_mutableArray != NULL) {
            NSMutableArray * array = [NSMutableArray array];
            if (indexPath.section == 1) {
              for (int i = 5; i < 11; i ++) {
                  [array addObject:_mutableArray[i]];
              }
            }
            else if (indexPath.section == 2) {
                for (int i = 11; i < 17; i ++) {
                    [array addObject:_mutableArray[i]];
                }
            }
            else if (indexPath.section == 3) {
                for (int i = 17; i < 23; i ++) {
                    [array addObject:_mutableArray[i]];
                }
            }
            cell.arrayCategory = array;
        }
        return  cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 200;
    }
    else{
        return 120;
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
