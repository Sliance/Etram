//
//  RechargeHeadView.m
//  Psf
//
//  Created by 燕来秋mac9 on 2018/7/3.
//  Copyright © 2018年 zhangshu. All rights reserved.
//

#import "RechargeHeadView.h"

@implementation RechargeHeadView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
-(void)setDataArr:(NSMutableArray *)dataArr{
    for (int i = 0; i<dataArr.count; i++) {
        RechargeBtn *btn = [[RechargeBtn alloc]init];
        [btn addTarget:self action:@selector(pressChoose:) forControlEvents:UIControlEventTouchUpInside];
        btn.frame = CGRectMake(20+i%2*(SCREENWIDTH/2-25/2), i/2*105+20,SCREENWIDTH/2-55/2, 90);
        [self addSubview:btn];
//        RechargeRuleModel *model = dataArr[i];
//        btn.numLabel.text = [NSString stringWithFormat:@"充值%@元",model.rechargeMoney];
//        btn.detailLabel.text = [NSString stringWithFormat:@"送%@余额",model.backMoney];
        btn.numLabel.text = @"充值20元";
        btn.detailLabel.text = @"赠送红包金额5元";
        
    }
    
}
-(void)pressChoose:(RechargeBtn *)sender{
    sender.selected = !sender.selected;
    
    if (_tmpBtn == nil){
        sender.selected = YES;
        [sender.layer setBorderColor:DSColorFromHex(0x5AC72F).CGColor];
        sender.numLabel.textColor = DSColorFromHex(0x5AC72F);
        sender.detailLabel.textColor = DSColorFromHex(0x5AC72F);
        sender.backgroundColor = DSColorFromHex(0xEBF1E8);
        _tmpBtn = sender;
    }else if (_tmpBtn !=nil && _tmpBtn == sender){
        sender.selected = YES;
        [sender.layer setBorderColor:DSColorFromHex(0x5AC72F).CGColor];
        sender.numLabel.textColor = DSColorFromHex(0x5AC72F);
        sender.detailLabel.textColor = DSColorFromHex(0x5AC72F);
        sender.backgroundColor = DSColorFromHex(0xEBF1E8);
    }else if (_tmpBtn!= sender && _tmpBtn!=nil){
        _tmpBtn.selected = NO;
        [_tmpBtn.layer setBorderColor:DSColorFromHex(0xF0F0F0).CGColor];
        _tmpBtn.numLabel.textColor = DSColorFromHex(0x323232);
        _tmpBtn.detailLabel.textColor = DSColorFromHex(0x969696);
        _tmpBtn.backgroundColor = DSColorFromHex(0xF0F0F0);
        sender.selected = YES;
        [sender.layer setBorderColor:DSColorFromHex(0x5AC72F).CGColor];
        sender.numLabel.textColor = DSColorFromHex(0x5AC72F);
        sender.detailLabel.textColor = DSColorFromHex(0x5AC72F);
        sender.backgroundColor = DSColorFromHex(0xEBF1E8);
        _tmpBtn = sender;
    }
    
    self.chooseBlock(sender.tag);
}
@end
