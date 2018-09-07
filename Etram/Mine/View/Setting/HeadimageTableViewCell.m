//
//  HeadimageTableViewCell.m
//  Psf
//
//  Created by 燕来秋mac9 on 2018/6/26.
//  Copyright © 2018年 zhangshu. All rights reserved.
//

#import "HeadimageTableViewCell.h"

@implementation HeadimageTableViewCell

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
        [self addSubview:self.titleLabel];
        [self addSubview:self.headImage];
        [self addSubview:self.detailLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(20);
            make.top.equalTo(self).offset(29);
        }];
        [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(20);
            make.top.equalTo(self.titleLabel.mas_bottom).offset(10);
        }];
        [self.headImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-15);
            make.centerY.equalTo(self);
            make.width.height.mas_equalTo(60);
        }];

    }
    return self;
}
-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont boldSystemFontOfSize:18];
        _titleLabel.textColor = DSColorFromHex(0x323232);
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.text = @"157****6822";
    }
    return _titleLabel;
}
-(UILabel *)detailLabel{
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc]init];
        _detailLabel.font = [UIFont systemFontOfSize:15];
        _detailLabel.textColor = DSColorFromHex(0x323232);
        _detailLabel.textAlignment = NSTextAlignmentLeft;
        _detailLabel.text = @"积分 3462";
    }
    return _detailLabel;
}
-(UIImageView *)headImage{
    if (!_headImage) {
        _headImage = [[UIImageView alloc]init];
        [_headImage.layer setMasksToBounds:YES];
        [_headImage.layer setCornerRadius:30];
        [_headImage setImage:[UIImage imageNamed:@"head_mine"]];
    }
    return _headImage;
}

//-(void)setResult:(MineInformationReq *)result{
//    _result = result;
//    
//    [_headImage sd_setImageWithURL:[NSURL URLWithString:result.memberAvatarPath]placeholderImage:[UIImage imageNamed:@"mine_avater_55"]];
//    
//}
@end
