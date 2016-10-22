//
//  WriteCell.h
//  lvxing
//
//  Created by wd on 16/10/11.
//  Copyright © 2016年 wd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WriteCell : UITableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
@property(nonatomic,strong)UIButton*btn_add;
@property(nonatomic,strong)UILabel*label;
@property(nonatomic,strong)UIButton*btn_cancle;
@property(nonatomic,strong)UIButton*btn_ok;
@property(nonatomic,strong)UITextView*textview;
@end
