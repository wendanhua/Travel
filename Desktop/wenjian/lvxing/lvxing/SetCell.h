//
//  SetCell.h
//  lvxing
//
//  Created by wd on 16-9-12.
//  Copyright (c) 2016年 wd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetCell : UITableViewCell
@property(nonatomic,strong)UILabel*lable_set;
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
@end
