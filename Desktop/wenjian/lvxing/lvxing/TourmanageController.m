//
//  TourmanageController.m
//  lvxing
//
//  Created by wd on 16-9-21.
//  Copyright (c) 2016年 wd. All rights reserved.
//

#import "TourmanageController.h"
#import "InitController.h"
#import "ChoosefirstController.h"
#import "ChoosesecondController.h"
@interface TourmanageController ()<UIScrollViewDelegate>

@end

@implementation TourmanageController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationItem.title=@"行程管理";
    //navigation title颜色
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    [self setupScrollView];
    [self setupPageControl];
    
    [self.view addSubview:self.btn_tour];
    [self.view addSubview:self.btn_op];
    [self.view addSubview:self.imageview];
    [self.view addSubview:self.label];
    [self.view addSubview:self.image_choose];
    [self.image_choose addSubview:self.lable_choose1];
    [self.image_choose addSubview:self.label_choose2];
    [self.view addSubview:self.image_1];
    [self.view addSubview:self.image_2];
    [self.view addSubview:self.image_add];
    [self.view addSubview:self.image_ground];
    
    self.image_ground.hidden=YES;
}
-(void)setupScrollView
{
    //添加scrollview
    CGFloat width1=[UIScreen mainScreen].bounds.size.width;
    UIScrollView*scrollView=[[UIScrollView alloc]init];
    scrollView.frame=CGRectMake(0.0f, 0.0f, width1, 200.0f);
    CGFloat contentW=width1*3;
    [self.view addSubview:scrollView];
    scrollView.contentSize=CGSizeMake(contentW, 0);
    scrollView.pagingEnabled=YES;
    //scrollView.bounces=NO;
    scrollView.showsHorizontalScrollIndicator=NO;
    scrollView.delegate=self;
    //添加图片
    self.image1=[[UIImageView alloc]init];
    self.image1.frame=CGRectMake(0*width1, 0,width1, 140);
    self.image1.image=[UIImage imageNamed:@"banner1"];
    [scrollView addSubview:self.image1];
    
    self.image2=[[UIImageView alloc]init];
    self.image2.frame=CGRectMake(1*width1, 0, width1, 140.0f);
    self.image2.image=[UIImage imageNamed:@"晶格背景"];
    [scrollView addSubview:self.image2];
    
    self.image3=[[UIImageView alloc]init];
    self.image3.frame=CGRectMake(2*width1, 0, width1, 140.0f);
    self.image3.image=[UIImage imageNamed:@"图片"];
    [scrollView addSubview:self.image3];
}
-(void)setupPageControl
{
    UIPageControl*pagecontrol=[[UIPageControl alloc]init];
    pagecontrol.numberOfPages=3;
    pagecontrol.pageIndicatorTintColor=[UIColor grayColor];
    pagecontrol.currentPageIndicatorTintColor=[UIColor whiteColor];
    CGFloat width=[UIScreen mainScreen].bounds.size.width;
    pagecontrol.center=CGPointMake(width*0.5, 190);
    pagecontrol.bounds=CGRectMake(0.0f, 0.0f, 100.0f, 30.0f);
    [self.view addSubview:pagecontrol];
    self.pagecontrol=pagecontrol;
}
#pragma mark-UIScrollviewDelegate method
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetX=scrollView.contentOffset.x;
    int page=offsetX/scrollView.bounds.size.width+0.5;
    self.pagecontrol.currentPage=page;
}

-(void)viewWillAppear:(BOOL)animated
{
    CGFloat width=[UIScreen mainScreen].bounds.size.width;
    CGFloat height=[UIScreen mainScreen].bounds.size.height;
    self.btn_tour.frame=CGRectMake(10.0f, 210.0f, 60.0f, 20.0f);
    self.btn_op.frame=CGRectMake(70.0f, 210.0f, 20.0f, 20.0f);
    self.imageview.frame=CGRectMake((width-140)/2, 240.0f, 140.0f, 140.0f);
    self.label.frame=CGRectMake((width-80)/2, 300.0f, 80.0f, 20.0f);
    self.image_choose.frame=CGRectMake(10.0f, 390.0f, 30.0f, 50.0f);
    self.lable_choose1.frame=CGRectMake(5.0f, 7.0f, 20.0f, 20.0f);
    self.label_choose2.frame=CGRectMake(5.0f, 23.0f, 20.0f, 20.0f);
    self.image_1.frame=CGRectMake(10.0f, 450.0f, (width/2)-15, 110.0f);
    self.image_2.frame=CGRectMake((width/2)+5, 450.0f, (width/2)-15, 110.0f);
    self.image_add.frame=CGRectMake(20.0f, 565.0f, 50.0f, 50.0f);
    
    self.image_pop.frame=CGRectMake(20.0f, 120.0f, 50.0f, 50.0f);
    self.image_ground.frame=CGRectMake(0.0f, (height+223), width, 223.0f);
    self.image_time.frame=CGRectMake(20.0f, 40.0f, 40.0f, 40.0f);
    self.label_time.frame=CGRectMake(20.0f, 90.0f, 45.0f, 20.0f);
    self.image_re.frame=CGRectMake(90.0f, 40.0f, 40.0f, 40.0f);
    self.label_re.frame=CGRectMake(90.0f, 90.0f, 45.0f, 20.0f);
    self.image_new.frame=CGRectMake(160.0f, 40.0f, 40.0f, 40.0f);
    self.label_new.frame=CGRectMake(160.0f, 90.0f, 45.0f, 20.0f);
    self.image_favour.frame=CGRectMake(230.0f, 40.0f, 40.0f, 40.0f);
    self.label_favour.frame=CGRectMake(230.0f, 90.0f, 45.0f, 20.0f);
    self.image_suggest.frame=CGRectMake(300.0f, 40.0f, 40.0f, 40.0f);
    self.label_suggest.frame=CGRectMake(300.0f, 90.0f, 45.0f, 20.0f);
}
#pragma mark-getters
-(UIButton*)btn_tour
{
    if (!_btn_tour) {
        _btn_tour=[[UIButton alloc]init];
        [_btn_tour setTitle:@"我的行程" forState:UIControlStateNormal];
        [_btn_tour setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        _btn_tour.titleLabel.font=[UIFont systemFontOfSize:13.0f];
        _btn_tour.titleLabel.textAlignment=NSTextAlignmentLeft;
        [_btn_tour addTarget:self action:@selector(tour) forControlEvents:UIControlEventTouchDown];
    }
    return _btn_tour;
}
-(UIButton*)btn_op
{
    if (!_btn_op) {
        _btn_op=[[UIButton alloc]init];
        [_btn_op setImage:[UIImage imageNamed:@"展开三角"] forState:UIControlStateNormal];
        [_btn_op addTarget:self action:@selector(tour) forControlEvents:UIControlEventTouchDown];
    }
    return _btn_op;
}
-(UIImageView*)imageview
{
    if (!_imageview) {
        _imageview=[[UIImageView alloc]init];
        _imageview.image=[UIImage imageNamed:@"行程表盘"];
    }
    return _imageview;
}
-(UILabel*)label
{
    if (!_label) {
        _label=[[UILabel alloc]init];
        _label.text=@"1780Km";
        _label.textColor=[UIColor blueColor];
        _label.font=[UIFont systemFontOfSize:20.0f];
        _label.textAlignment=NSTextAlignmentCenter;
        
    }
    return _label;
}
-(UIImageView*)image_choose
{
    if (!_image_choose) {
        _image_choose=[[UIImageView alloc]init];
        _image_choose.image=[UIImage imageNamed:@"精选底纹"];
    }
    return _image_choose;
}
-(UILabel*)lable_choose1
{
    if (!_lable_choose1) {
        _lable_choose1=[[UILabel alloc]init];
        _lable_choose1.text=@"精";
        _lable_choose1.textColor=[UIColor whiteColor];
        _lable_choose1.font=[UIFont systemFontOfSize:13.0f];
    }
    return _lable_choose1;
}
-(UILabel*)label_choose2
{
    if (!_label_choose2) {
        _label_choose2=[[UILabel alloc]init];
        _label_choose2.text=@"选";
        _label_choose2.textColor=[UIColor whiteColor];
        _label_choose2.font=[UIFont systemFontOfSize:13.0f];
    }
    return _label_choose2;
}
-(UIImageView*)image_1
{
    if (!_image_1) {
        _image_1=[[UIImageView alloc]init];
        _image_1.image=[UIImage imageNamed:@"图1"];
        _image_1.userInteractionEnabled=YES;
        UITapGestureRecognizer*tap1=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapgesture:)];
        [_image_1 addGestureRecognizer:tap1];
    }
    return _image_1;
}
-(UIImageView*)image_2
{
    if (!_image_2) {
        _image_2=[[UIImageView alloc]init];
        _image_2.image=[UIImage imageNamed:@"图2"];
        _image_2.userInteractionEnabled=YES;
        _image_2.userInteractionEnabled=YES;
        UITapGestureRecognizer*tap2=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapgesture1:)];
        [_image_2 addGestureRecognizer:tap2];
    }
    return _image_2;
}
-(UIImageView*)image_add
{
    if (!_image_add) {
        _image_add=[[UIImageView alloc]init];
        _image_add.image=[UIImage imageNamed:@"加号"];
        _image_add.userInteractionEnabled=YES;
        UITapGestureRecognizer*tap3=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapgesture2:)];
        [_image_add addGestureRecognizer:tap3];
    }
    return _image_add;
}
-(UIImageView*)image_ground
{
    if (!_image_ground) {
        _image_ground=[[UIImageView alloc]init];
        _image_ground.image=[UIImage imageNamed:@"展开框底纹"];
        
    }
    return _image_ground;
}

-(UIImageView*)image_pop
{
    if (!_image_pop) {
        _image_pop=[[UIImageView alloc]init];
        _image_pop.image=[UIImage imageNamed:@"关闭"];
        _image_pop.userInteractionEnabled=YES;
        UITapGestureRecognizer*tap4=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapgesture3:)];
        [_image_pop addGestureRecognizer:tap4];
    }
    return _image_pop;
}

-(UIImageView*)image_time
{
    if (!_image_time) {
        _image_time=[[UIImageView alloc]init];
        _image_time.image=[UIImage imageNamed:@"实时路况"];
    }
    return _image_time;
}
-(UIImageView*)image_re
{
    if (!_image_re) {
        _image_re=[[UIImageView alloc]init];
        _image_re.image=[UIImage imageNamed:@"修改行程"];
    }
    return _image_re;
}
-(UIImageView*)image_new
{
    if (!_image_new) {
        _image_new=[[UIImageView alloc]init];
        _image_new.image=[UIImage imageNamed:@"修改行程"];
    }
    return _image_new;
}
-(UIImageView*)image_favour
{
    if (!_image_favour) {
        _image_favour=[[UIImageView alloc]init];
        _image_favour.image=[UIImage imageNamed:@"我的收藏"];
    }
    return _image_favour;
}
-(UIImageView*)image_suggest
{
    if (!_image_suggest) {
        _image_suggest=[[UIImageView alloc]init];
        _image_suggest.image=[UIImage imageNamed:@"周边推荐"];
    }
    return _image_suggest;
}
-(UILabel*)label_time
{
    if (!_label_time) {
        _label_time=[[UILabel alloc]init];
        _label_time.text=@"实时路况";
        _label_time.font=[UIFont systemFontOfSize:11.0f];
        _label_time.textColor=[UIColor grayColor];
        _label_time.textAlignment=NSTextAlignmentCenter;
    }
    return _label_time;
}
-(UILabel*)label_re
{
    if (!_label_re) {
        _label_re=[[UILabel alloc]init];
        _label_re.text=@"修改行程";
        _label_re.font=[UIFont systemFontOfSize:11.0f];
        _label_re.textColor=[UIColor grayColor];
        _label_re.textAlignment=NSTextAlignmentCenter;

    }
    return _label_re;
}
-(UILabel*)label_new
{
    if (!_label_new) {
        _label_new=[[UILabel alloc]init];
        _label_new.text=@"刷新行程";
        _label_new.font=[UIFont systemFontOfSize:11.0f];
        _label_new.textColor=[UIColor grayColor];
        _label_new.textAlignment=NSTextAlignmentCenter;

    }
    return _label_new;
}
-(UILabel*)label_favour
{
    if (!_label_favour) {
        _label_favour=[[UILabel alloc]init];
        _label_favour.text=@"我的收藏";
        _label_favour.font=[UIFont systemFontOfSize:11.0f];
        _label_favour.textColor=[UIColor grayColor];
        _label_favour.textAlignment=NSTextAlignmentCenter;

    }
    return _label_favour;
}
-(UILabel*)label_suggest
{
    if (!_label_suggest) {
        _label_suggest=[[UILabel alloc]init];
        _label_suggest.text=@"周边推荐";
        _label_suggest.font=[UIFont systemFontOfSize:11.0f];
        _label_suggest.textColor=[UIColor grayColor];
        _label_suggest.textAlignment=NSTextAlignmentCenter;

    }
    return _label_suggest;
}
#pragma mark-调用方法
-(void)tour
{
    NSLog(@"111");
}
-(void)tapgesture:(UIGestureRecognizer*)tap1
{
    ChoosefirstController*controller1=[[ChoosefirstController alloc]init];
    [self.navigationController pushViewController:controller1 animated:YES];
}
-(void)tapgesture1:(UIGestureRecognizer*)tap2
{
    ChoosesecondController*controller2=[[ChoosesecondController alloc]init];
    [self.navigationController pushViewController:controller2 animated:YES];
}
-(void)tapgesture2:(UITapGestureRecognizer*)tap3
{
    
    [UIView animateWithDuration:0.5 animations:^{
        CGFloat width=[UIScreen mainScreen].bounds.size.width;
        CGFloat height=[UIScreen mainScreen].bounds.size.height;
        self.image_ground.frame=CGRectMake(0.0f, (height-223), width, 223.0f);
    }];
    self.image_1.userInteractionEnabled=NO;
    self.image_2.userInteractionEnabled=NO;
    
    self.image_ground.hidden=NO;
    self.image_ground.userInteractionEnabled=YES;
    [self.image_ground addSubview:self.image_pop];
    [self.image_ground addSubview:self.image_time];
    [self.image_ground addSubview:self.image_re];
    [self.image_ground addSubview:self.image_new];
    [self.image_ground addSubview:self.image_favour];
    [self.image_ground addSubview:self.image_suggest];
    [self.image_ground addSubview:self.label_time];
    [self.image_ground addSubview:self.label_re];
    [self.image_ground addSubview:self.label_new];
    [self.image_ground addSubview:self.label_favour];
    [self.image_ground addSubview:self.label_suggest];
}
-(void)tapgesture3:(UITapGestureRecognizer*)tap4
{
    [UIView animateWithDuration:0.5 animations:^{
        CGFloat width=[UIScreen mainScreen].bounds.size.width;
        CGFloat height=[UIScreen mainScreen].bounds.size.height;
        self.image_ground.frame=CGRectMake(0.0f, (height+223), width, 223.0f);
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
