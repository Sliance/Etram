//
//  LockPaytypeController.m
//  Etram
//
//  Created by 燕来秋mac9 on 2018/9/6.
//  Copyright © 2018年 zhangshu. All rights reserved.
//

#import "LockPaytypeController.h"
#import "ScanQrCodeController.h"
#import "ManuallyUnlockController.h"

@interface LockPaytypeController ()
@property (strong, nonatomic) UIButton *codeBtn;
@property (strong, nonatomic) UIButton *inputBtn;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *contentLabel;
@end

@implementation LockPaytypeController
-(UIButton *)codeBtn{
    if (!_codeBtn) {
        _codeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_codeBtn.layer setMasksToBounds:YES];
        [_codeBtn.layer setCornerRadius:20];
        
        [_codeBtn setTitle:@"扫码骑车" forState:UIControlStateNormal];
        _codeBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        [_codeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
       
        [_codeBtn addTarget:self action:@selector(pressCodeBtn) forControlEvents:UIControlEventTouchUpInside];
        _codeBtn.backgroundColor = DSColorFromHex(0x5AC72F);
    }
    return _codeBtn;
}
-(UIButton *)inputBtn{
    if (!_inputBtn) {
        _inputBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_inputBtn.layer setMasksToBounds:YES];
        [_inputBtn.layer setCornerRadius:20];
        
        [_inputBtn setTitle:@"手动输入车牌号" forState:UIControlStateNormal];
        _inputBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        [_inputBtn setTitleColor:DSColorFromHex(0x656565) forState:UIControlStateNormal];
        [_inputBtn addTarget:self action:@selector(pressInputBtn) forControlEvents:UIControlEventTouchUpInside];
        _inputBtn.backgroundColor = [UIColor whiteColor];
        [_inputBtn.layer setBorderWidth:1];
        [_inputBtn.layer setBorderColor:DSColorFromHex(0xB4B4B4).CGColor];
    }
    return _inputBtn;
}
-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.textColor = DSColorFromHex(0x323232);
        _titleLabel.font = [UIFont boldSystemFontOfSize:18];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.text = @"欢迎使用e电车";
    }
    return _titleLabel;
}
-(UILabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc]init];
        _contentLabel.textColor = DSColorFromHex(0x323232);
        _contentLabel.font = [UIFont systemFontOfSize:15];
        _contentLabel.textAlignment = NSTextAlignmentCenter;
        _contentLabel.text = @"请规范用车，骑行中不要关闭小程序";
    }
    return _contentLabel;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.inputBtn];
    [self.view addSubview:self.codeBtn];
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.contentLabel];
    [self.inputBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(180);
        make.height.mas_equalTo(40);
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view);
    }];
    [self.codeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(180);
        make.height.mas_equalTo(40);
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(self.inputBtn.mas_top).offset(-30);
    }];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
         make.bottom.equalTo(self.codeBtn.mas_top).offset(-64);
         make.left.right.equalTo(self.view);
        
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentLabel.mas_top).offset(-30);
        make.left.right.equalTo(self.view);
        
    }];
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.view.backgroundColor = [UIColor whiteColor];
        self.title = @"请选择开锁方式";
    }
    return self;
}
-(void)pressInputBtn{
    ManuallyUnlockController *manVC = [[ManuallyUnlockController alloc]init];
    [self.navigationController pushViewController:manVC animated:YES];
}
-(void)pressCodeBtn{
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    ScanQrCodeController *qrVC = [story instantiateViewControllerWithIdentifier:@"ScanQrCodeController"];
    
    [self.navigationController pushViewController:qrVC animated:YES];
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
