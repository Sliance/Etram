//
//  RechargeRuleModel.h
//  Psf
//
//  Created by 燕来秋mac9 on 2018/7/26.
//  Copyright © 2018年 zhangshu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RechargeRuleModel : NSObject
///
@property(nonatomic,copy)NSString *redNum;
///充值规则编号
@property(nonatomic,copy)NSString *memberActivityRedRuleId;
///
@property(nonatomic,copy)NSString *startTime;
///
@property(nonatomic,copy)NSString *endTime;
///
@property(nonatomic,copy)NSString *systemVersion;
///
@property(nonatomic,copy)NSString *rechargeMoney;
@end
