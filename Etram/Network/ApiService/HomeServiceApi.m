//
//  HomeServiceApi.m
//  Etram
//
//  Created by 燕来秋mac9 on 2018/9/18.
//  Copyright © 2018年 zhangshu. All rights reserved.
//

#import "HomeServiceApi.h"

@implementation HomeServiceApi
+ (instancetype)share {
    static HomeServiceApi *global;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (global == nil) {
            global = [[HomeServiceApi alloc] init];
        }
    });
    return global;
}
///发送验证码
-(void)sendVerCodeWithParam:(LoginReq *) req response:(responseModel) responseModel{
    
    NSDictionary *dic = [req mj_keyValues];
    [[ZSAPIProxy shareProxy] callPOSTWithUrl:send_sms_url Params:dic isShowLoading:YES successCallBack:^(ZSURLResponse *response) {
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

///微信登录
-(void)weChartLoginWithParam:(LoginReq *) req response:(responseModel) responseModel{
    
    NSDictionary *dic = [req mj_keyValues];
    [[ZSAPIProxy shareProxy] callPOSTWithUrl:wx_login_url Params:dic isShowLoading:YES successCallBack:^(ZSURLResponse *response) {
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
@end
