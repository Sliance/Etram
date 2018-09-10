//
//  SubmitQuestionsController.m
//  Etram
//
//  Created by 燕来秋mac9 on 2018/9/7.
//  Copyright © 2018年 zhangshu. All rights reserved.
//

#import "SubmitQuestionsController.h"
#import "UIPlaceHolderTextView.h"

@interface SubmitQuestionsController ()
@property(nonatomic,strong)UIPlaceHolderTextView *textView;
@property(nonatomic,strong)UITextField *textField;
@end

@implementation SubmitQuestionsController
-(UIPlaceHolderTextView *)textView{
    if (!_textView) {
        _textView = [[UIPlaceHolderTextView alloc]init];
        _textView.placeHolderLabel.font = [UIFont systemFontOfSize:15];
        _textView.placeholderColor = DSColorFromHex(0x959595);
        _textView.font =  [UIFont systemFontOfSize:15];
    }
    return _textView;
}
-(UITextField *)textField{
    if (!_textField) {
        _textField = [[UITextField alloc]init];
        _textField.font = [UIFont systemFontOfSize:15];
        _textField.backgroundColor = [UIColor whiteColor];
        
    }
    return _textField;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.textView];
    [self.view addSubview:self.textField];
    _textView.frame = CGRectMake(0, 0, SCREENWIDTH, 190);
    _textField.frame = CGRectMake(0, self.textView.ctBottom+10, SCREENWIDTH, 45);
    self setTextFieldLeftView:<#(UITextField *)#> :<#(NSString *)#> :<#(NSInteger)#>
}

-(void)setSelectedIndex:(NSInteger)selectedIndex{
    _selectedIndex = selectedIndex;
    if (selectedIndex ==0) {
        self.title = @"车辆故障";
        _textView.placeholder = @"车辆故障描述";
        _textField.placeholder = @"车辆编码";
    }else if (selectedIndex ==1){
        self.title = @"违规停车";
        _textView.placeholder = @"违规停车描述";
        _textField.placeholder = @"车辆编码";
    }else if (selectedIndex ==1){
        self.title = @"车桩故障";
        _textView.placeholder = @"车桩故障描述";
        _textField.placeholder = @"车桩编码";
    }else if (selectedIndex ==1){
        self.title = @"其他问题";
        _textView.placeholder = @"问题描述";
        _textField.placeholder = @"";
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
