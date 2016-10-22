//
//  SetCell.m
//  lvxing
//
//  Created by wd on 16-9-12.
//  Copyright (c) 2016年 wd. All rights reserved.
//

#import "SetCell.h"

@implementation SetCell

- (void)awakeFromNib {
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    [self.contentView addSubview:self.lable_set];
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.lable_set.frame=CGRectMake(25.0f, 10.0f, 100.0f, 20.0f);
}
#pragma mark-getters
-(UILabel*)lable_set
{
    if (!_lable_set) {
        _lable_set=[[UILabel alloc]init];
        _lable_set.font=[UIFont systemFontOfSize:15.0f];
    }
    return _lable_set;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
