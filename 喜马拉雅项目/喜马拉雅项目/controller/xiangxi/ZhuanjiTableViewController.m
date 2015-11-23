//
//  ZhuanjiTableViewController.m
//  喜马拉雅项目
//
//  Created by 大米 on 15/11/21.
//  Copyright © 2015年 rice. All rights reserved.
//

#import "ZhuanjiTableViewController.h"
#import "ZhuanjiInfoModel.h"
#import "ZhuanjiDetailModel.h"
#import "ZhuanjiDataHandle.h"

@interface ZhuanjiTableViewController ()

@property (nonatomic,strong)ZhuanjiInfoModel * infoModel;
@property (nonatomic,strong)NSMutableArray * listArray;
@property (nonatomic,strong)ZhuanjiDataHandle * dataHandle;

@end

@implementation ZhuanjiTableViewController
-(NSMutableDictionary *)paramDictionary{
    if (_paramDictionary == nil) {
        _paramDictionary = [NSMutableDictionary dictionaryWithCapacity:10];
    }
    return _paramDictionary;
}

-(ZhuanjiInfoModel *)infoModel{
    if (_infoModel == nil) {
        _infoModel = [ZhuanjiInfoModel new];
    }
    return _infoModel;
}

-(NSMutableArray *)listArray{
    if (_listArray == nil) {
        _listArray = [NSMutableArray arrayWithCapacity:10];
    }
    return _listArray;
}

-(void)viewWillAppear:(BOOL)animated{
    self.dataHandle = [ZhuanjiDataHandle createDataHandle];
    NSString * indexString = @"1";
    if (_listArray == NULL ) {
        indexString = @"1";
    }
    else {
        if ( _listArray.count <= 0) {
            indexString = @"1";
        }
        if (((ZhuanjiDetailModel *)_listArray[0]).pageId < ((ZhuanjiDetailModel *)_listArray[0]).maxPageId){
            NSString * sdfs =((ZhuanjiDetailModel *)_listArray[0]).pageId;
            int indexV=[sdfs intValue] + 1;
            indexString = [NSString stringWithFormat:@"%d", indexV];
        }
        else{
            indexString = ((ZhuanjiDetailModel *)_listArray[0]).maxPageId;
        }
    }
    [self.paramDictionary setObject:indexString forKey:@"pageId"];
    _dataHandle.paramDic = _paramDictionary;
    [self uploadInfo];
}

- (void)uploadInfo{
    [self.dataHandle zhuanjiData:^(id jsonObject, id jsonObject1) {
        _infoModel = jsonObject;
        _listArray = jsonObject1;
        [self.tableView reloadData];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_btn2B.layer setMasksToBounds:YES];
    [_btn2B.layer setCornerRadius:5];
    [_btn2B.layer setBorderWidth:1];
    _btn2B.layer.borderColor = [UIColor colorWithRed:
                                219 / 255.0  green:249 / 255.0 blue:255 / 255.0 alpha:0.7].CGColor;
    
    [_btn3B.layer setMasksToBounds:YES];
    [_btn3B.layer setCornerRadius:5];
    [_btn3B.layer setBorderWidth:1];
    _btn3B.layer.borderColor = [UIColor colorWithRed:
                                219 / 255.0  green:249 / 255.0 blue:255 / 255.0 alpha:0.7].CGColor;
    
    [_btn4B.layer setMasksToBounds:YES];
    [_btn4B.layer setCornerRadius:5];
    [_btn4B.layer setBorderWidth:1];
    _btn4B.layer.borderColor = [UIColor colorWithRed:
                                219 / 255.0  green:249 / 255.0 blue:255 / 255.0 alpha:0.7].CGColor;
    
    [_image2.layer setMasksToBounds:YES];
    [_image2.layer setCornerRadius:20];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ZhuanjiTableViewCell" bundle:nil] forCellReuseIdentifier:@"ZhuanjiCell"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btn1:(id)sender {
}

- (IBAction)btn2:(id)sender {
}

- (IBAction)btn3:(id)sender {
}

- (IBAction)btn4:(id)sender {
}

- (IBAction)segment1:(id)sender {
}
@end
