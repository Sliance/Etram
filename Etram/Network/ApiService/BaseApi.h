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
#define wx_login_url @"/ebike/member/mobile/v1/wxauto/login"
#define phone_login_url @"/ebike/member/mobile/v1/phone/login"
#define send_sms_url @"/ebike/member/mobile/v1/sendSms"
typedef void(^responseModel)(id response);
@interface BaseApi : NSObject
+ (void)requestAccountInfoModel:(responseModel ) response;
@end
