//
//  WoController.m
//  lvxing
//
//  Created by wd on 16-9-23.
//  Copyright (c) 2016年 wd. All rights reserved.
//

#import "WoController.h"
#import "InformationCell.h"
#import "MyselfController.h"
#import "SetController.h"
static NSString*KCellName1=@"cellname1";
@interface WoController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation WoController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor colorWithRed:238.0f green:238.0f blue:238.0f alpha:1];
    
    self.navigationController.navigationBarHidden=YES;
    [self.view addSubview:self.tableview];
    self.array1=[[NSArray alloc]init];
    self.array2=[[NSArray alloc]init];
    self.array3=[[NSArray alloc]init];
    self.array2=@[@"全部行程",@"我的订单"];
    self.array3=@[@"我的好友",@"设置"];
    self.array_image1=@[@"全部行程",@"我的订单"];
    self.array_image2=@[@"我的好友",@"设置"];
    //self.array_image1=[NSMutableArray arrayWithObjects:[UIImage imageNamed:@"全部行程"],[UIImage imageNamed:@"我的订单"], nil];
    //self.array_image2=[NSMutableArray arrayWithObjects:[UIImage imageNamed:@"设置"],[UIImage imageNamed:@"设置"], nil];
    //协议绑定
    self.tableview.delegate=self;
    self.tableview.dataSource=self;
    //固定taleview
    self.tableView.scrollEnabled=NO;
}
-(void)viewWillAppear:(BOOL)animated
{
    self.tableView.frame=CGRectMake(0.0f, 0.0f, [UIScreen mainScreen].bounds.size.width, 100.0f);
    
}
#pragma mark-getters
-(UITableView*)tableview
{
    if (!_tableview) {
        _tableview=[[UITableView alloc]init];
    }
    return _tableview;
}
#pragma mark-UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return 1;
    }
    else
    {
        return self.array2.count;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    InformationCell*cell=[tableView dequeueReusableCellWithIdentifier:KCellName1];
    if (cell==nil) {
        cell=[[InformationCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:KCellName1];
    }
    if (indexPath.section==0) {
        cell.image_ground.image=[UIImage imageNamed:@"图片"];
        cell.image_head.image=[UIImage imageNamed:@"叮当猫"];
        cell.label_name.text=@"Pokonyan";
        cell.label_sig.text=@"大熊～～～这是我听到最多的";
//        [cell.btn_information addTarget:self action:@selector(information) forControlEvents:UIControlEventTouchDown];
        [cell.image_ground addSubview:cell.image_head];
        [cell.image_ground addSubview:cell.label_name];
        [cell.image_ground addSubview:cell.label_sig];
        cell.image_ground.userInteractionEnabled=YES;
        UITapGestureRecognizer*tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(information:)];
        [cell.image_head addGestureRecognizer:tap];
        cell.image_head.userInteractionEnabled=YES;
    }
    if (indexPath.section==1) {
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;//添加右箭头
        cell.label.text=self.array2[indexPath.row];
        cell.viewimage.image=[UIImage imageNamed:self.array_image1[indexPath.row]];
        
        // UIImage*image=self.array_image1[indexPath.row];
        //CGSize size=cell.viewimage.frame.size;
        // cell.viewimage.image=[image imageByScalingToSize:size];
    }
    if (indexPath.section==2) {
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;//添加右箭头
        cell.label.text=self.array3[indexPath.row];
        cell.viewimage.image=[UIImage imageNamed:self.array_image2[indexPath.row]];
    }
    return cell;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
#pragma mark-UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        return 190.0f;
    }
    else
    {
        return 50.0f;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 40.0f;
}
//点击cell跳转界面
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //点击cell颜色不变
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (indexPath.section==2) {
        if (indexPath.row==1) {
            SetController *setcontroller=[[SetController alloc]init];
           // self.hidesBottomBarWhenPushed=YES;
            [self.navigationController pushViewController:setcontroller animated:YES];
            UIBarButtonItem*backbutton=[[UIBarButtonItem alloc]init];
            backbutton.title=@"设置";
            self.navigationItem.backBarButtonItem=backbutton;
            // self.navigationItem.backBarButtonItem.tintColor=[UIColor whiteColor];
        }
    }
}

-(void)information:(UITapGestureRecognizer*)tap
{
    self.hidesBottomBarWhenPushed=YES;
    MyselfController*mycontroller=[[MyselfController alloc]init];
    [self.navigationController pushViewController:mycontroller animated:YES];
    self.hidesBottomBarWhenPushed=NO;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
