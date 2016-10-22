//
//  MyselfCell.h
//  lvxing
//
//  Created by wd on 16/9/29.
//  Copyright © 2016年 wd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyselfCell : UITableViewCell
@property(nonatomic,strong)UILabel*label;
@property(nonatomic,strong)UIImageView*image_head;
@property(nonatomic,strong)UILabel*lab;
@property(nonatomic,strong)UILabel*label_head;
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
@end
