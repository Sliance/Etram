//
//  RechargeViewController.m
//  Psf
//
//  Created by 燕来秋mac9 on 2018/7/3.
//  Copyright © 2018年 zhangshu. All rights reserved.
//

#import "RechargeViewController.h"
#import "RechargeHeadView.h"

#import "PayTypeView.h"
#import "MineServiceApi.h"


@interface RechargeViewController ()<UIScrollViewDelegate>

@property(nonatomic,strong)UIScrollView *bgscrollow;
@property(nonatomic,strong)RechargeHeadView *headView;

@property(nonatomic,strong)PayTypeView *payView;
@property(nonatomic,strong)NSMutableArray *dataArr;
@property(nonatomic,strong)UIButton *payBtn;
@property(nonatomic,strong)UIButton *ruleBtn;
@end

@implementation RechargeViewController
-(UIScrollView *)bgscrollow{
    if (!_bgscrollow) {
        _bgscrollow = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
//        _bgscrollow.backgroundColor = [UIColor whiteColor];
        _bgscrollow.delegate = self;
    }
    return _bgscrollow;
}

-(RechargeHeadView *)headView{
    if (!_headView) {
        _headView = [[RechargeHeadView alloc]init];
    }
    return _headView;
}
-(PayTypeView *)payView{
    if (!_payView) {
        _payView = [[PayTypeView alloc]init];
    }
    return _payView;
}
-(UIButton *)payBtn{
    if (!_payBtn) {
        _payBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_payBtn.layer setMasksToBounds:YES];
        [_payBtn.layer setCornerRadius:20];
        
        [_payBtn setTitle:@"立即充值" forState:UIControlStateNormal];
        _payBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        [_payBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        [_payBtn addTarget:self action:@selector(pressPay) forControlEvents:UIControlEventTouchUpInside];
        _payBtn.backgroundColor = DSColorFromHex(0x5AC72F);
    }
    return _payBtn;
}
-(UIButton *)ruleBtn{
    if (!_ruleBtn) {
        _ruleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_ruleBtn setTitle:@"余额退还规则" forState:UIControlStateNormal];
        _ruleBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_ruleBtn setTitleColor:DSColorFromHex(0x5AC72F) forState:UIControlStateNormal];
        [_ruleBtn addTarget:self action:@selector(pressRule) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _ruleBtn;
}
-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.backgroundColor = DSColorFromHex(0xF0F0F0);
        [self setTitle:@"充值余额"];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    if (@available(iOS 11.0, *)) {
        _bgscrollow.contentInsetAdjustmentBehavior = NO;
    } else {
        self.navigationController.navigationBar.translucent = NO;
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    [self.view addSubview:self.bgscrollow];
    [self.bgscrollow addSubview:self.headView];
    [self.bgscrollow addSubview:self.payView];
    [self.view addSubview:self.payBtn];
    [self.view addSubview:self.ruleBtn];
    [self.payBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(180);
        make.height.mas_equalTo(40);
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-37);
    }];
    [self.ruleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(180);
        make.height.mas_equalTo(35);
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(self.payBtn.mas_top).offset(-20);
    }];
   
    [self.headView setChooseBlock:^(NSInteger index) {
        
    }];
    [self.payView setChooseBlock:^(NSInteger index) {
        
    }];
    _dataArr = [NSMutableArray array];
    [self requestData];
}

-(void)requestData{
    BaseModelReq *req = [[BaseModelReq alloc]init];
    req.appId = @"993335466657415169";
    req.timestamp = @"529675086";
    req.token = [UserCacheBean share].userInfo.token;
    req.platform = @"ios";
    __weak typeof(self)weakself = self;
    [[MineServiceApi share]rechargeMemberBalanceWithParam:req response:^(id response) {
        if (response) {
            [weakself.dataArr removeAllObjects];
            [weakself.dataArr addObjectsFromArray:response];
            [weakself reloadData];
        }
    }];
}
-(void)reloadData{
    [self.headView setDataArr:self.dataArr];
    self.headView.frame = CGRectMake(0, 0, SCREENWIDTH, (self.dataArr.count+1)/2*105+25);
    self.payView.frame = CGRectMake(0, self.headView.ctBottom+10, SCREENWIDTH, 45);
}
-(void)pressRule{
    
}
-(void)pressPay{
    
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
