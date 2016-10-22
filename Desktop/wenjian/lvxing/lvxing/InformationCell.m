//
//  InformationCell.m
//  lvxing
//
//  Created by wd on 16-9-10.
//  Copyright (c) 2016年 wd. All rights reserved.
//

#import "InformationCell.h"

@implementation InformationCell

- (void)awakeFromNib {
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    [self.contentView addSubview:self.label];
    [self.contentView addSubview:self.label_name];
    [self.contentView addSubview:self.viewimage];
    [self.contentView addSubview:self.image_head];
    [self.contentView addSubview:self.label_sig];
    [self.contentView addSubview:self.image_ground];
    
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat widht=[UIScreen mainScreen].bounds.size.width;
    self.label.frame=CGRectMake(60.0f, 15.0f, 100.0f, 20.0f);
    self.label_name.frame=CGRectMake((widht-200)/2, 125.0f, 200.0f, 20.0f);
    self.viewimage.frame=CGRectMake(20.0f, 10.0f, 30.0f, 30.0f);
    self.image_head.frame=CGRectMake((widht-60)/2,50.0f, 60.0f, 60.0f);
    self.label_sig.frame=CGRectMake((widht-250)/2, 150.0f, 250.0f, 20.0f);
    self.image_ground.frame=CGRectMake(0.0f, (-20.0f), widht, 210.0f);
}
#pragma mark-getters
-(UIImageView*)viewimage
{
    if (!_viewimage) {
        _viewimage=[[UIImageView alloc]init];
    }
    return _viewimage;
}
-(UIImageView*)image_head
{
    if (!_image_head) {
        _image_head=[[UIImageView alloc]init];
    }
    return _image_head;
}
-(UIImageView*)image_ground
{
    if (!_image_ground) {
        _image_ground=[[UIImageView alloc]init];
    }
    return _image_ground;
}
-(UILabel*)label
{
    if (!_label) {
        _label=[[UILabel alloc]init];
        _label.font=[UIFont systemFontOfSize:16.0f];
        _label.textColor=[UIColor grayColor];
    }
    return _label;
}
-(UILabel*)label_name
{
    if (!_label_name) {
        _label_name=[[UILabel alloc]init];
        _label_name.font=[UIFont systemFontOfSize:12.0f];
        _label_name.textAlignment=NSTextAlignmentCenter;
    }
    return _label_name;
}
-(UILabel*)label_sig
{
    if (!_label_sig) {
        _label_sig=[[UILabel alloc]init];
        _label_sig.font=[UIFont systemFontOfSize:13.0f];
        _label_sig.textAlignment=NSTextAlignmentCenter;
    }
    return _label_sig;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
