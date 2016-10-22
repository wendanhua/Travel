//
//  WriteCell.m
//  lvxing
//
//  Created by wd on 16/10/11.
//  Copyright © 2016年 wd. All rights reserved.
//

#import "WriteCell.h"

@implementation WriteCell

- (void)awakeFromNib {
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    [self.contentView addSubview:self.btn_cancle];
    [self.contentView addSubview:self.btn_ok];
    [self.contentView addSubview:self.btn_add];
    [self.contentView addSubview:self.label];
    [self.contentView addSubview:self.textview];
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat width=[UIScreen mainScreen].bounds.size.width;
    self.label.frame=CGRectMake(10.0f, 10.0f, 100.0f, 20.0f);
    self.btn_cancle.frame=CGRectMake(40.0f, 25.0f, 40.0f, 20.0f);
    self.btn_ok.frame=CGRectMake(295.0f, 25.0f, 40.0f, 20.0f);
    self.btn_add.frame=CGRectMake(20.0f, 230.0f, 40.0f, 40.0f);
    self.textview.frame=CGRectMake(20.0f, 50.0f,(width-40),200.0f);
}
#pragma mark-getters
-(UIButton*)btn_cancle
{
    if (!_btn_cancle) {
        _btn_cancle=[[UIButton alloc]init];
        [_btn_cancle setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        _btn_cancle.titleLabel.font=[UIFont systemFontOfSize:15.0f];
    }
    return _btn_cancle;
}
-(UIButton*)btn_ok
{
    if (!_btn_ok) {
        _btn_ok=[[UIButton alloc]init];
        [_btn_ok setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        _btn_ok.titleLabel.font=[UIFont systemFontOfSize:15.0f];
    }
    return _btn_ok;
}

-(UIButton*)btn_add
{
    if (!_btn_add) {
        _btn_add=[[UIButton alloc]init];
    }
    return _btn_add;
}
-(UILabel*)label
{
    if (!_label) {
        _label=[[UILabel alloc]init];
        _label.font=[UIFont systemFontOfSize:15.0f];
        _label.textColor=[UIColor grayColor];
    }
    return _label;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
