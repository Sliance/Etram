//
//  ManuallyUnlockController.m
//  Etram
//
//  Created by 燕来秋mac9 on 2018/9/7.
//  Copyright © 2018年 zhangshu. All rights reserved.
//

#import "ManuallyUnlockController.h"
#import "SYBoxTextField.h"
#import "SettingController.h"
#import "UnlockingController.h"

@interface ManuallyUnlockController ()
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UIButton *lockBtn;
@property(nonatomic,strong)UIButton *helpBtn;
@end

@implementation ManuallyUnlockController
-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.text = @"请输入车辆编号";
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textColor = DSColorFromHex(0x323232);
        _titleLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _titleLabel;
}
-(UIButton *)helpBtn{
    if (!_helpBtn) {
        _helpBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_helpBtn setTitle:@"帮助" forState:UIControlStateNormal];
        [_helpBtn setTitleColor:DSColorFromHex(0x5AC72F) forState:UIControlStateNormal];
        _helpBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_helpBtn addTarget:self action:@selector(pressHelp) forControlEvents:UIControlEventTouchUpInside];
    }
    return _helpBtn;
}
-(UIButton *)lockBtn{
    if (!_lockBtn) {
        _lockBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_lockBtn.layer setMasksToBounds:YES];
        [_lockBtn.layer setCornerRadius:20];
        
        [_lockBtn setTitle:@"解锁" forState:UIControlStateNormal];
        _lockBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        [_lockBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        [_lockBtn addTarget:self action:@selector(pressUnlock) forControlEvents:UIControlEventTouchUpInside];
        _lockBtn.backgroundColor = DSColorFromHex(0x5AC72F);
    }
    return _lockBtn;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    SYBoxTextField *boxTextfield = [[SYBoxTextField alloc] init];
    boxTextfield.frame = CGRectMake((SCREENWIDTH-(43*6+10*6)-10)/2, 73, 43*6+10*6, 43);
    [boxTextfield boxInput:6 textEntry:NO editDone:^(NSString *text) {
        NSLog(@"text %@", text);
    }];
    [self.view addSubview:boxTextfield];
    boxTextfield.keyboardType = UIKeyboardTypeDefault;
    boxTextfield.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.lockBtn];
    [self.view addSubview:self.helpBtn];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(15);
        make.top.equalTo(self.view).offset(18);
    }];
    [self.lockBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(180);
        make.height.mas_equalTo(40);
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view);
    }];
    [self.helpBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.lockBtn.mas_bottom).offset(31);
    }];
    
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.view.backgroundColor = [UIColor whiteColor];
        self.title = @"手动解锁";
    }
    return self;
}

-(void)pressUnlock{
    UnlockingController *unlockVC = [[UnlockingController alloc]init];
    [self.navigationController pushViewController:unlockVC animated:YES];
}
-(void)pressHelp{
    SettingController *setVC = [[SettingController alloc]init];
    [self.navigationController pushViewController:setVC animated:YES];
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
