//
//  ServiceAlertView.m
//  Etram
//
//  Created by 燕来秋mac9 on 2018/9/7.
//  Copyright © 2018年 zhangshu. All rights reserved.
//

#import "ServiceAlertView.h"

@implementation ServiceAlertView



-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.yinView];
        [self addSubview:self.bgView];
        [self.bgView addSubview:self.titleLabel];
        [self.yinView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.equalTo(self);
            
        }];
        [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(310);
            make.height.mas_equalTo(240);
            make.centerX.equalTo(self);
            make.centerY.equalTo(self);
        }];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.bgView).offset(20);
            make.centerX.equalTo(self.bgView);
        }];
        NSArray * titleArr = @[@"车辆故障",@"举报违停",@"   车桩故障",@"其他问题"];
        NSArray * imageArr = @[@"Ctrouble_mine",@"fstop_mine",@"barrer_mine",@"other_mine"];
        for (int i = 0; i<titleArr.count; i++) {
            UIButton* cheBtn  = [UIButton buttonWithType:UIButtonTypeCustom];
            [cheBtn setTitle:titleArr[i] forState:UIControlStateNormal];
            [cheBtn setTitleColor:DSColorFromHex(0x323232) forState:UIControlStateNormal];
            cheBtn.frame = CGRectMake(i%2*155, 30+i/2*80, 310/2, 80);
            [cheBtn setImage:[UIImage imageNamed:imageArr[i]] forState:UIControlStateNormal];
            cheBtn.imageEdgeInsets =UIEdgeInsetsMake(30, 30, 0, 0);
            cheBtn.titleEdgeInsets = UIEdgeInsetsMake(100, -50, 0, 0);
            cheBtn.titleLabel.font = [UIFont systemFontOfSize:12];
            cheBtn.tag = 1000+i;
            [cheBtn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
            [self.bgView addSubview:cheBtn];
        }
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(presstap)];
        [self.yinView addGestureRecognizer:tap];
    }
    return self;
}
-(UIView *)yinView{
    if (!_yinView) {
        _yinView = [[UIView alloc]init];
        _yinView.backgroundColor = DSColorAlphaFromHex(0x000000, 0.3);
    }
    return _yinView;
}
-(UIView *)bgView{
    if (!_bgView) {
        _bgView = [[UIView alloc]init];
        _bgView.backgroundColor = [UIColor whiteColor];
        [_bgView.layer setCornerRadius:6];
    }
    return _bgView;
}
-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.text = @"客户服务";
        _titleLabel.font = [UIFont systemFontOfSize:12];
        _titleLabel.textColor = DSColorFromHex(0x969696);
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}


-(void)pressBtn:(UIButton *)sender{
    self.selectedBlock(sender.tag-1000);
}

-(void)presstap{
    self.tapBlock(100);
}


@end
