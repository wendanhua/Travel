//
//  LoginController.m
//  lvxing
//
//  Created by wd on 16-9-11.
//  Copyright (c) 2016年 wd. All rights reserved.
//

#import "LoginController.h"
#import "RepasswordController.h"
#import "RegisterController.h"
#import "SetController.h"
#import "XSingleTon.h"
#import <sqlite3.h>
@interface LoginController ()<UITextFieldDelegate>
{
    int ok;
    sqlite3*db;
    NSString*sql;
    
}
@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    XSingleTon*sx=[XSingleTon shareSingleton];
    db=sx.date;
    
    self.navigationController.navigationBarHidden=YES;
    [self.view addSubview:self.image_background];
    [self.image_background addSubview:self.image_tubiao];
    [self.view addSubview:self.text_iphone];
    [self.view addSubview:self.text_password];
    [self.view addSubview:self.btn_login];
    [self.view addSubview:self.btn_register];
    [self.view addSubview:self.btn_repassword];
    [self.view addSubview:self.btn_back];
    //点击空白处虚拟键盘消失
    [self backgesture];
}
-(void)viewWillAppear:(BOOL)animated
{
    CGFloat height=[UIScreen mainScreen].bounds.size.height;
    CGFloat width=[UIScreen mainScreen].bounds.size.width;

    self.image_background.frame=CGRectMake(0.0f, 0.0f, width, height);
    self.image_tubiao.frame=CGRectMake((width-80)/2, 100.0f, 80.0f, 80.0f);
    self.text_iphone.frame=CGRectMake((width-200)/2, 220.0f, 200.0f, 40.0f);
    self.text_password.frame=CGRectMake((width-200)/2, 275.0f, 200.0f, 40.0f);
    self.btn_login.frame=CGRectMake((width-200)/2, 340.0f, 200.0f, 40.0f);
    self.btn_repassword.frame=CGRectMake((width-200)/2, 385.0f, 60.0f, 20.0f);
    self.btn_register.frame=CGRectMake((width*0.61), 385.0f, 60.0f, 20.0f);
    self.btn_back.frame=CGRectMake(5.0f, 30.0f, 30.0f, 30.0f);
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
-(UITextField*)text_iphone
{
    if (!_text_iphone) {
        _text_iphone=[[UITextField alloc]init];
        _text_iphone.layer.cornerRadius=8.0f;
        _text_iphone.backgroundColor=[UIColor lightTextColor];
        _text_iphone.placeholder=@" 手机号/邮箱/QQ号";
        UIImageView*image=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"我"]];
        image.contentMode = UIViewContentModeCenter;
        _text_iphone.leftView=image;
        _text_iphone.leftView.backgroundColor=[UIColor clearColor];
        _text_iphone.leftView.frame=CGRectMake(0.0f, 0.0f, 40.0f, 30.0f);
        _text_iphone.leftViewMode=UITextFieldViewModeAlways;
        _text_iphone.delegate=self;
    }
    return _text_iphone;
}
-(UITextField*)text_password
{
    if (!_text_password) {
        _text_password=[[UITextField alloc]init];
        _text_password.layer.cornerRadius=8.0f;
        _text_password.backgroundColor=[UIColor lightTextColor];
        _text_password.placeholder=@"  密码";
        _text_password.secureTextEntry=YES;//密文显示
        UIImageView*image=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"密码"]];
        image.contentMode = UIViewContentModeCenter;
        _text_password.leftView=image;
        _text_password.leftView.backgroundColor=[UIColor clearColor];
        _text_password.leftView.frame=CGRectMake(0.0f, 0.0f, 40.0f, 40.0f);
        _text_password.leftViewMode=UITextFieldViewModeAlways;
        _text_password.delegate=self;
    }
    return _text_password;
}
-(UIButton*)btn_login
{
    if (!_btn_login) {
        _btn_login=[[UIButton alloc]init];
        _btn_login.layer.cornerRadius=8.0f;
        _btn_login.backgroundColor=[UIColor lightTextColor];
        [_btn_login setTitle:@"登录" forState:UIControlStateNormal];
        [_btn_login setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        _btn_login.titleLabel.font=[UIFont systemFontOfSize:17.0f];
        [_btn_login addTarget:self action:@selector(create) forControlEvents:UIControlEventTouchDown];
    }
    return _btn_login;
}
-(UIButton*)btn_register
{
    if (!_btn_register) {
        _btn_register=[[UIButton alloc]init];
        [_btn_register setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_btn_register setTitle:@"注册账号" forState:UIControlStateNormal];
        _btn_register.titleLabel.font=[UIFont systemFontOfSize:12.0f];
        [_btn_register addTarget:self action:@selector(register) forControlEvents:UIControlEventTouchDown];
    }
        return _btn_register;
}
-(UIButton*)btn_repassword
{
    if (!_btn_repassword) {
        _btn_repassword=[[UIButton alloc]init];
        [_btn_repassword setTitle:@"忘记密码?" forState:UIControlStateNormal];
        [_btn_repassword setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _btn_repassword.titleLabel.font=[UIFont systemFontOfSize:12.0f];
        [_btn_repassword addTarget:self action:@selector(repassword) forControlEvents:UIControlEventTouchDown];
    }
    return _btn_repassword;
}
-(UIButton*)btn_back
{
    if (!_btn_back) {
        _btn_back=[[UIButton alloc]init];
        [_btn_back setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
        [_btn_back addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchDown];
    }
    return _btn_back;
}
#pragma mark-调用方法
-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
    self.navigationController.navigationBarHidden=YES;
}
-(void)create
{
    XSingleTon*single=[XSingleTon shareSingleton];
    sqlite3_stmt*stmt;
    sql=[NSString stringWithFormat:@"select * from user where phone=%@;",self.text_iphone.text];
    sqlite3_prepare(db, [sql UTF8String], -1, &stmt, NULL);
    if (sqlite3_step(stmt)==SQLITE_ROW) {
        char*password=sqlite3_column_text(stmt, 1);
        NSString*str=[NSString stringWithCString:password encoding:NSUTF8StringEncoding];
        if ([self.text_password.text isEqual:str]) {
            [self.navigationController popToRootViewControllerAnimated:YES];
            
        }
        else
        {
            UIAlertController*controller=[UIAlertController alertControllerWithTitle:@"登录失败" message:@"密码输入不正确" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction*action1=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            [controller addAction:action1];
            [self presentViewController:controller animated:YES completion:nil];
        }
    }
    else
    {
        UIAlertController*controller=[UIAlertController alertControllerWithTitle:@"登录失败" message:@"用户名不存在" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction*action1=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self.navigationController popToRootViewControllerAnimated:YES];
        }];
        [controller addAction:action1];
        [self presentViewController:controller animated:YES completion:nil];
      
    }
}
-(void)repassword
{
    RepasswordController*repswcontroller=[[RepasswordController alloc]init];
    [self.navigationController pushViewController:repswcontroller animated:YES];
}
-(void)register
{
    RegisterController*registcontroller=[[RegisterController alloc]init];
    [self.navigationController pushViewController:registcontroller animated:YES];
}
-(void)backgesture
{
    UITapGestureRecognizer *tapGr=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(viewTapped:)];
    tapGr.cancelsTouchesInView=NO;
    [self.view addGestureRecognizer:tapGr];
}
-(void)viewTapped:(UITapGestureRecognizer *)tapGr
{
    [self.text_iphone resignFirstResponder];
    [self.text_password resignFirstResponder];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.text_iphone resignFirstResponder];
    [self.text_password resignFirstResponder];
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
