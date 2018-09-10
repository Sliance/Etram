//
//  TemporaryLockController.m
//  Etram
//
//  Created by 燕来秋mac9 on 2018/9/10.
//  Copyright © 2018年 zhangshu. All rights reserved.
//

#import "TemporaryLockController.h"

@interface TemporaryLockController ()
@property(nonatomic,strong)UIButton *unlockBtn;
@property (strong, nonatomic) UIButton *endBtn;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UILabel *dateLabel;
@property(nonatomic,strong)UILabel *detailLabel;

@end

@implementation TemporaryLockController
-(UIButton *)unlockBtn{
    if (!_unlockBtn) {
        _unlockBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_unlockBtn.layer setMasksToBounds:YES];
        [_unlockBtn.layer setCornerRadius:20];
        
        [_unlockBtn setTitle:@"解锁车辆" forState:UIControlStateNormal];
        _unlockBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        [_unlockBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        [_unlockBtn addTarget:self action:@selector(pressUnlock) forControlEvents:UIControlEventTouchUpInside];
        _unlockBtn.backgroundColor = DSColorFromHex(0x5AC72F);
    }
    return _unlockBtn;
}
-(UIButton *)endBtn{
    if (!_endBtn) {
        _endBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_endBtn.layer setMasksToBounds:YES];
        [_endBtn.layer setCornerRadius:20];
        
        [_endBtn setTitle:@"结束行程" forState:UIControlStateNormal];
        _endBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        [_endBtn setTitleColor:DSColorFromHex(0x5AC72F) forState:UIControlStateNormal];
        [_endBtn addTarget:self action:@selector(pressEnd) forControlEvents:UIControlEventTouchUpInside];
        _endBtn.backgroundColor = [UIColor whiteColor];
        [_endBtn.layer setBorderWidth:1];
        [_endBtn.layer setBorderColor:DSColorFromHex(0x5AC72F).CGColor];
    }
    return _endBtn;
}
-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.text = @"临时上锁成功";
        _titleLabel.font = [UIFont boldSystemFontOfSize:21];
        _titleLabel.textColor = DSColorFromHex(0x5AC72F);
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}
-(UILabel *)dateLabel{
    if (!_dateLabel) {
        _dateLabel = [[UILabel alloc]init];
        _dateLabel.text = @"01分钟";
        _dateLabel.font = [UIFont systemFontOfSize:24];
        _dateLabel.textColor = DSColorFromHex(0x323232);
        _dateLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _dateLabel;
}
-(UILabel *)detailLabel{
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc]init];
        _detailLabel.text = @"0.0元";
        _detailLabel.font = [UIFont systemFontOfSize:24];
        _detailLabel.textColor = DSColorFromHex(0x323232);
        _detailLabel.textAlignment = NSTextAlignmentCenter;
        
    }
    return _detailLabel;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.dateLabel];
    [self.view addSubview:self.detailLabel];
    [self.view addSubview:self.unlockBtn];
    [self.view addSubview:self.endBtn];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(56);
        make.centerX.equalTo(self.view);
    }];
    [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(40);
        make.width.mas_equalTo(SCREENWIDTH/2);
        make.left.equalTo(self.view);
    }];
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(40);
        make.width.mas_equalTo(SCREENWIDTH/2);
        make.right.equalTo(self.view);
    }];
    [self.unlockBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.detailLabel.mas_bottom).offset(50);
        make.centerX.equalTo(self.view);
        make.width.mas_equalTo(180);
        make.height.mas_equalTo(40);
    }];
    [self.endBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.unlockBtn.mas_bottom).offset(45);
        make.centerX.equalTo(self.view);
        make.width.mas_equalTo(180);
        make.height.mas_equalTo(40);
    }];
}
-(void)pressUnlock{
    
}
-(void)pressEnd{
    
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
