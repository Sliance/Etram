//
//  SubmitQuestionsController.m
//  Etram
//
//  Created by 燕来秋mac9 on 2018/9/7.
//  Copyright © 2018年 zhangshu. All rights reserved.
//

#import "SubmitQuestionsController.h"

@interface SubmitQuestionsController ()

@end

@implementation SubmitQuestionsController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)setSelectedIndex:(NSInteger)selectedIndex{
    _selectedIndex = selectedIndex;
    if (selectedIndex ==0) {
        self.title = @"车辆故障描述";
    }else if (selectedIndex ==1){
        self.title = @"违规停车描述";
    }else if (selectedIndex ==1){
        self.title = @"车桩故障描述";
    }else if (selectedIndex ==1){
        self.title = @"问题描述";
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
