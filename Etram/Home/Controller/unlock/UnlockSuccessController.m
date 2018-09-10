//
//  UnlockSuccessController.m
//  Etram
//
//  Created by 燕来秋mac9 on 2018/9/10.
//  Copyright © 2018年 zhangshu. All rights reserved.
//

#import "UnlockSuccessController.h"
#import "UnlockView.h"

@interface UnlockSuccessController ()
@property(nonatomic,strong)UnlockView *lockView;
@property(nonatomic,strong)UIButton *successBtn;
@end

@implementation UnlockSuccessController
-(UnlockView *)lockView{
    if (!_lockView) {
        _lockView = [[UnlockView alloc]initWithFrame:CGRectMake(0, SCREENHEIGHT-400-[self navHeightWithHeight], SCREENWIDTH, 400)];
        _lockView.detailLabel.text = @"骑行结束后记得上锁，并再手机上结束行程";
    }
    return _lockView;
}
-(UIButton *)successBtn{
    if (!_successBtn) {
        _successBtn  = [UIButton buttonWithType:UIButtonTypeCustom];
        [_successBtn setTitle:@"解锁成功" forState:UIControlStateNormal];
        [_successBtn setTitleColor:DSColorFromHex(0x5AC72F) forState:UIControlStateNormal];
        
        [_successBtn setImage:[UIImage imageNamed:@"success_unlock"] forState:UIControlStateNormal];
        _successBtn.imageEdgeInsets =UIEdgeInsetsMake(0, 30, 0, 0);
        _successBtn.titleEdgeInsets = UIEdgeInsetsMake(120, -60, 0, 0);
        _successBtn.titleLabel.font = [UIFont boldSystemFontOfSize:24];
        [_successBtn addTarget:self action:@selector(pressSuccessBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _successBtn;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.lockView];
    [self.view addSubview:self.successBtn];
    [self.successBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(45);
        make.centerX.equalTo(self.view);
    }];
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.view.backgroundColor = [UIColor whiteColor];
        self.title = @"解锁密码";
    }
    return self;
}
-(void)pressSuccessBtn{
    
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
