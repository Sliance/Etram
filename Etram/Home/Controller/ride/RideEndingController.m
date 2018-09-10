//
//  RideEndingController.m
//  Etram
//
//  Created by 燕来秋mac9 on 2018/9/10.
//  Copyright © 2018年 zhangshu. All rights reserved.
//

#import "RideEndingController.h"
#import "PaySuccessController.h"

@interface RideEndingController ()
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UILabel *dateLabel;
@property(nonatomic,strong)UILabel *detailLabel;
@property(nonatomic,strong)UILabel *contentLabel;
@end

@implementation RideEndingController
-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.text = @"订单结束中…";
        _titleLabel.font = [UIFont boldSystemFontOfSize:21];
        _titleLabel.textColor = DSColorFromHex(0x5AC72F);
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}
-(UILabel *)dateLabel{
    if (!_dateLabel) {
        _dateLabel = [[UILabel alloc]init];
        _dateLabel.text = @"00:30";
        _dateLabel.font = [UIFont systemFontOfSize:18];
        _dateLabel.textColor = DSColorFromHex(0x5AC72F);
        _dateLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _dateLabel;
}
-(UILabel *)detailLabel{
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc]init];
        _detailLabel.text = @"结束订单会有稍许延迟，请耐心等待";
        _detailLabel.font = [UIFont systemFontOfSize:15];
        _detailLabel.textColor = DSColorFromHex(0x787878);
        _detailLabel.textAlignment = NSTextAlignmentCenter;
        
    }
    return _detailLabel;
}
-(UILabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc]init];
        _contentLabel.text = @"最长30秒哦";
        _contentLabel.font = [UIFont systemFontOfSize:15];
        _contentLabel.textColor = DSColorFromHex(0x787878);
        _contentLabel.textAlignment = NSTextAlignmentCenter;
       
    }
    return _contentLabel;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.dateLabel];
    [self.view addSubview:self.detailLabel];
    [self.view addSubview:self.contentLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(72);
        make.centerX.equalTo(self.view);
    }];
    [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(20);
        make.centerX.equalTo(self.view);
    }];
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.dateLabel.mas_bottom).offset(29);
        make.centerX.equalTo(self.view);
    }];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.detailLabel.mas_bottom).offset(10);
        make.centerX.equalTo(self.view);
    }];
    
    
    NSTimer *timer = [NSTimer timerWithTimeInterval:10 target:self selector:@selector(timerAction) userInfo:nil repeats:NO];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    [timer setFireDate:[NSDate distantPast]];
}
-(void)timerAction{
    PaySuccessController *payVC = [[PaySuccessController alloc]init];
    [self.navigationController pushViewController:payVC animated:YES];
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
        self.title = @"订单结束";
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
