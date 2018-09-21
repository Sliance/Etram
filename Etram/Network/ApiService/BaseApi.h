//
//  BaseApi.h
//  Psf
//
//  Created by 燕来秋mac9 on 2018/6/21.
//  Copyright © 2018年 zhangshu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZSAPIProxy.h"
#import "UserCacheBean.h"
#import "ZSConfig.h"
///微信验证是否用户存在
#define wx_login_url @"/ebike/member/mobile/v1/wxauto/login"
///手机登录
#define phone_login_url @"/ebike/member/mobile/v1/phone/login"
///发送验证码
#define send_sms_url @"/ebike/member/mobile/v1/sendSms"

///获取用户信息
#define mine_info_url @"/ebike/member/mobile/v1/find"
///修改用户信息
#define change_info_url @"/ebike/member/mobile/v1/find"






typedef void(^responseModel)(id response);
@interface BaseApi : NSObject
+ (void)requestAccountInfoModel:(responseModel ) response;
@end
