//
//  PaySuccessController.m
//  Etram
//
//  Created by 燕来秋mac9 on 2018/9/10.
//  Copyright © 2018年 zhangshu. All rights reserved.
//

#import "PaySuccessController.h"

@interface PaySuccessController ()
@property(nonatomic,strong)UIButton *successBtn;
@property(nonatomic,strong)UIButton *xiuBtn;
@property(nonatomic,strong)UIButton *sureBtn;
@property(nonatomic,strong)UILabel *titleLabel;
@end

@implementation PaySuccessController
-(UIButton *)xiuBtn{
    if (!_xiuBtn) {
        _xiuBtn  = [UIButton buttonWithType:UIButtonTypeCustom];
        [_xiuBtn setTitle:@"立即保修" forState:UIControlStateNormal];
        [_xiuBtn setTitleColor:DSColorFromHex(0x323232) forState:UIControlStateNormal];
        
        [_xiuBtn setImage:[UIImage imageNamed:@"xiu_unlock"] forState:UIControlStateNormal];
        _xiuBtn.imageEdgeInsets =UIEdgeInsetsMake(0, 20, 0, 0);
        _xiuBtn.titleEdgeInsets = UIEdgeInsetsMake(100, -50, 0, 0);
        _xiuBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [_xiuBtn addTarget:self action:@selector(pressxiuBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _xiuBtn;
}
-(UIButton *)successBtn{
    if (!_successBtn) {
        _successBtn  = [UIButton buttonWithType:UIButtonTypeCustom];
        [_successBtn setTitle:@"付款成功" forState:UIControlStateNormal];
        [_successBtn setTitleColor:DSColorFromHex(0x5AC72F) forState:UIControlStateNormal];
        
        [_successBtn setImage:[UIImage imageNamed:@"success_unlock"] forState:UIControlStateNormal];
        _successBtn.imageEdgeInsets =UIEdgeInsetsMake(0, 30, 0, 0);
        _successBtn.titleEdgeInsets = UIEdgeInsetsMake(120, -60, 0, 0);
        _successBtn.titleLabel.font = [UIFont boldSystemFontOfSize:24];
        [_successBtn addTarget:self action:@selector(pressSuccessBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _successBtn;
}

-(UIButton *)sureBtn{
    if (!_sureBtn) {
        _sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_sureBtn.layer setMasksToBounds:YES];
        [_sureBtn.layer setCornerRadius:20];
        
        [_sureBtn setTitle:@"确定" forState:UIControlStateNormal];
        _sureBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        [_sureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        [_sureBtn addTarget:self action:@selector(pressSureBtn) forControlEvents:UIControlEventTouchUpInside];
        _sureBtn.backgroundColor = DSColorFromHex(0x5AC72F);
    }
    return _sureBtn;
}
-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.text = @"感谢您使用e电车出行";
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textColor = DSColorFromHex(0x323232);
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}
- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self.view addSubview:self.successBtn];
     [self.view addSubview:self.xiuBtn];
    [self.view addSubview:self.sureBtn];
    [self.view addSubview:self.titleLabel];
    [self.successBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(45);
        make.centerX.equalTo(self.view);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.successBtn.mas_bottom).offset(69);
        make.centerX.equalTo(self.view);
    }];
    [self.sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(40);
        make.centerX.equalTo(self.view);
        make.width.mas_equalTo(180);
        make.height.mas_equalTo(40);
    }];
    [self.xiuBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).offset(-60);
        make.width.height.mas_equalTo(100);
        make.centerX.equalTo(self.view);
    }];
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
        self.title = @"行程结束";
    }
    return self;
}
-(void)pressSuccessBtn{
    
}
-(void)pressSureBtn{
    
}
-(void)pressxiuBtn{
    
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
