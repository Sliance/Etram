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
@property(nonatomic,strong)UIButton *submitBtn;
@property(nonatomic,strong)UIButton *codeBtn;
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
-(UIButton *)submitBtn{
    if (!_submitBtn) {
        _submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_submitBtn.layer setMasksToBounds:YES];
        [_submitBtn.layer setCornerRadius:20];
        
        [_submitBtn setTitle:@"提交" forState:UIControlStateNormal];
        _submitBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        [_submitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        [_submitBtn addTarget:self action:@selector(pressSubmit) forControlEvents:UIControlEventTouchUpInside];
        _submitBtn.backgroundColor = DSColorFromHex(0x5AC72F);
    }
    return _submitBtn;
}
-(UIButton *)codeBtn{
    if (!_codeBtn) {
        _codeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
     
        [_codeBtn setImage:[UIImage imageNamed:@"sweep_home"] forState:UIControlStateNormal];
        [_codeBtn addTarget:self action:@selector(pressCode) forControlEvents:UIControlEventTouchUpInside];
       
    }
    return _codeBtn;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.textView];
    [self.view addSubview:self.textField];
    [self.view addSubview:self.submitBtn];
    [self.textField addSubview:self.codeBtn];
    _textView.frame = CGRectMake(0, 0, SCREENWIDTH, 190);
    _textField.frame = CGRectMake(0, self.textView.ctBottom+10, SCREENWIDTH, 45);
    [self setTextFieldLeftView:_textField :@"" :15 ];
    _codeBtn.frame = CGRectMake(SCREENWIDTH-45, 0, 45, 45);
}

-(void)setSelectedIndex:(NSInteger)selectedIndex{
    _selectedIndex = selectedIndex;
    _codeBtn.hidden = NO;;
    if (selectedIndex ==0) {
        self.title = @"车辆故障";
        _textView.placeholder = @"车辆故障描述";
        _textField.placeholder = @"车辆编码";
    }else if (selectedIndex ==1){
        self.title = @"违规停车";
        _textView.placeholder = @"违规停车描述";
        _textField.placeholder = @"车辆编码";
    }else if (selectedIndex ==2){
        self.title = @"车桩故障";
        _textView.placeholder = @"车桩故障描述";
        _textField.placeholder = @"车桩编码";
    }else if (selectedIndex ==3){
        self.title = @"其他问题";
        _textView.placeholder = @"问题描述";
        _codeBtn.hidden = YES;
        _textField.placeholder = @"";
            _textField.frame = CGRectMake(0, self.textView.ctBottom+10, SCREENWIDTH, 0);
    }
    self.submitBtn.frame = CGRectMake(SCREENWIDTH/2-90, self.textField.ctBottom
                                      +30, 180, 40);
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
        self.view.backgroundColor = DSColorFromHex(0xF0F0F0);
        
       
        
    }
    return self;
}
-(void)pressCode{
    
}
-(void)pressSubmit{
    
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
