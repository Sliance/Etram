//
//  MineMessageListRes.h
//  Etram
//
//  Created by 燕来秋mac9 on 2018/9/21.
//  Copyright © 2018年 zhangshu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MineMessageListRes : NSObject
///
@property(nonatomic,copy)NSString *memberActivityMessageId;
///消息标题
@property(nonatomic,copy)NSString *memberActivityMessageTitle;
///消息主图
@property(nonatomic,copy)NSString *memberActivityMessageImage;
///消息内容
@property(nonatomic,copy)NSString *memberActivityMessageContent;
///活动开始时间
@property(nonatomic,copy)NSString *startTime;
///活动结束时间
@property(nonatomic,copy)NSString *endTime;




@end
