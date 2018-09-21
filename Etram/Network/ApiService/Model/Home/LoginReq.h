//
//  LoginReq.h
//  Psf
//
//  Created by 燕来秋mac9 on 2018/7/26.
//  Copyright © 2018年 zhangshu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginReq : NSObject
///应用编号
@property(nonatomic,copy)NSString *appId;
///
@property(nonatomic,copy)NSString *token;
///客户端
@property(nonatomic,strong)NSString *platform;
///时间戳
@property(nonatomic,copy)NSString *timestamp;
@property(nonatomic,copy)NSString *ipAddress;

@property(nonatomic,copy)NSString *systemVersion;
///验证码
@property(nonatomic,copy)NSString *code;
///手机号
@property(nonatomic,copy)NSString *phoneNumber;
///验证码发送时间,yyyy-MM-dd HH:mm:ss
@property(nonatomic,copy)NSString *codeSendTime;

/*
 微信登录
 */
///openid
@property(nonatomic,copy)NSString *wechatOpenId;
///
@property(nonatomic,copy)NSString *province;
///地区
@property(nonatomic,copy)NSString *city;

///昵称
@property(nonatomic,copy)NSString *memberName;
//UnionId
@property(nonatomic,copy)NSString *wechatUnionId;
///邮箱
@property(nonatomic,copy)NSString *memberEmail;
///
@property(nonatomic,copy)NSString *memberAvatarPath;
///性别
@property(nonatomic,copy)NSString *sex;

///身份证号
@property(nonatomic,copy)NSString *idCardNo;
@end
