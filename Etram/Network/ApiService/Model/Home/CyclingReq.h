//
//  CyclingReq.h
//  Etram
//
//  Created by 燕来秋mac9 on 2018/9/21.
//  Copyright © 2018年 zhangshu. All rights reserved.
//

#import "BaseModelReq.h"

@interface CyclingReq : BaseModelReq
///
@property(nonatomic,copy)NSString *cyclingOrderId;
///网点编号
@property(nonatomic,copy)NSString *areaPointId;
///预约订单编号
@property(nonatomic,copy)NSString *cyclingSubOrderId;
///经度
@property(nonatomic,copy)NSString *longitude;
///纬度
@property(nonatomic,copy)NSString *latitude;
///锁编码
@property(nonatomic,copy)NSString *lockId;

@end
