//
//  DetailMessageCell.m
//  Psf
//
//  Created by 燕来秋mac9 on 2018/7/4.
//  Copyright © 2018年 zhangshu. All rights reserved.
//

#import "DetailMessageCell.h"

@implementation DetailMessageCell

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
        
        [self addSubview:self.bgview];
        [self.bgview addSubview:self.titleLabel];
        [self.bgview addSubview:self.contentLabel];
        [self.bgview addSubview:self.rightImage];
        [self.bgview addSubview:self.topLabel];
        
        [self.bgview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(10);
            make.bottom.equalTo(self);
            make.left.equalTo(self).offset(15);
            make.right.equalTo(self).offset(-15);
        }];
        [self.rightImage mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.top.right.equalTo(self.bgview);
            make.height.mas_equalTo(150);
        }];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.rightImage.mas_bottom).offset(5);
            make.left.equalTo(self.bgview).offset(10);
            make.right.equalTo(self.bgview).offset(-80);
        }];
        [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLabel.mas_bottom).offset(5);
            make.left.equalTo(self.bgview).offset(10);
            make.right.equalTo(self.bgview).offset(-43);
        }];
        
        [self.topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.bgview).offset(-10);
            make.height.mas_equalTo(20);
            make.width.mas_equalTo(60);
            make.top.equalTo(self.rightImage.mas_bottom).offset(10);
        }];
    }
    return self;
}
-(UIImageView *)rightImage{
    if (!_rightImage) {
        _rightImage = [[UIImageView alloc]init];
        _rightImage.backgroundColor = DSColorFromHex(0xDCDCDC);
        [_rightImage.layer setMasksToBounds:YES];
        [_rightImage.layer setCornerRadius:2];
    }
    return _rightImage;
}
-(UILabel *)topLabel{
    if (!_topLabel) {
        _topLabel = [[UILabel alloc]init];
        _topLabel.textAlignment = NSTextAlignmentCenter;
        _topLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:12];
        _topLabel.textColor = [UIColor whiteColor];
        _topLabel.text = @"进行中";
        _topLabel.backgroundColor = DSColorFromHex(0x5AC72F);
        [_topLabel.layer setMasksToBounds:YES];
        [_topLabel.layer setCornerRadius:2];
    }
    return _topLabel;
}
-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:15];
        _titleLabel.textColor = DSColorFromHex(0x323232);
        _titleLabel.text = @"";
    }
    return _titleLabel;
}
-(UILabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc]init];
        _contentLabel.textAlignment = NSTextAlignmentLeft;
        _contentLabel.font = [UIFont fontWithName:@"PingFang-SC-Regular" size:12];
        _contentLabel.textColor = DSColorFromHex(0x969696);
        _contentLabel.text = @"";
        
    }
    return _contentLabel;
}
-(UIView *)bgview{
    if (!_bgview) {
        _bgview = [[UIView alloc]init];
        _bgview.backgroundColor = [UIColor whiteColor];
        [_bgview.layer setMasksToBounds:YES];
        [_bgview.layer setCornerRadius:5];
        [_bgview.layer setBorderColor:DSColorFromHex(0xDCDCDC).CGColor];
        [_bgview.layer setBorderWidth:1];
        
    }
    return _bgview;
}
-(void)setModel:(MineMessageListRes *)model{
    _model = model;
    [_rightImage sd_setImageWithURL:[NSURL URLWithString:model.memberActivityMessageImage]placeholderImage:[UIImage imageNamed:@""]];
    self.titleLabel.text = model.memberActivityMessageTitle;
    self.contentLabel.text = model.memberActivityMessageContent;
}
@end
