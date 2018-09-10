//
//  UnlockView.m
//  Etram
//
//  Created by 燕来秋mac9 on 2018/9/10.
//  Copyright © 2018年 zhangshu. All rights reserved.
//

#import "UnlockView.h"

@implementation UnlockView

-(UIButton *)xiuBtn{
    if (!_xiuBtn) {
        _xiuBtn  = [UIButton buttonWithType:UIButtonTypeCustom];
        [_xiuBtn setTitle:@"立即保修" forState:UIControlStateNormal];
        [_xiuBtn setTitleColor:DSColorFromHex(0x323232) forState:UIControlStateNormal];
        
        [_xiuBtn setImage:[UIImage imageNamed:@"xiu_unlock"] forState:UIControlStateNormal];
        _xiuBtn.imageEdgeInsets =UIEdgeInsetsMake(0, 20, 0, 0);
        _xiuBtn.titleEdgeInsets = UIEdgeInsetsMake(100, -50, 0, 0);
        _xiuBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [_xiuBtn addTarget:self action:@selector(pressBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _xiuBtn;
}
-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.text = @"车牌号128765解锁密码：";
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textColor = DSColorFromHex(0x323232);
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}
-(UILabel *)countLabel{
    if (!_countLabel) {
        _countLabel = [[UILabel alloc]init];
        _countLabel.text = @"8808";
        _countLabel.font = [UIFont boldSystemFontOfSize:30];
        _countLabel.textColor = DSColorFromHex(0x323232);
        _countLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _countLabel;
}
-(UILabel *)detailLabel{
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc]init];
        _detailLabel.text = @"请您尽快开锁，若发现故障，点击下方立即报修按钮";
        _detailLabel.font = [UIFont systemFontOfSize:12];
        _detailLabel.textColor = DSColorFromHex(0x969696);
        _detailLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _detailLabel;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview: self.titleLabel];
        [self addSubview:self.countLabel];
        [self addSubview:self.detailLabel];
        [self addSubview:self.xiuBtn];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(17);
            make.centerX.equalTo(self);
        }];
        [self.countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLabel.mas_bottom).offset(20);
            make.centerX.equalTo(self);
        }];
        [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.countLabel.mas_bottom).offset(20);
            make.centerX.equalTo(self);
        }];
        [self.xiuBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self).offset(-60);
            make.width.height.mas_equalTo(100);
            make.centerX.equalTo(self);
        }];
    }
    return self;
}
-(void)pressBtn{
    
}
@end
