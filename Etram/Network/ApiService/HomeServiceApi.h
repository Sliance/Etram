//
//  HomeServiceApi.h
//  Etram
//
//  Created by 燕来秋mac9 on 2018/9/18.
//  Copyright © 2018年 zhangshu. All rights reserved.
//

#import "BaseApi.h"
#import "LoginReq.h"

@interface HomeServiceApi : BaseApi
+ (instancetype)share;
///发送验证码
-(void)sendVerCodeWithParam:(LoginReq *) req response:(responseModel) responseModel;

@end