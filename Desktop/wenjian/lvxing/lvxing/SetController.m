//
//  SetController.m
//  lvxing
//
//  Created by wd on 16-9-12.
//  Copyright (c) 2016年 wd. All rights reserved.
//

#import "SetController.h"
#import "SetCell.h"
#import "RepswController.h"
#import "AboutController.h"
#import "SuggestController.h"
#import "LoginController.h"
static NSString*KCellName=@"kcellname";
@interface SetController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation SetController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.viewtable];
    [self.view addSubview:self.btn_login];
    [self.view addSubview:self.btn_back];
    
    self.array1=[NSArray array];
    self.array2=[NSArray array];
    self.array1=@[@"密码设置",@"关于我们"];
    self.array2=@[@"反馈建议",@"清除缓存"];
    
    self.viewtable.delegate=self;
    self.viewtable.dataSource=self;
    //固定taleview
    self.viewtable.scrollEnabled=NO;
}
-(void)viewWillAppear:(BOOL)animated
{
    CGFloat width=[UIScreen mainScreen].bounds.size.width;
    CGFloat hight=[UIScreen mainScreen].bounds.size.height;
    self.btn_login.frame=CGRectMake((width-150)/2, 100.0f, 150.0f, 35.0f);
    self.viewtable.frame=CGRectMake(0.0f, 184.0f, width, hight);
    self.btn_back.frame=CGRectMake(5.0f, 30.0f, 30.0f, 30.0f);
}
#pragma mark-getters
-(UITableView*)viewtable
{
    if (!_viewtable) {
        _viewtable=[[UITableView alloc]init];
        _viewtable.backgroundColor=[UIColor lightTextColor];
        _viewtable.scrollEnabled=YES;
    }
    return _viewtable;
}
-(UIButton*)btn_login
{
    if (!_btn_login) {
        _btn_login=[[UIButton alloc]init];
        [_btn_login setTitle:@"登录/注册" forState:UIControlStateNormal];
        [_btn_login setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _btn_login.layer.cornerRadius=8.0f;
       // _btn_login.backgroundColor=[UIColor blueColor];
        [_btn_login.layer setBorderWidth:1.0f];//边框宽度
        //边框颜色
        CGColorSpaceRef colorspace=CGColorSpaceCreateDeviceRGB();
        CGColorRef colorref=CGColorCreate(colorspace, (CGFloat[]){0.1,0.7,0.7,1});
        [_btn_login.layer setBorderColor:colorref];
        [_btn_login addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchDown];
    }
    return _btn_login;
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
    [self.navigationController popToRootViewControllerAnimated:YES];
}
-(void)login
{
    LoginController*logincontroller=[[LoginController alloc]init];
    [self.navigationController pushViewController:logincontroller animated:YES];
    //隐藏导航栏
    self.navigationController.navigationBarHidden=YES;
}
#pragma mark-dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==2)
    {
        return 1;
    }
    else
    {
    return self.array1.count;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SetCell*cell=[tableView dequeueReusableCellWithIdentifier:KCellName];
    if (cell==nil) {
        cell=[[SetCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:KCellName];
        cell.lable_set.text=@"111";
    }
    if (indexPath.section==0) {
        cell.lable_set.text=self.array1[indexPath.row];
    }
    if (indexPath.section==1) {
        cell.lable_set.text=self.array2[indexPath.row];
    }
    if (indexPath.section==2) {
        cell.lable_set.text=@"退出当前账号";
    }
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;//添加右箭头
    return cell;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
#pragma mark-delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40.0f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20.0f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section==2) {
        return 40.0f;
    }
    else
    {
        return 0;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            RepswController*recontroller=[[RepswController alloc]init];
            [self.navigationController pushViewController:recontroller animated:YES];
            UIBarButtonItem*backbtn=[[UIBarButtonItem alloc]init];
            backbtn.title=@"密码重置";
            self.navigationItem.backBarButtonItem=backbtn;
        }
        if (indexPath.row==1) {
            AboutController*aboutcontroller=[[AboutController alloc]init];
            [self.navigationController pushViewController:aboutcontroller animated:YES];
            UIBarButtonItem*backbtn=[[UIBarButtonItem alloc]init];
            backbtn.title=@"关于我们";
            self.navigationItem.backBarButtonItem=backbtn;
        }
    }
    if (indexPath.section==1) {
        if (indexPath.row==0) {
            SuggestController*sugcontroller=[[SuggestController alloc]init];
            [self.navigationController pushViewController:sugcontroller animated:YES];
            UIBarButtonItem*backbtn=[[UIBarButtonItem alloc]init];
            backbtn.title=@"反馈建议";
            self.navigationItem.backBarButtonItem=backbtn;
        }
        if (indexPath.row==1) {
            UIAlertController*controller=[UIAlertController alertControllerWithTitle:@"" message:@"将清除所有缓存" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction*action1=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
                
            }];
            UIAlertAction*action2=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                
            }];
            [controller addAction:action1];
            [controller addAction:action2];
            [self presentViewController:controller animated:YES completion:nil];
        }
    }
    if (indexPath.section==2) {
        UIAlertController*controller=[UIAlertController alertControllerWithTitle:@"退出当前账号" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction*action1=[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            
        }];
        UIAlertAction*action2=[UIAlertAction actionWithTitle:@"确认退出" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
             
        }];
        [controller addAction:action1];
        [controller addAction:action2];
        [self presentViewController:controller animated:YES completion:nil];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
