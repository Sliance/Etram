//
//  AboutController.m
//  Etram
//
//  Created by 燕来秋mac9 on 2018/9/10.
//  Copyright © 2018年 zhangshu. All rights reserved.
//

#import "AboutController.h"

@interface AboutController ()
@property(nonatomic,strong)UIImageView *headImage;
@property(nonatomic,strong)UILabel *visonLabel;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UILabel *detailLabel;
@end

@implementation AboutController
-(UIImageView *)headImage{
    if (!_headImage) {
        _headImage = [[UIImageView alloc]init];
        _headImage.image = [UIImage imageNamed:@"icon_about"];
    }
    return _headImage;
}
-(UILabel *)visonLabel{
    if (!_visonLabel) {
        _visonLabel = [[UILabel alloc]init];
        _visonLabel.text = @"e电车 1.0.0";
        _visonLabel.font = [UIFont systemFontOfSize:12];
        _visonLabel.textColor = DSColorFromHex(0x454545);
        _visonLabel.textAlignment = NSTextAlignmentCenter;
        
    }
    return _visonLabel;
}
-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.text = @"e电车 版权所有";
        _titleLabel.font = [UIFont systemFontOfSize:10];
        _titleLabel.textColor = DSColorFromHex(0x454545);
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        
    }
    return _titleLabel;
}
-(UILabel *)detailLabel{
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc]init];
        _detailLabel.text = @"Copyright © 2017-2018 e-bike.All Rights Reserved";
        _detailLabel.font = [UIFont systemFontOfSize:10];
        _detailLabel.textColor = DSColorFromHex(0x454545);
        _detailLabel.textAlignment = NSTextAlignmentCenter;
        
    }
    return _detailLabel;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.headImage];
    [self.view addSubview:self.visonLabel];
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.detailLabel];
    [self.headImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(95);
        make.centerX.equalTo(self.view);
        make.width.height.mas_equalTo(80);
    }];
    [self.visonLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headImage.mas_bottom).offset(10);
        make.centerX.equalTo(self.view);
        
    }];
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).offset(-30);
        make.centerX.equalTo(self.view);
        
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.detailLabel.mas_top).offset(-5);
        make.centerX.equalTo(self.view);
        
    }];
    
}
-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self setTitle:@"关于我们"];
    }
    return self;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
