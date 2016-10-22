//
//  MyselfCell.m
//  lvxing
//
//  Created by wd on 16/9/29.
//  Copyright © 2016年 wd. All rights reserved.
//

#import "MyselfCell.h"

@implementation MyselfCell

- (void)awakeFromNib {
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    [self.contentView addSubview:self.label];
    [self.contentView addSubview:self.lab];
    [self.contentView addSubview:self.image_head];
    [self.contentView addSubview:self.label_head];
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat width=[UIScreen mainScreen].bounds.size.width;
    self.label_head.frame=CGRectMake(25.0f, 20.0f, 80.0f, 20.0f);
    self.label.frame=CGRectMake(25.0f, 15.0f, 60.0f, 20.0f);
    self.lab.frame=CGRectMake(50.0f, 15.0f, 50.0, 20.0f);
    self.image_head.frame=CGRectMake((width-80), 10.0f, 40.0f, 40.0f);
}
#pragma mark-getters
-(UILabel*)label_head
{
    if (!_label_head) {
        _label_head=[[UILabel alloc]init];
        _label_head.font=[UIFont systemFontOfSize:16.0f];
        _label_head.textColor=[UIColor blackColor];
        _label_head.textAlignment=NSTextAlignmentLeft;

    }
    return _label_head;
}
-(UILabel*)label
{
    if (!_label) {
        _label=[[UILabel alloc]init];
        _label.font=[UIFont systemFontOfSize:16.0f];
        _label.textColor=[UIColor blackColor];
        _label.textAlignment=NSTextAlignmentLeft;
        _label.backgroundColor=[UIColor redColor];
    }
    return _label;
}
-(UILabel*)_lab
{
    if (!_lab) {
        _lab=[[UILabel alloc]init];
        _lab.font=[UIFont systemFontOfSize:14.0f];
        _lab.textColor=[UIColor grayColor];
        _lab.textAlignment=NSTextAlignmentRight;
        _lab.backgroundColor=[UIColor orangeColor];
    }
    return _lab;
}
-(UIImageView*)image_head
{
    if (!_image_head) {
        _image_head=[[UIImageView alloc]init];
    }
    return _image_head;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
