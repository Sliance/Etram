//
//  EndRideController.m
//  Etram
//
//  Created by 燕来秋mac9 on 2018/9/10.
//  Copyright © 2018年 zhangshu. All rights reserved.
//

#import "EndRideController.h"
#import "TripDetailHeadView.h"

#import "RideEndingController.h"
#import "TemporaryLockController.h"

@interface EndRideController ()
@property(nonatomic,strong)TripDetailHeadView *headView;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UILabel *billLabel;
@property(nonatomic,strong)UIButton *successBtn;
@property (strong, nonatomic) UIButton *inputBtn;
@end

@implementation EndRideController
-(TripDetailHeadView *)headView{
    if (!_headView) {
        _headView = [[TripDetailHeadView alloc]init];
        _headView.frame = CGRectMake(0, 65, SCREENWIDTH, 60);
    }
    return _headView;
}
-(UIButton *)successBtn{
    if (!_successBtn) {
        _successBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_successBtn.layer setMasksToBounds:YES];
        [_successBtn.layer setCornerRadius:20];
        
        [_successBtn setTitle:@"结束行程" forState:UIControlStateNormal];
        _successBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        [_successBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        [_successBtn addTarget:self action:@selector(pressSuccessBtn) forControlEvents:UIControlEventTouchUpInside];
        _successBtn.backgroundColor = DSColorFromHex(0x5AC72F);
    }
    return _successBtn;
}
-(UIButton *)inputBtn{
    if (!_inputBtn) {
        _inputBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_inputBtn.layer setMasksToBounds:YES];
        [_inputBtn.layer setCornerRadius:20];
        
        [_inputBtn setTitle:@"临时上锁" forState:UIControlStateNormal];
        _inputBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        [_inputBtn setTitleColor:DSColorFromHex(0xB4B4B4) forState:UIControlStateNormal];
        [_inputBtn addTarget:self action:@selector(presslockBtn) forControlEvents:UIControlEventTouchUpInside];
        _inputBtn.backgroundColor = [UIColor whiteColor];
        [_inputBtn.layer setBorderWidth:1];
        [_inputBtn.layer setBorderColor:DSColorFromHex(0xB4B4B4).CGColor];
    }
    return _inputBtn;
}
-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.text = @"未停在规定区域，将收取回收费用";
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textColor = DSColorFromHex(0x969696);
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}
-(UILabel *)billLabel{
    if (!_billLabel) {
        _billLabel = [[UILabel alloc]init];
        _billLabel.text = @"计费收明：1元/小时";
        _billLabel.font = [UIFont systemFontOfSize:15];
        _billLabel.textColor = DSColorFromHex(0x969696);
        _billLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _billLabel;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.headView];
    [self.view addSubview:self.billLabel];
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.successBtn];
    [self.view addSubview:self.inputBtn];
    self.titleLabel.frame = CGRectMake(0, self.headView.ctBottom+55, SCREENWIDTH, 15);
    self.successBtn.frame = CGRectMake(SCREENWIDTH/2-90, self.titleLabel.ctBottom+10, 180, 40);
    self.billLabel.frame = CGRectMake(0, self.successBtn.ctBottom+40, SCREENWIDTH, 15);
    self.inputBtn.frame = CGRectMake(SCREENWIDTH/2-90, self.billLabel.ctBottom+10, 180, 40);
    
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
        self.title = @"行程结束";
    }
    return self;
}
-(void)presslockBtn{
    TemporaryLockController *temVC = [[TemporaryLockController alloc]init];
    [self.navigationController pushViewController:temVC animated:YES];
}
-(void)pressSuccessBtn{
    RideEndingController *endVC = [[RideEndingController alloc]init];
    [self.navigationController pushViewController:endVC animated:YES];
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
