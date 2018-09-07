//
//  ServiceAlertView.h
//  Etram
//
//  Created by 燕来秋mac9 on 2018/9/7.
//  Copyright © 2018年 zhangshu. All rights reserved.
//

#import "BaseView.h"

@interface ServiceAlertView : BaseView
@property(nonatomic,strong)UIView *yinView;
@property(nonatomic,strong)UIView *bgView;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,copy)void (^selectedBlock)(NSInteger);
@property(nonatomic,copy)void (^tapBlock)(NSInteger);
@end
