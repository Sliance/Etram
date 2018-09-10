//
//  UnlockingController.m
//  Etram
//
//  Created by 燕来秋mac9 on 2018/9/10.
//  Copyright © 2018年 zhangshu. All rights reserved.
//

#import "UnlockingController.h"
#import "UnlockView.h"
#import "UnlockSuccessController.h"

@interface UnlockingController ()
@property(nonatomic,strong)UIView *yinView;
@property(nonatomic,strong)UnlockView *lockView;



@end

@implementation UnlockingController
-(UnlockView *)lockView{
    if (!_lockView) {
        _lockView = [[UnlockView alloc]initWithFrame:CGRectMake(0, SCREENHEIGHT-400-[self navHeightWithHeight], SCREENWIDTH, 400)];
    }
    return _lockView;
}
-(UIView *)yinView{
    if(!_yinView){
        _yinView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
        _yinView.backgroundColor = DSColorAlphaFromHex(0x000000, 0.3);
    }
    return _yinView;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
        self.title = @"解锁密码";
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.yinView];
    [self.view addSubview:self.lockView];
    NSTimer *timer = [NSTimer timerWithTimeInterval:5 target:self selector:@selector(timerAction) userInfo:nil repeats:NO];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    [timer setFireDate:[NSDate distantPast]];
}
-(void)timerAction{
    UnlockSuccessController *successVC = [[UnlockSuccessController alloc]init];
    [self.navigationController pushViewController:successVC animated:YES];
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
