//
//  MyCouponController.m
//  Etram
//
//  Created by 燕来秋mac9 on 2018/9/7.
//  Copyright © 2018年 zhangshu. All rights reserved.
//

#import "MyCouponController.h"
#import "CouponCell.h"
#import "ZSSortSelectorView.h"
@interface MyCouponController ()<UITableViewDelegate,UITableViewDataSource,ZSSortSelectorViewDelegate>
@property(nonatomic,strong)UITableView *tableview;
@property (nonatomic , strong) ZSSortSelectorView *scrollView;
@end

@implementation MyCouponController
-(UITableView *)tableview{
    if (!_tableview) {
        _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0,45, SCREENWIDTH, SCREENHEIGHT-[self navHeightWithHeight]) style:UITableViewStylePlain];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.backgroundColor = DSColorFromHex(0xF0F0F0);
        _tableview.tableFooterView = [[UIView alloc]init];
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableview;
}
- (ZSSortSelectorView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[ZSSortSelectorView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 45)];
        _scrollView.delegate = self;
        _scrollView.dataArr = @[@"骑行券",@"优惠券",@"用车券"];
    }
    return _scrollView;
}

- (void)chooseButtonType:(NSInteger)type {
    NSLog(@"选择颜色%ld",type);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if (@available(iOS 11.0, *)) {
        _tableview.contentInsetAdjustmentBehavior = NO;
    } else {
        self.navigationController.navigationBar.translucent = NO;
        self.automaticallyAdjustsScrollViewInsets = NO;
        
    }
    [self.view addSubview:self.tableview];
    [self.view addSubview:self.scrollView];
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 45)];
    headView.backgroundColor = DSColorFromHex(0xF0F0F0);
    UIButton *headbtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREENWIDTH-90, 0, 90, 45)];
    [headbtn setTitle:@"使用说明" forState:UIControlStateNormal];
    [headbtn setTitleColor:DSColorFromHex(0x5AC72F) forState:UIControlStateNormal];
    headbtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [headView addSubview:headbtn];
    self.tableview.tableHeaderView = headView;
}
-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self setTitle:@"我的卡券"];
    }
    return self;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 145;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identify = @"CouponCell";
    CouponCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[CouponCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identify];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
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
