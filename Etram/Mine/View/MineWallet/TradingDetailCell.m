//
//  TradingDetailCell.m
//  Psf
//
//  Created by 燕来秋mac9 on 2018/7/2.
//  Copyright © 2018年 zhangshu. All rights reserved.
//

#import "TradingDetailCell.h"

@implementation TradingDetailCell

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
        [self setcornerLayout];
    }
    return self;
}
-(void)setcornerLayout{
    [self addSubview:self.priceLabel];
    [self addSubview:self.titleLabel];
    [self addSubview:self.contentLabel];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(15);
        make.top.equalTo(self).offset(20);
    }];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(15);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(10);
    }];
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-16);
        make.centerY.equalTo(self);
    }];
    
}
-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont boldSystemFontOfSize:15];
        _titleLabel.textColor = DSColorFromHex(0x323232);
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.text = @"";
    }
    return _titleLabel;
}
-(UILabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc]init];
        _contentLabel.font = [UIFont systemFontOfSize:12];
        _contentLabel.textColor = DSColorFromHex(0x979797);
        _contentLabel.textAlignment = NSTextAlignmentLeft;
        _contentLabel.text = @"";
    }
    return _contentLabel;
}
-(UILabel *)priceLabel{
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc]init];
        _priceLabel.font = [UIFont boldSystemFontOfSize: 18];
        _priceLabel.textColor = DSColorFromHex(0x5AC72F);
        _priceLabel.textAlignment = NSTextAlignmentLeft;
        _priceLabel.text = @"";
    }
    return _priceLabel;
}
-(void)setType:(NSInteger)type{
    _type = type;
}
-(void)setModel:(IntegralRecord *)model{
    self.titleLabel.text = model.transactionType;
    self.priceLabel.text = model.moneyChange;
    self.contentLabel.text = model.systemUpdateTime;
    
}
@end
