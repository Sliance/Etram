//
//  MineServiceApi.m
//  Etram
//
//  Created by 燕来秋mac9 on 2018/9/21.
//  Copyright © 2018年 zhangshu. All rights reserved.
//

#import "MineServiceApi.h"

@implementation MineServiceApi
+ (instancetype)share {
    static MineServiceApi *global;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (global == nil) {
            global = [[MineServiceApi alloc] init];
        }
    });
    return global;
}
///获取用户信息
- (void)getMemberInformationWithParam:(BaseModelReq *) req response:(responseModel) responseModel{
    
    NSDictionary *dic = [req mj_keyValues];
    [[ZSAPIProxy shareProxy] callPOSTWithUrl:mine_info_url Params:dic isShowLoading:YES successCallBack:^(ZSURLResponse *response) {
        if ([response.content isKindOfClass:[NSDictionary class]]) {
            NSDictionary *dicResponse = (NSDictionary *) response.content;
            if ([dicResponse[@"code"] integerValue] == 200) {
                MineInformationReq *result = [MineInformationReq mj_objectWithKeyValues:dicResponse[@"data"]];
                if (responseModel) {
                    responseModel(result);
                }
            }else {
                if (responseModel) {
                    responseModel(nil);
                }
            }
        } else {
            if (responseModel) {
                responseModel(nil);
            }
        }
    } faildCallBack:^(ZSURLResponse *response) {
        
    }];
}
///修改会员信息
- (void)updateMemberInformationWithParam:(MineInformationReq *) req response:(responseModel) responseModel{
   
    NSDictionary *dic = [req mj_keyValues];
    [[ZSAPIProxy shareProxy] callPOSTWithUrl:change_info_url Params:dic isShowLoading:YES successCallBack:^(ZSURLResponse *response) {
        if ([response.content isKindOfClass:[NSDictionary class]]) {
            NSDictionary *dicResponse = (NSDictionary *) response.content;
            if ([dicResponse[@"code"] integerValue] == 200) {
                
                if (responseModel) {
                    responseModel(dicResponse);
                }
            }else {
                if (responseModel) {
                    responseModel(nil);
                }
            }
        } else {
            if (responseModel) {
                responseModel(nil);
            }
        }
    } faildCallBack:^(ZSURLResponse *response) {
        
    }];
}

///获取会员充值规则表列表
- (void)rechargeMemberBalanceWithParam:(BaseModelReq *) req response:(responseModel) responseModel{
    NSDictionary *dic = [req mj_keyValues];
    [[ZSAPIProxy shareProxy] callPOSTWithUrl:recharge_rule_url Params:dic isShowLoading:YES successCallBack:^(ZSURLResponse *response) {
        if ([response.content isKindOfClass:[NSDictionary class]]) {
            NSDictionary *dicResponse = (NSDictionary *) response.content;
            if ([dicResponse[@"code"] integerValue] == 200) {
                NSArray *result = [RechargeRuleModel mj_objectArrayWithKeyValuesArray:dicResponse[@"data"]];
                if (responseModel) {
                    responseModel(result);
                }
            }else {
                if (responseModel) {
                    responseModel(nil);
                }
            }
        } else {
            if (responseModel) {
                responseModel(nil);
            }
        }
    } faildCallBack:^(ZSURLResponse *response) {
        
    }];
}
///获取消息列表
- (void)myMessageListWithParam:(BaseModelReq *) req response:(responseModel) responseModel{
    NSDictionary *dic = [req mj_keyValues];
    [[ZSAPIProxy shareProxy] callPOSTWithUrl:mine_messagelist_url Params:dic isShowLoading:YES successCallBack:^(ZSURLResponse *response) {
        if ([response.content isKindOfClass:[NSDictionary class]]) {
            NSDictionary *dicResponse = (NSDictionary *) response.content;
            if ([dicResponse[@"code"] integerValue] == 200) {
                NSArray *result = [MineMessageListRes mj_objectArrayWithKeyValuesArray:dicResponse[@"data"][@"list"]];
                if (responseModel) {
                    responseModel(result);
                }
            }else {
                if (responseModel) {
                    responseModel(nil);
                }
            }
        } else {
            if (responseModel) {
                responseModel(nil);
            }
        }
    } faildCallBack:^(ZSURLResponse *response) {
        
    }];
}

///获取帐户明细列表
- (void)accountDetailListWithParam:(BaseModelReq *) req response:(responseModel) responseModel{
    NSDictionary *dic = [req mj_keyValues];
    [[ZSAPIProxy shareProxy] callPOSTWithUrl:account_detaillist_url Params:dic isShowLoading:YES successCallBack:^(ZSURLResponse *response) {
        if ([response.content isKindOfClass:[NSDictionary class]]) {
            NSDictionary *dicResponse = (NSDictionary *) response.content;
            if ([dicResponse[@"code"] integerValue] == 200) {
                NSArray *result = [IntegralRecord mj_objectArrayWithKeyValuesArray:dicResponse[@"data"][@"list"]];
                if (responseModel) {
                    responseModel(result);
                }
            }else {
                if (responseModel) {
                    responseModel(nil);
                }
            }
        } else {
            if (responseModel) {
                responseModel(nil);
            }
        }
    } faildCallBack:^(ZSURLResponse *response) {
        
    }];
}

@end
