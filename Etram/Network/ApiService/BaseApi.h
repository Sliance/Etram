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
#define wx_login_url          @"/ebike/member/mobile/v1/wxauto/login"
///手机登录
#define phone_login_url       @"/ebike/member/mobile/v1/phone/login"
///发送验证码
#define send_sms_url          @"/ebike/member/mobile/v1/sendSms"

///获取用户信息
#define mine_info_url          @"/ebike/member/mobile/v1/find"
///修改用户信息
#define change_info_url        @"/ebike/member/mobile/v1/find"
///获取会员充值返红包规则列表
#define recharge_rule_url       @"/ebike/member/activity/red/rule/mobile/v1/list"
///获取消息列表
#define mine_messagelist_url     @"/ebike/member/activity/message/mobile/v1/list"
///获取帐户明细列表
#define account_detaillist_url   @"/ebike/member/account/detail/mobile/v1/list"


///首页订单状态
#define home_order_status        @"/ebike/cycling/order/mobile/v1/home/order/status"
///获取骑行订单详情
#define cycling_detail_url       @"/ebike/cycling/order/mobile/v1/find/just/end"
///结束行程页面的订单支付
#define pay_order_end            @"/ebike/cycling/order/mobile/v1/find/order/end"
///获取骑行订单列表
#define cycle_list_url          @"/ebike/cycling/order/mobile/v1/list"
///临时锁车后开锁
#define temp_lock_open          @"/ebike/cycling/order/mobile/v1/open/temp/lock"
///结束行程
#define cycle_order_end         @"/ebike/cycling/order/mobile/v1/over"
///创建骑行订单
#define cycle_order_creat       @"/ebike/cycling/order/mobile/v1/save"
///上传用户骑行位置
#define cycle_location_up       @"/ebike/cycling/order/mobile/v1/send/latLat"
///临时锁车
#define temp_lock_close         @"/ebike/cycling/order/mobile/v1/temp/lock"
///查询订单状态
#define query_order_status       @"/ebike/cycling/order/mobile/v1/temp/statu"
///获取用户已锁车，骑行中订单，只返回订单号
#define close_order_cycling       @"/ebike/cycling/order/mobile/v1/lock/bike/order"

///用户预约接口
#define appoint_cycling_url       @"/ebike/cycling/sub/order/mobile/v1/save"
///获取单条预约订单
#define appoint_cycling_order       @"/ebike/cycling/sub/order/mobile/v1/find"
///取消预约
#define appoint_cycling_cancle       @"/ebike/cycling/sub/order/mobile/v1/cancle"





typedef void(^responseModel)(id response);
@interface BaseApi : NSObject
+ (void)requestAccountInfoModel:(responseModel ) response;
@end
