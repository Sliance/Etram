//
//  MineServiceApi.h
//  Etram
//
//  Created by 燕来秋mac9 on 2018/9/21.
//  Copyright © 2018年 zhangshu. All rights reserved.
//

#import "BaseApi.h"
#import "BaseModelReq.h"
#import "MineInformationReq.h"
#import "RechargeRuleModel.h"
#import "MineMessageListRes.h"
#import "IntegralRecord.h"

@interface MineServiceApi : BaseApi
+ (instancetype)share;
///获取单条会员信息
- (void)getMemberInformationWithParam:(BaseModelReq *) req response:(responseModel) responseModel;
///修改会员信息
- (void)updateMemberInformationWithParam:(MineInformationReq *) req response:(responseModel) responseModel;
///获取会员充值规则表列表
- (void)rechargeMemberBalanceWithParam:(BaseModelReq *) req response:(responseModel) responseModel;
///获取消息列表
- (void)myMessageListWithParam:(BaseModelReq *) req response:(responseModel) responseModel;
///获取帐户明细列表
- (void)accountDetailListWithParam:(BaseModelReq *) req response:(responseModel) responseModel;


@end
