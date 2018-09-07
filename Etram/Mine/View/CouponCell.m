//
//  CouponCell.m
//  Etram
//
//  Created by 燕来秋mac9 on 2018/9/7.
//  Copyright © 2018年 zhangshu. All rights reserved.
//

#import "CouponCell.h"

@implementation CouponCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = DSColorFromHex(0xF0F0F0);
        [self addSubview:self.bgimage];
        [self.bgimage addSubview:self.nameLabel];
        [self.bgimage addSubview:self.detailLabel];
        [self.bgimage addSubview:self.titleLabel];
        [self.bgimage addSubview:self.contentLabel];
        [self.bgimage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(15);
            make.top.equalTo(self);
            make.right.equalTo(self).offset(-15);
            make.height.mas_equalTo(130);
        }];
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.bgimage).offset(26);
            make.top.equalTo(self.bgimage).offset(37);
            
        }];
        [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.bgimage).offset(26);
            make.top.equalTo(self.nameLabel.mas_bottom).offset(5);
            
        }];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.bgimage).offset(121);
            make.right.equalTo(self.bgimage);
            make.top.equalTo(self.bgimage).offset(35);
            
        }];
        [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.equalTo(self.titleLabel);
            make.top.equalTo(self.titleLabel.mas_bottom).offset(5);
            
        }];
    }
    return self;
}
-(UIImageView *)bgimage{
    if (!_bgimage) {
        _bgimage = [[UIImageView alloc]init];
        _bgimage.image = [UIImage imageNamed:@"coupon_bg"];
    }
    return _bgimage;
}
-(UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.text = @"骑行";
        _nameLabel.font = [UIFont systemFontOfSize:15];
        _nameLabel.textColor = [UIColor whiteColor];
        _nameLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _nameLabel;
}
-(UILabel *)detailLabel{
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc]init];
        _detailLabel.text = @"20公里";
        _detailLabel.font = [UIFont boldSystemFontOfSize:24];
        _detailLabel.textColor = [UIColor whiteColor];
        _detailLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _detailLabel;
}
-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.text = @"8折优惠券";
        _titleLabel.font = [UIFont boldSystemFontOfSize:30];
        _titleLabel.textColor = DSColorFromHex(0xAAD799);
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}
-(UILabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc]init];
        _contentLabel.text = @"有效期：2018.01.14-2018.02.13";
        _contentLabel.font = [UIFont systemFontOfSize:12];
        _contentLabel.textColor = DSColorFromHex(0xAAD799);
        _contentLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _contentLabel;
}





@end
