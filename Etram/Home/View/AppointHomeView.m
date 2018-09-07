//
//  AppointHomeView.m
//  Etram
//
//  Created by 燕来秋mac9 on 2018/9/7.
//  Copyright © 2018年 zhangshu. All rights reserved.
//

#import "AppointHomeView.h"

@implementation AppointHomeView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.titleLabel];
        [self addSubview:self.appointBtn];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(15);
            make.centerY.equalTo(self);
            
        }];
        [self.appointBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-15);
            make.centerY.equalTo(self);
            make.width.mas_equalTo(80);
            make.height.mas_equalTo(23);
        }];
    }
    return self;
}
-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.text = @"费用：半小时1元";
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textColor = DSColorFromHex(0x323232);
        _titleLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _titleLabel;
}
-(UIButton *)appointBtn{
    if (!_appointBtn) {
        _appointBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_appointBtn.layer setMasksToBounds:YES];
        [_appointBtn.layer setCornerRadius:12];
        
        [_appointBtn setTitle:@"预约用车" forState:UIControlStateNormal];
        _appointBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [_appointBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        [_appointBtn addTarget:self action:@selector(pressAppoint) forControlEvents:UIControlEventTouchUpInside];
        _appointBtn.backgroundColor = DSColorFromHex(0x5AC72F);
    }
    return _appointBtn;
}
-(void)pressAppoint{
    
}
@end
