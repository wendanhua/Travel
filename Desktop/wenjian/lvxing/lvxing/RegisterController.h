//
//  RegisterController.h
//  lvxing
//
//  Created by wd on 16-9-13.
//  Copyright (c) 2016年 wd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterController : UIViewController
@property(nonatomic,strong)UIImageView*image_background;
@property(nonatomic,strong)UIImageView*image_tubiao;
@property(nonatomic,strong)UITextField*text_phone;//手机号
@property(nonatomic,strong)UITextField*text_pasw;//创建密码
@property(nonatomic,strong)UITextField*text_repasw;//确认密码
@property(nonatomic,strong)UITextField*text_message;//短信验证
@property(nonatomic,strong)UIButton*btn_register;
@property(nonatomic,strong)UIButton*btn_yanzheng;
@property(nonatomic,strong)UIButton*btn_back;
@property(nonatomic,strong)UILabel*lab_condition;
@property(nonatomic,strong)NSString*str_phone;
@property(nonatomic,strong)NSString*str_yanzheng;

@end
