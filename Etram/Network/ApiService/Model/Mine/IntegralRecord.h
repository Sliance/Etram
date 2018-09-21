//
//  IntegralRecord.h
//  Psf
//
//  Created by 燕来秋mac9 on 2018/7/25.
//  Copyright © 2018年 zhangshu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IntegralRecord : NSObject
///充值记录编号
@property(nonatomic,copy)NSString* memberAccountDetailId;
///交易平台：支付宝、微信、eBike账户
@property(nonatomic,copy)NSString *tradingPlatform;
///金额变动
@property(nonatomic,copy)NSString *moneyChange;

///交易类型：充值、提现、支付
@property(nonatomic,copy)NSString* transactionType;
///红包变动
@property(nonatomic,copy)NSString *redEnvelopeChange;
///订单号
@property(nonatomic,copy)NSString *orderNo;
///交易账号
@property(nonatomic,copy)NSString *transactionAccount;
///平台流水号
@property(nonatomic,copy)NSString *platformSerialNumber;
///备注信息
@property(nonatomic,copy)NSString *remark;
///更新时间
@property(nonatomic,copy)NSString *systemUpdateTime;







@end
