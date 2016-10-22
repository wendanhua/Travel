//
//  RegisterController.m
//  lvxing
//
//  Created by wd on 16-9-13.
//  Copyright (c) 2016年 wd. All rights reserved.
//

#import "RegisterController.h"
#import "LoginController.h"
#import <sqlite3.h>
#import "XSingleTon.h"
#import <SMS_SDK/SMSSDK.h>

@interface RegisterController ()<UITextFieldDelegate>
{
    int ok;
    sqlite3*db;
    char*msg;
}
@end

@implementation RegisterController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    XSingleTon*sx=[XSingleTon shareSingleton];
    sx.single_phone=[NSString string];
    db=[sx date];
    
    self.navigationController.navigationBarHidden=YES;
    
    [self.view addSubview:self.image_background];
    [self.view addSubview:self.image_tubiao];
    [self.view addSubview:self.text_phone];
    [self.view addSubview:self.text_pasw];
    [self.view addSubview:self.text_repasw];
    [self.view addSubview:self.text_message];
    [self.view addSubview:self.btn_register];
    [self.view addSubview:self.btn_yanzheng];
    [self.view addSubview:self.btn_back];
    [self.view addSubview:self.lab_condition];
    
    self.text_phone.delegate=self;
    self.text_pasw.delegate=self;
    self.text_repasw.delegate=self;
    self.text_message.delegate=self;
    
    //点击空白处虚拟键盘消失
    [self backgesture];

    self.str_phone=[NSString string];
    self.str_yanzheng=[NSString string];
    
}
-(void)viewWillAppear:(BOOL)animated
{
    CGFloat width=[UIScreen mainScreen].bounds.size.width;
    CGFloat height=[UIScreen mainScreen].bounds.size.height;
    self.image_background.frame=CGRectMake(0.0f, 0.0f, width, height);
    self.image_tubiao.frame=CGRectMake((width-80)/2, 100.0f, 80.0f, 80.0f);
    self.text_phone.frame=CGRectMake(0.0f, 220.0f, width, 50.0f);
    self.text_pasw.frame=CGRectMake(0.0f, 271.0f, width, 50.0f);
    self.text_repasw.frame=CGRectMake(0.0f, 322.0f, width, 50.0f);
    self.text_message.frame=CGRectMake(0.0f, 413.0f, width, 50.0f);
    self.btn_back.frame=CGRectMake(5.0f, 30.0f, 30.0f, 30.0f);
    self.lab_condition.frame=CGRectMake((width/2+10), 378.0f, 200.0f, 10.0f);
    self.btn_register.frame=CGRectMake(0.0f, 485.0f, width, 50.0f);
    self.btn_yanzheng.frame=CGRectMake(255.0f, 423.0f, 100.0f, 30.0f);
}
#pragma mark-getters
-(UIImageView*)image_background
{
    if (!_image_background) {
        _image_background=[[UIImageView alloc]init];
        _image_background.image=[UIImage imageNamed:@"背景"];
    }
    return _image_background;
}
-(UIImageView*)image_tubiao
{
    if (!_image_tubiao) {
        _image_tubiao=[[UIImageView alloc]init];
        _image_tubiao.image=[UIImage imageNamed:@"图标"];
    }
    return _image_tubiao;
}
-(UITextField*)text_phone
{
    if (!_text_phone) {
        _text_phone=[[UITextField alloc]init];
        _text_phone.backgroundColor=[UIColor lightTextColor];
        UILabel*lab_phone=[[UILabel alloc]init];
        lab_phone.text=@"  手机号";
        lab_phone.textColor=[UIColor grayColor];
        lab_phone.font=[UIFont systemFontOfSize:15.0f];
        lab_phone.contentMode=UIViewContentModeCenter;
        _text_phone.leftView=lab_phone;
        _text_phone.leftView.backgroundColor=[UIColor clearColor];
        _text_phone.leftView.frame=CGRectMake(10.0f, 0.0f, 80.0f, 20.0f);
        _text_phone.leftViewMode=UITextFieldViewModeAlways;
        //键盘格式
        _text_phone.keyboardType=UIKeyboardTypePhonePad;
        self.str_phone=self.text_phone.text;
    }
    return _text_phone;
}
-(UITextField*)text_pasw
{
    if (!_text_pasw) {
        _text_pasw=[[UITextField alloc]init];
        _text_pasw.backgroundColor=[UIColor lightTextColor];
        UILabel*lab_pasw=[[UILabel alloc]init];
        lab_pasw.text=@"  创建密码";
        lab_pasw.textColor=[UIColor grayColor];
        lab_pasw.font=[UIFont systemFontOfSize:15.0f];
        lab_pasw.contentMode=UIViewContentModeCenter;
        _text_pasw.leftView=lab_pasw;
        _text_pasw.leftView.backgroundColor=[UIColor clearColor];
        _text_pasw.leftView.frame=CGRectMake(10.0f, 0.0f, 80.0f, 20.0f);
        _text_pasw.leftViewMode=UITextFieldViewModeAlways;
        _text_pasw.secureTextEntry=YES;
    }
    return _text_pasw;
}
-(UITextField*)text_repasw
{
    if (!_text_repasw) {
        _text_repasw=[[UITextField alloc]init];
        _text_repasw.backgroundColor=[UIColor lightTextColor];
        UILabel*lab_repasw=[[UILabel alloc]init];
        lab_repasw.text=@"  确认密码";
        lab_repasw.textColor=[UIColor grayColor];
        lab_repasw.font=[UIFont systemFontOfSize:15.0f];
        lab_repasw.contentMode=UIViewContentModeCenter;
        _text_repasw.leftView=lab_repasw;
        _text_repasw.leftView.backgroundColor=[UIColor clearColor];
        _text_repasw.leftView.frame=CGRectMake(10.0f, 0.0f, 80.0f, 20.0f);
        _text_repasw.leftViewMode=UITextFieldViewModeAlways;
        _text_repasw.secureTextEntry=YES;
    }
    return _text_repasw;
}
-(UITextField*)text_message
{
    if (!_text_message) {
        _text_message=[[UITextField alloc]init];
        _text_message.backgroundColor=[UIColor lightTextColor];
        UILabel*lab_message=[[UILabel alloc]init];
        lab_message.text=@"  短信验证";
        lab_message.textColor=[UIColor grayColor];
        lab_message.font=[UIFont systemFontOfSize:15.0f];
        lab_message.contentMode=UIViewContentModeCenter;
        _text_message.leftView=lab_message;
        _text_message.leftView.backgroundColor=[UIColor clearColor];
        _text_message.leftView.frame=CGRectMake(10.0f, 0.0f, 80.0f, 20.0f);
        _text_message.leftViewMode=UITextFieldViewModeAlways;
        //键盘格式
        _text_message.keyboardType=UIKeyboardTypeNumberPad;
        self.str_yanzheng=_text_message.text;
    }
    return _text_message;
}
-(UIButton*)btn_register
{
    if (!_btn_register) {
        _btn_register=[[UIButton alloc]init];
        _btn_register.backgroundColor=[UIColor lightTextColor];
        [_btn_register setTitle:@"注册" forState:UIControlStateNormal];
        [_btn_register setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_btn_register addTarget:self action:@selector(alertcontrolller) forControlEvents:UIControlEventTouchDown];
    
    }
    return _btn_register;
}
-(UIButton*)btn_yanzheng
{
    if (!_btn_yanzheng) {
        _btn_yanzheng=[[UIButton alloc]init];
        [_btn_yanzheng setTitle:@"获取验证码" forState:UIControlStateNormal];
        [_btn_yanzheng setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _btn_yanzheng.backgroundColor=[UIColor grayColor];
        [_btn_yanzheng addTarget:self action:@selector(getmessage) forControlEvents:UIControlEventTouchDown];
        _btn_yanzheng.layer.cornerRadius=8.0f;
        _btn_yanzheng.titleLabel.font=[UIFont systemFontOfSize:15.0f];
    }
    return _btn_yanzheng;
}
-(UIButton*)btn_back
{
    if (!_btn_back) {
        _btn_back=[[UIButton alloc]init];
        [_btn_back setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
        [_btn_back addTarget:self action:@selector(backpage) forControlEvents:UIControlEventTouchDown];
    }
    return _btn_back;
}
-(UILabel*)lab_condition
{
    if (!_lab_condition) {
        _lab_condition=[[UILabel alloc]init];
        _lab_condition.text=@"密码需6-20位,建议用字母和数字组合";
        _lab_condition.font=[UIFont systemFontOfSize:10.0f];
        _lab_condition.textColor=[UIColor grayColor];
    }
    return _lab_condition;
}



#pragma mark-textfield方法调用
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.text_phone resignFirstResponder];
    [self.text_pasw resignFirstResponder];
    [self.text_repasw resignFirstResponder];
    [self.text_message resignFirstResponder];
    return YES;
}
-(void)backpage
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)backgesture
{
    UITapGestureRecognizer *tapGr=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(viewTapped:)];
    tapGr.cancelsTouchesInView=NO;
    [self.view addGestureRecognizer:tapGr];
    
}
-(void)viewTapped:(UITapGestureRecognizer *)tapGr
{
    [self.text_phone resignFirstResponder];
    [self.text_pasw resignFirstResponder];
    [self.text_repasw resignFirstResponder];
    [self.text_message resignFirstResponder];
}
-(void)getmessage
{
    NSLog(@"yanzhengma");
    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:self.text_phone.text zone:@"86" customIdentifier:nil result:^(NSError *error) {
        if (!error) {
            NSLog(@"获取验证码成功");
            UIAlertController*controller=[UIAlertController alertControllerWithTitle:@"" message:@"获取验证码成功" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction*action=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            [controller addAction:action];
            [self presentViewController:controller animated:YES completion:nil];
        }
        else
        {
            NSLog(@"错误信息:%@",error);
            UIAlertController*controller=[UIAlertController alertControllerWithTitle:@"" message:@"获取验证码失败" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction*action=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            [controller addAction:action];
            [self presentViewController:controller animated:YES completion:nil];
        }
    }];
}

-(void)alertcontrolller
{
    [SMSSDK commitVerificationCode:self.text_message.text phoneNumber:self.text_phone.text zone:@"86" result:^(NSError *error) {
        if (!error) {
            NSLog(@"验证成功");
            if (self.text_phone.text.length==0) {
                UIAlertController*controller=[UIAlertController alertControllerWithTitle:@"注册失败" message:@"用户名不能为为空!" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction*action1=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
                    
                }];
                UIAlertAction*action2=[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                    
                }];
                [controller addAction:action1];
                [controller addAction:action2];
                [self presentViewController:controller animated:YES completion:nil];
            }
            else
                if (self.text_phone.text.length==11) {
                    if (self.text_pasw.text.length!=0) {
                        if ([self.text_repasw.text isEqualToString:self.text_pasw.text]) {
                            
                            NSString*sql;
                            sql=[NSString stringWithFormat:@"insert into user(phone,password,repassword)values('%@','%@','%@');",self.text_phone.text,self.text_pasw.text,self.text_repasw.text];
                            ok=sqlite3_exec(db, [sql UTF8String], NULL, NULL, &msg);
                            if (ok!=SQLITE_OK) {
                                NSLog(@"msg1=%s",msg);
                            }
                            else
                            {
                                NSLog(@"插入数据");
                            }
                            //查询数据
                            sqlite3_stmt*stmt;
                            sql=@"select *from user";
                            sqlite3_prepare(db, [sql UTF8String], -1, &stmt, NULL);
                            while (sqlite3_step(stmt)==SQLITE_ROW) {
                                UIAlertController*controller=[UIAlertController alertControllerWithTitle:@"注册成功" message:@"" preferredStyle:UIAlertControllerStyleAlert];
                                UIAlertAction*action=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//                                    LoginController*controller=[[LoginController alloc]init];
//                                    [self.navigationController popToViewController:controller animated:YES];
                                    [self.navigationController popViewControllerAnimated:YES];
                                }];
                                [controller addAction:action];
                                [self presentViewController:controller animated:YES completion:nil];
                            }
                        }
                        else
                        {
                            UIAlertController*controller=[UIAlertController alertControllerWithTitle:@"注册失败" message:@"密码不一致!" preferredStyle:UIAlertControllerStyleAlert];
                            UIAlertAction*action=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                                
                            }];
                            [controller addAction:action];
                            [self presentViewController:controller animated:YES completion:nil];
                        }
                    }
                    else
                    {
                        UIAlertController*controller=[UIAlertController alertControllerWithTitle:@"注册失败" message:@"密码不能为空" preferredStyle:UIAlertControllerStyleAlert];
                        UIAlertAction*action=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                            
                        }];
                        [controller addAction:action];
                        [self presentViewController:controller animated:YES completion:nil];
                    }
                }
                else
                {
                    UIAlertController*controller=[UIAlertController alertControllerWithTitle:@"注册失败" message:@"手机号码为11位" preferredStyle:UIAlertControllerStyleAlert];
                    UIAlertAction*action=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                        
                    }];
                    [controller addAction:action];
                    [self presentViewController:controller animated:YES completion:nil];
                }

        }
        else
        {
            UIAlertController*controller=[UIAlertController alertControllerWithTitle:@"注册失败" message:@"验证码有误" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction*action=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            [controller addAction:action];
            [self presentViewController:controller animated:YES completion:nil];
        }
    }];
    }
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
