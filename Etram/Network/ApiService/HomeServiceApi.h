//
//  HomeServiceApi.h
//  Etram
//
//  Created by 燕来秋mac9 on 2018/9/18.
//  Copyright © 2018年 zhangshu. All rights reserved.
//

#import "BaseApi.h"
#import "LoginReq.h"
#import "CyclingReq.h"

@interface HomeServiceApi : BaseApi
+ (instancetype)share;
///发送验证码
-(void)sendVerCodeWithParam:(LoginReq *) req response:(responseModel) responseModel;
///微信登录
-(void)weChartLoginWithParam:(LoginReq *) req response:(responseModel) responseModel;
///注册登录校验
-(void)requestLoginWithParam:(LoginReq *) req response:(responseModel) responseModel;
///注册登录校验
-(void)requestLoginWithParam:(CyclingReq *) req response:(responseModel) responseModel;












@end
