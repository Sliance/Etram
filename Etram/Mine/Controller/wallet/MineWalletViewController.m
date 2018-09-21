//
//  MineWalletViewController.m
//  Psf
//
//  Created by 燕来秋mac9 on 2018/7/2.
//  Copyright © 2018年 zhangshu. All rights reserved.
//

#import "MineWalletViewController.h"
#import "MineWalletCell.h"
#import "TradingDetailController.h"
#import "RechargeViewController.h"
#import "MyIntegralController.h"
#import "MineServiceApi.h"

@interface MineWalletViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableview;
@property(nonatomic,strong)UIButton *detailBtn;
@property(nonatomic,strong)NSMutableDictionary *resultDic;
@property(nonatomic,strong)MineInformationReq *result;
@end

@implementation MineWalletViewController
-(UIButton *)detailBtn{
    if (!_detailBtn) {
        _detailBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_detailBtn setTitle:@"收支明细" forState:UIControlStateNormal];
        [_detailBtn setTitleColor:DSColorFromHex(0x5AC72F) forState:UIControlStateNormal];
        _detailBtn.backgroundColor = [UIColor whiteColor];
        _detailBtn.frame = CGRectMake(0, 0, SCREENWIDTH, 30);
        [_detailBtn addTarget:self action:@selector(pressDetail:) forControlEvents:UIControlEventTouchUpInside];
        _detailBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    }
    return _detailBtn;
}

-(UITableView *)tableview{
    if (!_tableview) {
        _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT) style:UITableViewStylePlain];
        _tableview.backgroundColor = [UIColor whiteColor];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        
    }
    return _tableview;
}
-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self setTitle:@"我的钱包"];
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
    self.tableview.tableFooterView = self.detailBtn;
     [self.view addSubview:self.tableview];
    
    self.resultDic = [NSMutableDictionary dictionary];
    UIImageView *headImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 150)];
    headImage.image = [UIImage imageNamed:@"wallet_banner"];
    self.tableview.tableHeaderView = headImage;
    [self requestData];
}
-(void)requestData{
    BaseModelReq *req = [[BaseModelReq alloc]init];
    req.token = [UserCacheBean share].userInfo.token;
    req.timestamp = @"0";
    req.appId = @"997303469549645826";
    req.platform = @"ios";
    self.result = [[MineInformationReq alloc]init];
    __weak typeof(self)weakself = self;
    [[MineServiceApi share]getMemberInformationWithParam:req response:^(id response) {
        if (response) {
           
            weakself.result = response;
            [weakself.tableview reloadData];
        }
    }];
}


-(void)pressDetail:(UIButton*)sender{
    TradingDetailController *detailVC = [[TradingDetailController alloc]init];
    detailVC.type =1;
    [self.navigationController pushViewController:detailVC animated:YES];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 112;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identify = @"MineWalletCell";
    MineWalletCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[MineWalletCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
//    if (indexPath.row ==0) {
//        if (self.resultDic[@"memberBalance"]) {
//            cell.priceLabel.text = [NSString stringWithFormat:@"￥%@",self.resultDic[@"memberBalance"]];
//        }
//    }else
        if (indexPath.row ==0) {
        cell.titleLabel.text = @"骑行余额";
        cell.contentLabel.text = @"";
        cell.priceLabel.text = [NSString stringWithFormat:@"%@元",self.result.accountBalance];
        cell.rechargeBtn.hidden = NO;
        
        }else if (indexPath.row ==1){
            cell.titleLabel.text = @"我的积分";
            cell.contentLabel.text = @"";
            cell.priceLabel.text = self.result.score;
             cell.rechargeBtn.hidden = YES;
        }else if (indexPath.row ==2){
            cell.titleLabel.text = @"我的红包";
            cell.contentLabel.text = @"";
            cell.priceLabel.text = [NSString stringWithFormat:@"%@元",self.result.redEnvelope];
             cell.rechargeBtn.hidden = YES;
        }
    __weak typeof(self)weakSelf = self;
    [cell setChargeBlock:^(NSInteger index) {
        RechargeViewController *rechargeVC = [[RechargeViewController alloc]init];
        [weakSelf.navigationController pushViewController:rechargeVC animated:YES];
    }];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
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
