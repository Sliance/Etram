//
//  TradingDetailController.m
//  Psf
//
//  Created by 燕来秋mac9 on 2018/7/2.
//  Copyright © 2018年 zhangshu. All rights reserved.
//

#import "TradingDetailController.h"
#import "TradingDetailCell.h"
#import "MineServiceApi.h"

@interface TradingDetailController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableview;
@property(nonatomic,strong)NSMutableArray *dataArr;
@property(nonatomic,assign)NSInteger pageIndex;


@end

@implementation TradingDetailController

-(UITableView *)tableview{
    if (!_tableview) {
        _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT) style:UITableViewStylePlain];
        _tableview.backgroundColor = DSColorFromHex(0xF0F0F0);
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.tableFooterView = [[UIView alloc]init];
    }
    return _tableview;
}

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self setTitle:@"收支明细"];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    if (@available(iOS 11.0, *)) {
        _tableview.contentInsetAdjustmentBehavior = NO;
    } else {
        self.navigationController.navigationBar.translucent = NO;
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    [self.view addSubview:self.tableview];
    _dataArr = [NSMutableArray array];
    self.tableview.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefreshing)];
    [self headerRefreshing];
}
-(void)headerRefreshing
{
    self.pageIndex = 1;
    [self requestData];
}
/**
 *  上拉刷新
 */
-(void)footerRefreshing
{
    
    self.pageIndex++;
    [self requestData];
}
-(void)requestData{
    BaseModelReq *req = [[BaseModelReq alloc]init];
    req.appId = @"993335466657415169";
    req.timestamp = @"529675086";
    req.token = [UserCacheBean share].userInfo.token;
    req.platform = @"ios";
    req.pageIndex = self.pageIndex;
    req.pageSize = @"10";
    __weak typeof(self)weakself = self;
    [[MineServiceApi share]accountDetailListWithParam:req response:^(id response) {
        if (response!= nil) {
            if (self.pageIndex ==1) {
                [weakself.dataArr removeAllObjects];
                [weakself.dataArr addObjectsFromArray:response];
                [weakself.tableview.mj_header endRefreshing];
            }else{
                [weakself.dataArr addObjectsFromArray:response];
                [weakself.tableview.mj_header endRefreshing];
                [weakself.tableview.mj_footer endRefreshing];
            }
            
            if (weakself.dataArr.count ==0) {
//weakself.emptyView.hidden = NO;
            }
            if ([response count] < 10) {
                [weakself.tableview.mj_footer removeFromSuperview];
                
            }
            else{
                weakself.tableview.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:weakself refreshingAction:@selector(footerRefreshing)];
            }
            [weakself.tableview reloadData];
        }
    }];
}
-(void)setType:(NSInteger)type{
    _type = type;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 74;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identify = @"TradingDetailCell";
    TradingDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[TradingDetailCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    IntegralRecord *model = self.dataArr[indexPath.row];
    [cell setType:self.type];
    [cell setModel:model];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
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
