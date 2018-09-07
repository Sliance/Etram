//
//  TripHeadView.m
//  Etram
//
//  Created by 燕来秋mac9 on 2018/9/6.
//  Copyright © 2018年 zhangshu. All rights reserved.
//

#import "TripHeadView.h"

@implementation TripHeadView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
         [self addSubview:self.titleLabel];
         [self addSubview:self.detailLabel];
         [self addSubview:self.huiLabel];
         [self addSubview:self.yearLabel];
         [self addSubview:self.leftLine];
         [self addSubview:self.rightLine];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(20);
            make.top.equalTo(self).offset(23);
        }];
        [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(20);
            make.top.equalTo(self.titleLabel.mas_bottom).offset(10);
        }];
        [self.huiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(20);
            make.right.equalTo(self).offset(-20);
            make.height.mas_equalTo(30);
            make.top.equalTo(self.detailLabel.mas_bottom).offset(15);
        }];
        
        [self.yearLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.width.mas_equalTo(75);
            make.top.equalTo(self.huiLabel.mas_bottom).offset(30);
        }];
        [self.leftLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(20);
            make.centerY.equalTo(self.yearLabel);
            make.right.equalTo(self.yearLabel.mas_left);
            make.height.mas_equalTo(0.5);
        }];
        [self.rightLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-20);
            make.centerY.equalTo(self.yearLabel);
            make.left.equalTo(self.yearLabel.mas_right);
            make.height.mas_equalTo(0.5);
        }];
    }
    return self;
}
-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.text = @"您骑行了";
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.textColor = DSColorFromHex(0x323232);
        _titleLabel.font = [UIFont systemFontOfSize:15];
    }
    return _titleLabel;
}
-(UILabel *)detailLabel{
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc]init];
        _detailLabel.text = @"26.5公里";
        _detailLabel.textAlignment = NSTextAlignmentLeft;
        _detailLabel.textColor = DSColorFromHex(0x323232);
        _detailLabel.font = [UIFont boldSystemFontOfSize:24];
    }
    return _detailLabel;
}
-(UILabel *)huiLabel{
    if (!_huiLabel) {
        _huiLabel = [[UILabel alloc]init];
        _huiLabel.text = @"  再骑行 5 公里享优惠 ！";
        _huiLabel.textAlignment = NSTextAlignmentLeft;
        _huiLabel.textColor = DSColorFromHex(0x5AC72F);
        _huiLabel.font = [UIFont systemFontOfSize:14];
        _huiLabel.backgroundColor = DSColorFromHex(0xE3F5DC);
    }
    return _huiLabel;
}

-(UILabel *)yearLabel{
    if (!_yearLabel) {
        _yearLabel = [[UILabel alloc]init];
        _yearLabel.text = @"2018";
        _yearLabel.textAlignment = NSTextAlignmentCenter;
        _yearLabel.textColor = DSColorFromHex(0xDDDDDD);
        _yearLabel.font = [UIFont systemFontOfSize:12];
    }
    return _yearLabel;
}
-(UILabel *)leftLine{
    if (!_leftLine) {
        _leftLine = [[UILabel alloc]init];
        _leftLine.backgroundColor = DSColorFromHex(0xDCDCDC);
    }
    return _leftLine;
}

-(UILabel *)rightLine{
    if (!_rightLine) {
        _rightLine = [[UILabel alloc]init];
        _rightLine.backgroundColor = DSColorFromHex(0xDCDCDC);
    }
    return _rightLine;
}
@end
