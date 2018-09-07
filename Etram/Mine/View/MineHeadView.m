//
//  MineHeadView.m
//  Psf
//
//  Created by 燕来秋mac9 on 2018/6/20.
//  Copyright © 2018年 zhangshu. All rights reserved.
//

#import "MineHeadView.h"

@implementation MineHeadView

-(UIButton *)headbtn{
    if (!_headbtn) {
        _headbtn = [[UIButton alloc]init];
        [_headbtn.layer setMasksToBounds:YES];
        [_headbtn.layer setCornerRadius:35];
        [_headbtn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
        [_headbtn setBackgroundImage:[UIImage imageNamed:@"head_mine"] forState:UIControlStateNormal];
    }
    return _headbtn;
}
-(UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        _nameLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:15];
        _nameLabel.textColor = DSColorFromHex(0x323232);
        _nameLabel.text = @"158****7642";
    }
    return _nameLabel;
}
-(UILabel *)numLabel{
    if (!_numLabel) {
        _numLabel = [[UILabel alloc]init];
        _numLabel.textAlignment = NSTextAlignmentCenter;
        _numLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:12];
        [_numLabel.layer setCornerRadius:11];
        [_numLabel.layer setMasksToBounds:YES];
        _numLabel.textColor = [UIColor whiteColor];
        _numLabel.text = @"3123积分";
        _numLabel.backgroundColor = DSColorFromHex(0x5AC72F);
    }
    return _numLabel;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = DSColorFromHex(0xF8FFF5);
        [self setcornerLayout];
    }
    return self;
}
-(void)setcornerLayout{
    [self addSubview:self.headbtn];
    [self addSubview:self.nameLabel];
    [self addSubview:self.numLabel];
    [self.numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.equalTo(self).offset(-24);
        make.width.mas_equalTo(75);
        make.height.mas_equalTo(21);
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.bottom.equalTo(self.numLabel.mas_top).offset(-10);
        
    }];
    [self.headbtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.equalTo(self.nameLabel.mas_top).offset(-10);
        make.width.height.mas_equalTo(75);
        
    }];
   
    
}
-(void)pressBtn:(UIButton*)sender{
    self.skipBlock(1);
}

//-(void)setResult:(MineInformationReq *)result{
//    _result = result;
//    UIImageView *image = [[UIImageView alloc]init];
//    if (result.memberAvatarPath.length>0) {
//        [self.headbtn setBackgroundImageWithURL:[NSURL URLWithString:result.memberAvatarPath] forState:UIControlStateNormal options:YYWebImageOptionAllowBackgroundTask];
//    }else{
//         [_headbtn setBackgroundImage:[UIImage imageNamed:@"mine_avater_70"] forState:UIControlStateNormal];
//    }
//    [image sd_setImageWithURL:[NSURL URLWithString:result.memberAvatarPath]];
//    
//    if([UserCacheBean share].userInfo.token.length<1){
//        self.nameLabel.text = @"登录/注册";
//        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tologin)];
//        self.nameLabel.userInteractionEnabled = YES;
//        [self.nameLabel addGestureRecognizer:tap];
//    }else{
//       self.nameLabel.text = result.memberNickName;
//    }
//}
-(void)tologin{
    self.tologinBlock();
}
@end
