//
//  AccountRulesController.m
//  Etram
//
//  Created by 燕来秋mac9 on 2018/9/10.
//  Copyright © 2018年 zhangshu. All rights reserved.
//

#import "AccountRulesController.h"
#import "UILabel+String.h"

@interface AccountRulesController ()<UIScrollViewDelegate>
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UILabel *detailLabel;
@property(nonatomic,strong)UILabel *oneLabel;
@property(nonatomic,strong)UILabel *dOneLabel;
@property(nonatomic,strong)UILabel *twoLabel;
@property(nonatomic,strong)UILabel *dtwoLabel;
@property(nonatomic,strong)UILabel *threeLabel;
@property(nonatomic,strong)UILabel *dThreeLabel;



@end

@implementation AccountRulesController

-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.text = @"米加e电车计费规则";
        _titleLabel.font = [UIFont boldSystemFontOfSize:18];
        _titleLabel.textColor = DSColorFromHex(0x323232);
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        
    }
    return _titleLabel;
}
-(UILabel *)detailLabel{
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc]init];
        [_detailLabel setText:@"在无另行发布的促销或优惠活动的情况下，米加公司依据用车时间进行计费。" lineSpacing:5];
        _detailLabel.font = [UIFont systemFontOfSize:15];
        _detailLabel.textColor = DSColorFromHex(0x323232);
        _detailLabel.textAlignment = NSTextAlignmentLeft;
        _detailLabel.numberOfLines =0;
    }
    return _detailLabel;
}
-(UILabel *)oneLabel{
    if (!_oneLabel) {
        _oneLabel = [[UILabel alloc]init];
        _oneLabel.text = @"一、起步计费";
        _oneLabel.font = [UIFont boldSystemFontOfSize:15];
        _oneLabel.textColor = DSColorFromHex(0x323232);
        _oneLabel.textAlignment = NSTextAlignmentLeft;
        
    }
    return _oneLabel;
}
-(UILabel *)dOneLabel{
    if (!_dOneLabel) {
        _dOneLabel = [[UILabel alloc]init];
        [_dOneLabel setText: @"车辆出桩开始计时，租车内2分钟不收取费用，2分钟后开始计费。每1小时计费2元，不足1小时的按1小时计算。*每1小时计价1次。例：用户租车2分钟内归还车辆，不收取任何费用；用户租车2-60分钟，收取2元费用；用户租车1小时1分钟，收取4元费用，以此类推。" lineSpacing:5];
        _dOneLabel.font = [UIFont systemFontOfSize:15];
        _dOneLabel.textColor = DSColorFromHex(0x323232);
        _dOneLabel.textAlignment = NSTextAlignmentLeft;
        _dOneLabel.numberOfLines =0;
    }
    return _dOneLabel;
}
-(UILabel *)twoLabel{
    if (!_twoLabel) {
        _twoLabel = [[UILabel alloc]init];
        _twoLabel.text = @"二、封顶计费";
        _twoLabel.font = [UIFont boldSystemFontOfSize:15];
        _twoLabel.textColor = DSColorFromHex(0x323232);
        _twoLabel.textAlignment = NSTextAlignmentLeft;
        
    }
    return _twoLabel;
}
-(UILabel *)dtwoLabel{
    if (!_dtwoLabel) {
        _dtwoLabel = [[UILabel alloc]init];
        [_dtwoLabel setText:@"24小时内，连续租车时间超过15小时，封顶30元。例：用户租车14小时59分，收取30元租车费用；用户租车23小时59分，依旧收取30元租车费用（当日封顶范围内）。" lineSpacing:5];
        _dtwoLabel.font = [UIFont systemFontOfSize:15];
        _dtwoLabel.textColor = DSColorFromHex(0x323232);
        _dtwoLabel.textAlignment = NSTextAlignmentLeft;
        _dtwoLabel.numberOfLines =0;
    }
    return _dtwoLabel;
}
-(UILabel *)threeLabel{
    if (!_threeLabel) {
        _threeLabel = [[UILabel alloc]init];
        _threeLabel.text = @"三、超过24小时";
        _threeLabel.font = [UIFont boldSystemFontOfSize:15];
        _threeLabel.textColor = DSColorFromHex(0x323232);
        _threeLabel.textAlignment = NSTextAlignmentLeft;
        
    }
    return _threeLabel;
}
-(UILabel *)dThreeLabel{
    if (!_dThreeLabel) {
        _dThreeLabel = [[UILabel alloc]init];
        [_dThreeLabel setText: @"连续租车超过24小时，自动计算前24小时租车费用为30元，24小时后重新起步，开始计费。例：用户租车24小时1分，收取租车费用32（30+2）元；用户租车38小时59分，收取租车费用60（30+30）元；用户租车47小时59分，收取租车费用60元（30+30，封顶范围内）；以此类推。" lineSpacing:5];
        _dThreeLabel.font = [UIFont systemFontOfSize:15];
        _dThreeLabel.textColor = DSColorFromHex(0x323232);
        _dThreeLabel.textAlignment = NSTextAlignmentLeft;
        _dThreeLabel.numberOfLines =0;
    }
    return _dThreeLabel;
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.bgscrollow layoutIfNeeded];
     UIScrollView* bgscrollow = [[UIScrollView alloc]init];
    bgscrollow.delegate = self;
      bgscrollow.showsVerticalScrollIndicator =NO;
    [self.view addSubview:bgscrollow];
    

   
    [bgscrollow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    UIView * containerView = [[UIView alloc]init];
    [bgscrollow addSubview:containerView];
    [containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(bgscrollow);
        
        make.width.height.equalTo(bgscrollow);///特别重要
    }];
        [containerView addSubview:self.titleLabel];
        [containerView addSubview:self.detailLabel];
        [containerView addSubview:self.oneLabel];
        [containerView addSubview:self.dOneLabel];
        [containerView addSubview:self.twoLabel];
        [containerView addSubview:self.dtwoLabel];
        [containerView addSubview:self.threeLabel];
        [containerView addSubview:self.dThreeLabel];
  
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(containerView).offset(15);
        make.centerX.equalTo(containerView);
    }];
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(15);
        make.left.equalTo(containerView).offset(10);
        make.right.equalTo(containerView).offset(-10);
    }];
    [self.oneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.detailLabel.mas_bottom).offset(15);
        make.left.equalTo(containerView).offset(10);
        make.right.equalTo(containerView).offset(-10);
    }];
    [self.dOneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.oneLabel.mas_bottom).offset(15);
        make.left.equalTo(containerView).offset(10);
        make.right.equalTo(containerView).offset(-10);
    }];
    [self.twoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.dOneLabel.mas_bottom).offset(15);
        make.left.equalTo(containerView).offset(10);
        make.right.equalTo(containerView).offset(-10);
    }];
    [self.dtwoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.twoLabel.mas_bottom).offset(15);
        make.left.equalTo(containerView).offset(10);
        make.right.equalTo(containerView).offset(-10);
    }];
    [self.threeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.dtwoLabel.mas_bottom).offset(15);
        make.left.equalTo(containerView).offset(10);
        make.right.equalTo(containerView).offset(-10);
    }];
    [self.dThreeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.threeLabel.mas_bottom).offset(15);
        make.left.equalTo(containerView).offset(10);
        make.right.equalTo(containerView).offset(-10);
    }];

    
}
-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self setTitle:@"计费规则"];
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
