//
//  TripDetailHeadView.m
//  Etram
//
//  Created by 燕来秋mac9 on 2018/9/10.
//  Copyright © 2018年 zhangshu. All rights reserved.
//

#import "TripDetailHeadView.h"

@implementation TripDetailHeadView

-(instancetype)init{
    self = [super init];
    if (self) {
        [self addSubview:self.moneyLabel];
        [self addSubview:self.distanceLabel];
        [self addSubview:self.dateLabel];
        [self addSubview:self.integralLabel];
        [self.moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self);
            make.centerX.equalTo(self);
        }];
        [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.moneyLabel.mas_bottom).offset(30);
            make.centerX.equalTo(self);
            make.width.mas_equalTo(SCREENWIDTH/3);
        }];
        [self.distanceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.moneyLabel.mas_bottom).offset(30);
            make.left.equalTo(self);
            make.width.mas_equalTo(SCREENWIDTH/3);
        }];
        [self.integralLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.moneyLabel.mas_bottom).offset(30);
            make.right.equalTo(self);
            make.width.mas_equalTo(SCREENWIDTH/3);
        }];
    }
    return self;
}
-(UILabel *)moneyLabel{
    if (!_moneyLabel) {
        _moneyLabel = [[UILabel alloc]init];
        _moneyLabel.text = @"共花费 8.00元";
        _moneyLabel.font = [UIFont systemFontOfSize:15];
        _moneyLabel.textColor = DSColorFromHex(0x323232);
        _moneyLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _moneyLabel;
}
-(UILabel *)distanceLabel{
    if (!_distanceLabel) {
        _distanceLabel = [[UILabel alloc]init];
        _distanceLabel.text = @"3.6 公里";
        _distanceLabel.font = [UIFont systemFontOfSize:15];
        _distanceLabel.textColor = DSColorFromHex(0x323232);
        _distanceLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _distanceLabel;
}
-(UILabel *)dateLabel{
    if (!_dateLabel) {
        _dateLabel = [[UILabel alloc]init];
        _dateLabel.text = @"26 分钟";
        _dateLabel.font = [UIFont systemFontOfSize:15];
        _dateLabel.textColor = DSColorFromHex(0x323232);
        _dateLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _dateLabel;
}
-(UILabel *)integralLabel{
    if (!_integralLabel) {
        _integralLabel = [[UILabel alloc]init];
        _integralLabel.text = @"50 积分";
        _integralLabel.font = [UIFont systemFontOfSize:15];
        _integralLabel.textColor = DSColorFromHex(0x323232);
        _integralLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _integralLabel;
}




@end
