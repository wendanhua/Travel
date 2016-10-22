//
//  InformationCell.h
//  lvxing
//
//  Created by wd on 16-9-10.
//  Copyright (c) 2016年 wd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InformationCell : UITableViewCell
@property(nonatomic,strong)UIImageView*viewimage;//cell图标
@property(nonatomic,strong)UIImageView*image_head;//头像
@property(nonatomic,strong)UIImageView*image_ground;//蓝色背景
@property(nonatomic,strong)UILabel*label;//标签
@property(nonatomic,strong)UILabel*label_name;//用户名
@property(nonatomic,strong)UILabel*label_sig;//个性签名
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

@end
