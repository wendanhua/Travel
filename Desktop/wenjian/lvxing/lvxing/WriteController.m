//
//  WriteController.m
//  lvxing
//
//  Created by wd on 16/10/11.
//  Copyright © 2016年 wd. All rights reserved.
//

#import "WriteController.h"
#import "WriteCell.h"
static NSString*CellName=@"cellname";
@interface WriteController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>

@end

@implementation WriteController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationController.navigationBarHidden=YES;
    [self.view addSubview:self.tableview];
    self.tableview.dataSource=self;
    self.tableview.delegate=self;
}
-(void)viewDidAppear:(BOOL)animated
{
    CGFloat width=[UIScreen mainScreen].bounds.size.width;
    CGFloat height=[UIScreen mainScreen].bounds.size.height;
    self.image_ground.frame=CGRectMake(0.0f, 0.0f, width, height);
    self.image_bottom.frame=CGRectMake(0.0f, 0.0f, width, height);
    self.tableview.frame=CGRectMake(0.0f, 0.0f, width,height);
}
#pragma mark-getters
-(UIImageView*)image_ground
{
    if (!_image_ground) {
        _image_ground=[[UIImageView alloc]init];
        _image_ground.image=[UIImage imageNamed:@"BG"];
        [_image_ground addSubview:self.image_bottom];
    }
    return _image_ground;
}
-(UIImageView*)image_bottom
{
    if (!_image_bottom) {
        _image_bottom=[[UIImageView alloc]init];
        _image_bottom.image=[UIImage imageNamed:@"底纹-1"];
    }
    return _image_bottom;
}
-(UITableView*)tableview
{
    if (!_tableview) {
        _tableview=[[UITableView alloc]init];
        _tableview.backgroundView=self.image_ground;
    }
    return _tableview;
}
#pragma mark-UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WriteCell*cell=[tableView dequeueReusableCellWithIdentifier:CellName];
    if (cell==NULL) {
        cell=[[WriteCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellName];
    }
    cell.backgroundColor=[UIColor clearColor];
    if (indexPath.row==0) {
        [cell.btn_cancle setTitle:@"取消" forState:UIControlStateNormal];
        [cell.btn_cancle addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchDown];
        [cell.btn_ok setTitle:@"发表" forState:UIControlStateNormal];
        [cell.btn_ok addTarget:self action:@selector(go) forControlEvents:UIControlEventTouchDown];
        [cell.btn_add setImage:[UIImage imageNamed:@"添加"] forState:UIControlStateNormal];
        [cell.btn_add addTarget:self action:@selector(photo) forControlEvents:UIControlEventTouchDown];
        cell.textview.delegate=self;
    }
    if (indexPath.row==1) {
        cell.label.text=@"地点";
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;//添加右箭头
    }
    if (indexPath.row==2) {
        cell.label.text=@"谁能看见";
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;//添加右箭头
    }
    
    return cell;
}
#pragma mark-UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        return 280.0f;
    }
    else
    {
        return 40.0f;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}
#pragma mark-调用方法
-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
    self.navigationController.navigationBarHidden=NO;
}
-(void)go
{
    
}
-(void)photo
{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
