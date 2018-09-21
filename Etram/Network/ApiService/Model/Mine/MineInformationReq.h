//
//  MineInformationReq.h
//  Etram
//
//  Created by 燕来秋mac9 on 2018/9/21.
//  Copyright © 2018年 zhangshu. All rights reserved.
//

#import "BaseModelReq.h"

@interface MineInformationReq : BaseModelReq

///手机号
@property(nonatomic,copy)NSString *phoneNumber;
///
@property(nonatomic,copy)NSString *systemVersion;
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

///
@property(nonatomic,copy)NSString *memberAvatarPath;
///性别
@property(nonatomic,copy)NSString *sex;

///身份证号
@property(nonatomic,copy)NSString *idCardNo;

///账户余额
@property(nonatomic,copy)NSString *accountBalance;
///红包金额
@property(nonatomic,copy)NSString *redEnvelope;
///行程公里数
@property(nonatomic,copy)NSString *routeDistance;
///积分
@property(nonatomic,copy)NSString *score;



@end
