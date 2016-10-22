//
//  MyselfController.m
//  lvxing
//
//  Created by wd on 16-9-12.
//  Copyright (c) 2016年 wd. All rights reserved.
//

#import "MyselfController.h"
#import "MyselfCell.h"
static NSString*KCellName=@"cellname";
@interface MyselfController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation MyselfController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:self.image_navi];
    [self.view addSubview:self.tableview];
    [self.image_navi addSubview:self.btn_back];

    self.array2=[NSArray array];
    self.array2=@[@"性别",@"地区",@"个性签名"];
    
    self.tableview.delegate=self;
    self.tableview.dataSource=self;
}
-(void)viewWillAppear:(BOOL)animated
{
    CGFloat width=[UIScreen mainScreen].bounds.size.width;
    CGFloat height=[UIScreen mainScreen].bounds.size.height;
    
    self.btn_back.frame=CGRectMake(5.0f, 30.0f, 30.0f, 30.0f);
    self.image_navi.frame=CGRectMake(0.0f, 0.0f, width, 64.0f);
    self.tableview.frame=CGRectMake(0.0f, 64.0f, width, height);
}
#pragma mark-getters
-(UITableView*)tableview
{
    if (!_tableview) {
        _tableview=[[UITableView alloc]init];
        _tableview.backgroundColor=[UIColor lightTextColor];
    }
    return _tableview;
}
-(UIButton*)btn_back
{
    if (!_btn_back) {
        _btn_back=[[UIButton alloc]init];
        [_btn_back setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
        [_btn_back addTarget:self action:@selector(btnf) forControlEvents:UIControlEventTouchDown];
    }
    return _btn_back;
}
-(UIImageView*)image_navi
{
    if (!_image_navi) {
        _image_navi=[[UIImageView alloc]init];
        _image_navi.image=[UIImage imageNamed:@"图片"];
        _image_navi.userInteractionEnabled=YES;
    }
    return _image_navi;
}
-(void)btnf
{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark-DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyselfCell*cell=[tableView dequeueReusableCellWithIdentifier:KCellName];
    if (cell==nil) {
        cell=[[MyselfCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:KCellName];
    }
    
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            cell.label_head.text=@"头像";
            cell.image_head.image=[UIImage imageNamed:@"叮当猫"];
        }
        if (indexPath.row==1) {
            cell.label.text=@"昵称";
            cell.lab.text=@"Pokonyan";
        }
        if (indexPath.row==2) {
            cell.label.text=@"手机号";
            cell.lab.text=@"未登录";
        }
    }
    if (indexPath.section==1) {
        cell.label.text=self.array2[indexPath.row];
        if (indexPath==0) {
            cell.lab.text=@"女";
        }
        if (indexPath.row==1) {
            cell.lab.text=@"中国";
        }
        if (indexPath.row==2) {
            cell.lab.text=@"为填写";
        }
    }
    return cell;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
#pragma mark-Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            return 60.0f;
        }
        else
        {
            return 50.0f;
        }
    }
    else
    {
        return 50.0f;
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section;
{
    return 20.0f;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
