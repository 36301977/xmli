//
//  scrollView.m
//  喜马拉雅项目
//
//  Created by 大米 on 15/11/17.
//  Copyright © 2015年 rice. All rights reserved.
//

#import "scrollView.h"

#define kViewWidth self.view.frame.size.width
#define kPageHeight 160


@interface scrollView ()<UIScrollViewDelegate>

@property (nonatomic,retain)UIScrollView * scrollView;
@property (nonatomic,retain)UIPageControl * page;
@property (nonatomic,retain)NSTimer * time;
@property (nonatomic,strong)faxianDataHandle * dataHandle;
@property (nonatomic,assign)NSInteger countPage;

@end

@implementation scrollView
-(instancetype)init{
    if (self = [super init]) {
        self.dataHandle = [faxianDataHandle createDataHandle];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.frame = CGRectMake(0, 0, kViewWidth, kPageHeight);
    [self.dataHandle analysisData:^(id jsonObject) {
        NSMutableArray * mutableArray = jsonObject;
        [self refresh :(mutableArray)];
    }];
}

-(void) refresh:(NSMutableArray *)array{
    UIScrollView * scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kViewWidth, kPageHeight)];
    self.scrollView = scroll;
    _countPage = array.count;
    _scrollView.contentSize = CGSizeMake(kViewWidth * _countPage, kPageHeight);
    _scrollView.delegate = self;
    _scrollView.pagingEnabled = YES;
    _scrollView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_scrollView];
    
    for (int i = 0; i < _countPage; i ++) {
        faxianFocusImages * images = array[i];
        UIImageView * imgView = [[UIImageView alloc]initWithFrame:CGRectMake(kViewWidth * i, 0, kViewWidth, kPageHeight)];
        [_scrollView addSubview:imgView];
        [imgView sd_setImageWithURL:[NSURL URLWithString:images.pic] placeholderImage:[UIImage imageNamed:@"loads"]];
    }
    
    _page = [[UIPageControl alloc]initWithFrame:CGRectMake(kPageHeight - 30, (kViewWidth - 150) / 2, 150, 20)];
    _page.currentPageIndicatorTintColor = [UIColor redColor];
    _page.numberOfPages = _countPage;
    _page.currentPage = 0;
    _page.pageIndicatorTintColor = [UIColor lightGrayColor];
    [_page addTarget:self action:@selector(pageAction:) forControlEvents:(UIControlEventValueChanged)];
    [self.view addSubview:_page];
    
    _time = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(timeAction) userInfo:nil repeats:YES];
}

- (void)timeAction{
    static int i = 0;
    i ++;
    if (i > _countPage - 1) {
        i = 0;
    }
    [self.scrollView setContentOffset:CGPointMake(kViewWidth * i, 0)];
    _page.currentPage = i;
}

- (void)pageAction:(UIPageControl *)sender{
    NSInteger index = sender.currentPage;
    _scrollView.contentOffset = CGPointMake(kViewWidth * index, 0);
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger index = scrollView.contentOffset.x / kViewWidth;
    _page.currentPage = index;
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
