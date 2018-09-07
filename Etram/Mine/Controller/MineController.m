//
//  MineController.m
//  Etram
//
//  Created by 燕来秋mac9 on 2018/9/6.
//  Copyright © 2018年 zhangshu. All rights reserved.
//

#import "MineController.h"
#import "MineHeadView.h"
#import "MessageViewController.h"
#import "MineWalletViewController.h"
#import "MineInformationController.h"
#import "MineTripController.h"
#import "SettingController.h"
#import "InviteFriendsController.h"
#import "MyCouponController.h"
#import "ServiceAlertView.h"
#import "SubmitQuestionsController.h"

@interface MineController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableview;
@property(nonatomic,strong)NSArray *listArr;
@property(nonatomic,strong)NSArray *dataArr;
@property(nonatomic,strong)MineHeadView *headView;
@property(nonatomic,strong)ServiceAlertView *serviceView;
@end

@implementation MineController
-(UITableView *)tableview{
    if (!_tableview) {
        _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0,0, SCREENWIDTH, SCREENHEIGHT-[self navHeightWithHeight]) style:UITableViewStylePlain];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.backgroundColor = DSColorFromHex(0xF0F0F0);
        _tableview.tableFooterView = [[UIView alloc]init];
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableview;
}
-(ServiceAlertView *)serviceView{
    if (!_serviceView) {
        _serviceView = [[ServiceAlertView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
        _serviceView.hidden = YES;
    }
    return _serviceView;
}
-(MineHeadView *)headView{
    if (!_headView) {
        _headView = [[MineHeadView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 180)];
    }
    return _headView;
}
-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self setTitle:@"我的"];
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    self.navigationController.navigationBar.hidden = YES;
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
    [self.view addSubview:self.serviceView];
    self.tableview.tableHeaderView = self.headView;
    __weak typeof(self)weakself = self;
    [self.headView setSkipBlock:^(NSInteger index) {
        MineInformationController *informationVC = [[MineInformationController alloc]init];
        [weakself.navigationController pushViewController:informationVC animated:YES];
    }];
    _listArr = @[@"message_mine",@"wallet_mine",@"car_mine",@"coupon_mine",@"share_mine",@"seervice_mine",@"set_mine"];
    _dataArr = @[@"我的消息",@"我的钱包",@"我的行程",@"我的卡券",@"邀请好友",@"客户服务",@"用户设置"];
    
    [self.serviceView setSelectedBlock:^(NSInteger index) {
        SubmitQuestionsController *questionVC = [[SubmitQuestionsController alloc]init];
        [questionVC setSelectedIndex:index];
        [weakself.navigationController pushViewController:questionVC animated:YES];
    }];
    [self.serviceView setTapBlock:^(NSInteger index) {
        weakself.serviceView.hidden = YES;
    }];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _listArr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 61;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identify = @"identify";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identify];
    }
    
    cell.textLabel.text = _dataArr[indexPath.row];
    cell.textLabel.textColor = DSColorFromHex(0x323232);
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    cell.imageView.image = [UIImage imageNamed:_listArr[indexPath.row]];
    cell.detailTextLabel.textColor = DSColorFromHex(0xB4B4B4);
    cell.detailTextLabel.font = [UIFont systemFontOfSize:12];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.row ==1) {
        cell.detailTextLabel.text = @"176元";
    }else if (indexPath.row ==2){
        cell.detailTextLabel.text = @"共29.6公里";
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
        {
            MessageViewController *messageVC = [[MessageViewController alloc]init];
            [self.navigationController pushViewController:messageVC animated:YES];
        }
            break;
        case 1:
        {
            MineWalletViewController *walletVC = [[MineWalletViewController alloc]init];
            [self.navigationController pushViewController:walletVC animated:YES];
        }
            break;
        case 2:
        {
            MineTripController *tripVC = [[MineTripController alloc]init];
            [self.navigationController pushViewController:tripVC animated:YES];
        }
            break;
        case 3:
        {
            MyCouponController *couponVC = [[MyCouponController alloc]init];
            [self.navigationController pushViewController:couponVC animated:YES];
        }
            break;
        case 4:
        {
            InviteFriendsController *inviteVC = [[InviteFriendsController alloc]init];
            [self.navigationController pushViewController:inviteVC animated:YES];
        }
            break;
        case 5:
        {
            _serviceView.hidden = !_serviceView.hidden;
        }
            break;
        case 6:
        {
            SettingController *setVC = [[SettingController alloc]init];
            [self.navigationController pushViewController:setVC animated:YES];
        }
            break;
        default:
            break;
    }
    
    
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
