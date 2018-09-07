//
//  InviteFriendsController.m
//  Etram
//
//  Created by 燕来秋mac9 on 2018/9/7.
//  Copyright © 2018年 zhangshu. All rights reserved.
//

#import "InviteFriendsController.h"

@interface InviteFriendsController ()
@property(nonatomic,strong)UIImageView *headImage;
@property(nonatomic,strong)UILabel *inviteLabel;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UILabel *contentLabel;
@property(nonatomic,strong)UIButton *detailBtn;
@property(nonatomic,strong)UIButton *inviteBtn;

@end

@implementation InviteFriendsController
-(UIImageView *)headImage{
    if (!_headImage) {
        _headImage = [[UIImageView alloc]init];
        _headImage.image = [UIImage imageNamed:@"yaoqing_icon"];
        [_headImage.layer setCornerRadius:5];
        [_headImage.layer setMasksToBounds:YES];
    }
    return _headImage;
}
-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:15];
        _titleLabel.textColor = DSColorFromHex(0x333333);
        _titleLabel.text = @"·邀请好友享优惠，得7天免费骑";
    }
    return _titleLabel;
}
-(UILabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc]init];
        _contentLabel.textAlignment = NSTextAlignmentLeft;
        _contentLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:15];
        _contentLabel.textColor = DSColorFromHex(0x979797);
        _contentLabel.text = @"·好友获得5天免费用车券";
    }
    return _contentLabel;
}
-(UILabel *)inviteLabel{
    if (!_inviteLabel) {
        _inviteLabel = [[UILabel alloc]init];
        _inviteLabel.textAlignment = NSTextAlignmentCenter;
        _inviteLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:15];
        _inviteLabel.textColor = DSColorFromHex(0x979797);
        _inviteLabel.text = @"已成功邀请3人";
    }
    return _inviteLabel;
}
-(UIButton *)detailBtn{
    if (!_detailBtn) {
        _detailBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_detailBtn setTitleColor:DSColorFromHex(0x5AC72F) forState:UIControlStateNormal];
        [_detailBtn setTitle:@"活动规则详情" forState:UIControlStateNormal];
        _detailBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_detailBtn addTarget:self action:@selector(pressDetail) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
    return _detailBtn;
}
-(UIButton *)inviteBtn{
    if (!_inviteBtn) {
        _inviteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_inviteBtn.layer setMasksToBounds:YES];
        [_inviteBtn.layer setCornerRadius:20];
        
        [_inviteBtn setTitle:@"邀请好友" forState:UIControlStateNormal];
        _inviteBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        [_inviteBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        [_inviteBtn addTarget:self action:@selector(pressInvite) forControlEvents:UIControlEventTouchUpInside];
        _inviteBtn.backgroundColor = DSColorFromHex(0x5AC72F);
    }
    return _inviteBtn;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.headImage];
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.contentLabel];
    [self.view addSubview:self.detailBtn];
    [self.view addSubview:self.inviteBtn];
    [self.view addSubview:self.inviteLabel];
    [self.headImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(15);
        make.top.equalTo(self.view).offset(15);
        make.right.equalTo(self.view).offset(-15);
        make.height.mas_equalTo(155);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(27);
        make.top.equalTo(self.headImage.mas_bottom).offset(15);
    }];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(27);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(15);
    }];
    [self.detailBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(30);
        make.top.equalTo(self.contentLabel.mas_bottom).offset(15);
    }];
    [self.inviteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(180);
        make.height.mas_equalTo(40);
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-30);
    }];
    [self.inviteLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.inviteBtn.mas_top).offset(-15);
    }];
}

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.backgroundColor = [UIColor whiteColor];
        [self setTitle:@"邀请好友"];
    }
    return self;
}
-(void)pressDetail{
    
}
-(void)pressInvite{
    
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
