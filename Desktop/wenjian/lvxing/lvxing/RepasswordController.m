//
//  RepasswordController.m
//  lvxing
//
//  Created by wd on 16-9-13.
//  Copyright (c) 2016年 wd. All rights reserved.
//

#import "RepasswordController.h"
#import "XSingleTon.h"
#import <sqlite3.h>
@interface RepasswordController ()<UITextFieldDelegate>
{
    sqlite3*db;
    int ok;
    char *msg;
    NSString*sql;
}
@end

@implementation RepasswordController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    XSingleTon*sx=[XSingleTon shareSingleton];
    db=[sx date];
    self.navigationController.navigationBarHidden=YES;
    [self.view addSubview:self.image_background];
    [self.view addSubview:self.image_tubiao];
    [self.view addSubview:self.btn_back];
    [self.view addSubview:self.field_phone];
    [self.view addSubview:self.field_newpsw];
    [self.view addSubview:self.field_renewpsw];
    [self.view addSubview:self.btn_modify];
    
    self.field_phone.delegate=self;
    self.field_newpsw.delegate=self;
    self.field_renewpsw.delegate=self;
    
    //点击空白处键盘返回
    [self backregesture];
}
-(void)viewWillAppear:(BOOL)animated
{
    CGFloat width=[UIScreen mainScreen].bounds.size.width;
    self.image_background.frame=self.view.bounds;
    self.btn_back.frame=CGRectMake(5.0f, 30.0f, 30.0f, 30.0f);
    self.image_tubiao.frame=CGRectMake((width-80)/2, 100.0f, 80.0f, 80.0f);
    self.field_phone.frame=CGRectMake(0.0f, 220.0f, width, 50.0f);
    self.field_newpsw.frame=CGRectMake(0.0f, 280.0f, width, 50.0f);
    self.field_renewpsw.frame=CGRectMake(0.0f, 340.0f, width, 50.0f);
    self.btn_modify.frame=CGRectMake(0.0f, 420.0f, width, 50.0f);
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
-(UIButton*)btn_back
{
    if (!_btn_back) {
        _btn_back=[[UIButton alloc]init];
        [_btn_back setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
        [_btn_back addTarget:self action:@selector(backpage) forControlEvents:UIControlEventTouchDown];
    }
    return _btn_back;
}
-(UITextField*)field_phone
{
    if (!_field_phone) {
        _field_phone=[[UITextField alloc]init];
        _field_phone.backgroundColor=[UIColor lightTextColor];
        UILabel*label=[[UILabel alloc]init];
        label.text=@"  手机号";
        label.textColor=[UIColor grayColor];
        label.font=[UIFont systemFontOfSize:15.0f];
        label.contentMode=UIViewContentModeCenter;
        _field_phone.leftView=label;
        _field_phone.leftView.backgroundColor=[UIColor clearColor];
        _field_phone.leftView.frame=CGRectMake(10.0f, 0.0f, 90.0f, 20.0f);
        _field_phone.leftViewMode=UITextFieldViewModeAlways;
    }
    return _field_phone;
}
-(UITextField*)field_newpsw
{
    if (!_field_newpsw) {
        _field_newpsw=[[UITextField alloc]init];
        _field_newpsw.backgroundColor=[UIColor lightTextColor];
        UILabel*label=[[UILabel alloc]init];
        label.text=@"  新密码";
        label.textColor=[UIColor grayColor];
        label.font=[UIFont systemFontOfSize:15.0f];
        _field_newpsw.leftView=label;
        _field_newpsw.leftView.backgroundColor=[UIColor clearColor];
        _field_newpsw.leftView.frame=CGRectMake(20.0f, 0.0f, 90.0f, 20.0f);
        _field_newpsw.leftViewMode=UITextFieldViewModeAlways;
    }
    return _field_newpsw;
}
-(UITextField*)field_renewpsw
{
    if (!_field_renewpsw) {
        _field_renewpsw=[[UITextField alloc]init];
        _field_renewpsw.backgroundColor=[UIColor lightTextColor];
        UILabel*label=[[UILabel alloc]init];
        label.text=@"  确认新密码";
        label.font=[UIFont systemFontOfSize:15.0f];
        label.textColor=[UIColor grayColor];
        _field_renewpsw.leftView=label;
        _field_renewpsw.leftView.frame=CGRectMake(20.0f, 0.0f, 90.0f, 20.0f);
        _field_renewpsw.leftView.backgroundColor=[UIColor clearColor];
        _field_renewpsw.leftViewMode=UITextFieldViewModeAlways;
        
    }
    return _field_renewpsw;
}
-(UIButton*)btn_modify
{
    if (!_btn_modify) {
        _btn_modify=[[UIButton alloc]init];
        [_btn_modify setTitle:@"确认修改" forState:UIControlStateNormal];
        [_btn_modify setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_btn_modify addTarget:self action:@selector(okmodify) forControlEvents:UIControlEventTouchDown];
    }
    return _btn_modify;
}

#pragma mark-调用方法
-(void)okmodify
{
    sqlite3_stmt*stmt;
    sql=[NSString stringWithFormat:@"select * from user where phone ='%@';",self.field_phone.text];
    sqlite3_prepare(db, [sql UTF8String], -1, &stmt, NULL);
    if (sqlite3_step(stmt)==SQLITE_ROW) {
        if (self.field_newpsw.text!=0) {
            sql=[NSString stringWithFormat:@"update user set password = '%@' where username='%@';",self.field_newpsw.text,self.field_phone.text];
            ok=sqlite3_exec(db, [sql UTF8String], NULL, NULL, &msg);
            if (ok!=SQLITE_OK) {
                NSLog(@"msg=%s",msg);
            }
        }
        else
        {
            UIAlertController*controller=[UIAlertController alertControllerWithTitle:@"修改失败" message:@"密码不为空" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction*action=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            [controller addAction:action];
            [self presentViewController:controller animated:YES completion:nil];
        }
    }
    else
    {
        UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"修改失败" message:@"用户名不存在" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction * action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [controller addAction:action1];
        [self presentViewController:controller animated:YES completion:nil];
    }
}
-(void)backpage
{
    [self.navigationController popViewControllerAnimated:YES];
}
//return键返回
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.field_phone resignFirstResponder];
    [self.field_newpsw resignFirstResponder];
    [self.field_renewpsw resignFirstResponder];
    return YES;
}
//点击空白处返回
-(void)backregesture
{
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(backresign:)];
    tap.cancelsTouchesInView=NO;
    [self.view addGestureRecognizer:tap];
}
-(void)backresign:(UITapGestureRecognizer*)tap
{
    
    [self.field_phone resignFirstResponder];
    [self.field_newpsw resignFirstResponder];
    [self.field_renewpsw resignFirstResponder];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
