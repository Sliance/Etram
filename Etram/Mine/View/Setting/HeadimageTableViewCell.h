//
//  HeadimageTableViewCell.h
//  Psf
//
//  Created by 燕来秋mac9 on 2018/6/26.
//  Copyright © 2018年 zhangshu. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "MineInformationReq.h"

@interface HeadimageTableViewCell : BaseTableViewCell
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UILabel *detailLabel;
@property(nonatomic,strong)UIImageView *headImage;
@property(nonatomic,strong)MineInformationReq *result;
@end
