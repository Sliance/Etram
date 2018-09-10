//
//  SettingController.m
//  Etram
//
//  Created by 燕来秋mac9 on 2018/9/6.
//  Copyright © 2018年 zhangshu. All rights reserved.
//

#import "SettingController.h"
#import "AboutController.h"

#import "AccountRulesController.h"

@interface SettingController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableview;
@property(nonatomic,strong)UIButton *outBtn;

@property(nonatomic,strong)NSArray *dataArr;
@end

@implementation SettingController
-(UITableView *)tableview{
    if (!_tableview) {
        _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0,0, SCREENWIDTH, SCREENHEIGHT) style:UITableViewStylePlain];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.separatorColor = DSColorFromHex(0xF0F0F0);
        _tableview.tableFooterView = [[UIView alloc]init];
        _tableview.backgroundColor = DSColorFromHex(0xF0F0F0);
    }
    return _tableview;
}
-(UIButton *)outBtn{
    if (!_outBtn) {
        _outBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_outBtn.layer setMasksToBounds:YES];
        [_outBtn.layer setCornerRadius:20];
        [_outBtn.layer setBorderColor:DSColorFromHex(0x5AC72F).CGColor];
        [_outBtn.layer setBorderWidth:1];
        [_outBtn setTitle:@"退出" forState:UIControlStateNormal];
        _outBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        [_outBtn setTitleColor:DSColorFromHex(0x5AC72F) forState:UIControlStateNormal];
        
        [_outBtn addTarget:self action:@selector(pressOut) forControlEvents:UIControlEventTouchUpInside];
        _outBtn.backgroundColor = [UIColor whiteColor];
    }
    return _outBtn;
}
-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self setTitle:@"设置"];
    }
    return self;
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
    [self.view addSubview:self.outBtn];
    [self.outBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(180);
        make.height.mas_equalTo(40);
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-30);
    }];
    _dataArr = @[@"计费规则",@"充值协议",@"用户积分规则",@"客服相关"];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section ==0) {
        return 2;
    }
    return _dataArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section ==0) {
        return 0;
    }
    return 5;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = DSColorFromHex(0xF0F0F0);
    return view;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identify = @"identify";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identify];
    }
    
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.textColor = DSColorFromHex(0x323232);
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    
    if (indexPath.section ==0) {
        if (indexPath.row ==0) {
            cell.textLabel.text = @"操作流程";
        }else if (indexPath.row ==1) {
            cell.textLabel.text = @"关于我们";
        }
    }else if (indexPath.section ==1){
        cell.textLabel.text = _dataArr[indexPath.row];
    }
    return cell;
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section ==0) {
        if (indexPath.row ==1) {
            AboutController *aboutVC = [[AboutController alloc]init];
            [self.navigationController pushViewController:aboutVC animated:YES];
        }
    }else if (indexPath.section ==1){
        if (indexPath.row ==0) {
            AccountRulesController *ruleVC = [[AccountRulesController alloc]init];
            [self.navigationController pushViewController:ruleVC animated:YES];
        }
    }
}

-(void)pressOut{
    
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
