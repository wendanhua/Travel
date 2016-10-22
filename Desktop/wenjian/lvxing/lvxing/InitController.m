//
//  InitViewController.m
//  lvxing
//
//  Created by wd on 16-9-9.
//  Copyright (c) 2016年 wd. All rights reserved.
//

#import "InitController.h"
#import "TourPhotoController.h"
#import "TourJourneyController.h"
#import "TourNavigationController.h"
#import "TourmanageController.h"
#import "ImpressController.h"
#import "AddJourneyController.h"
#import "CodeController.h"
#import "AreaController.h"
#import "AAController.h"
//获取RGB颜色
#define XXColor(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1.0]

@interface InitController ()
@end
@implementation InitController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //[self.view addSubview:self.view_scrol];
    self.navigationController.navigationBarHidden=YES;
    self.tabBarController.tabBar.hidden=YES;
    
    self.image_background.hidden=YES;
    //self.imageview.hidden=YES;
    self.image_photo.hidden=YES;
    self.image_journey.hidden=YES;
    self.image_navigation.hidden=YES;
    self.image_manage.hidden=YES;
    self.image_jia.hidden=YES;
    self.image_impress.hidden=YES;
    self.image_addjourney.hidden=YES;
    self.image_back.hidden=YES;
    //启动页
    [self setupScrollView];
    
    [self.view addSubview:self.image_background];
    //添加跳转的四个imageview
    [self.view addSubview:self.image_photo];
    [self.view addSubview:self.image_journey];
    [self.view addSubview:self.image_navigation];
    [self.view addSubview:self.image_manage];
    //imageview上加载图片
    [self.image_photo addSubview:self.image_first];
    [self.image_photo addSubview:self.lab_first];
    [self.image_journey addSubview:self.image_second];
    [self.image_journey addSubview:self.lab_second];
    [self.image_navigation addSubview:self.image_third];
    [self.image_navigation addSubview:self.lab_third];
    [self.image_manage addSubview:self.image_forth];
    [self.image_manage addSubview:self.lab_forth];
    
    [self.view addSubview:self.image_jia];
    
    [self.image addSubview:self.image_impress];
    [self.image_impress addSubview:self.im_impress];
    
    [self.image addSubview:self.image_addjourney];
    [self.image_addjourney addSubview:self.im_addjourney];
    
    [self.image addSubview:self.lab_impress];
    [self.image addSubview:self.lab_addjourney];
    [self.image addSubview:self.image_back];
}

//初始化scrollView
-(void)setupScrollView
{
    //添加scrollView
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    scrollView.frame = self.view.bounds;
    CGFloat contentW = scrollView.bounds.size.width *3;
    [self.view addSubview:scrollView];
    scrollView.contentSize = CGSizeMake(contentW, 0);
    scrollView.pagingEnabled = YES;
    scrollView.bounces = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.delegate = self;
    //添加图片
    CGFloat imageW= scrollView.bounds.size.width;
    CGFloat imageH= scrollView.bounds.size.height;
    self.image1 = [[UIImageView alloc]init];
    self.image1.frame = CGRectMake(0* imageW, 0, imageW, imageH-30);
    self.image1.image = [UIImage imageNamed:@"引导页2-01"];
    [scrollView addSubview:self.image1];
    self.image2 = [[UIImageView alloc]init];
    self.image2.frame = CGRectMake(1* imageW, 0, imageW, imageH-30);
    self.image2.image = [UIImage imageNamed:@"引导1-01"];
    [scrollView addSubview:self.image2];
    self.image3 = [[UIImageView alloc]init];
    self.image3.frame = CGRectMake(2* imageW, 0, imageW, imageH-30);
    self.image3.image = [UIImage imageNamed:@"引导3-01"];
    self.image3.userInteractionEnabled = YES;
    [scrollView addSubview:self.image3];
    
    //添加跳转按钮
    self.btn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btn.frame = CGRectMake(0.0f, 100.0f, 100.0f, 30.0f);
    [self.btn setTitle:@"GO !!!" forState:UIControlStateNormal];
    [self.btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.btn.layer.borderColor = [UIColor colorWithWhite:0.915 alpha:0.000].CGColor;
    self.btn.titleLabel.font = [UIFont systemFontOfSize:17.0f];
    [self.btn addTarget:self action:@selector(hiddenview) forControlEvents:UIControlEventTouchUpInside];
    CGFloat centerX = self.image3.bounds.size.width*0.5;
    CGFloat centerY = self.image3.bounds.size.height - 65.0f;
    self.btn.center = CGPointMake(centerX, centerY);
    [self.image3 addSubview:self.btn];
}
-(void)hiddenview
{
    self.scroll.hidden=YES;
    self.image1.hidden=YES;
    self.image2.hidden=YES;
    self.image3.hidden=YES;
    self.navigationController.navigationBarHidden=NO;
    self.tabBarController.tabBar.hidden=NO;
    self.image_background.hidden=NO;
    self.image_photo.hidden=NO;
    self.image_journey.hidden=NO;
    self.image_navigation.hidden=NO;
    self.image_manage.hidden=NO;
    self.image_jia.hidden=NO;
    //navigationbar背景
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"晶格背景"]forBarMetrics:UIBarMetricsDefault];
    //navigationbar
    UIBarButtonItem*rightButton=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"扫描"] style:UIBarButtonItemStylePlain target:self action:@selector(Search)];
    self.navigationItem.rightBarButtonItem=rightButton;
    UIBarButtonItem*leftButton=[[UIBarButtonItem alloc]initWithTitle:@"天津" style:UIBarButtonItemStylePlain target:self action:@selector(area)];
    self.navigationItem.leftBarButtonItem=leftButton;
    UIBarButtonItem*backbutton=[[UIBarButtonItem alloc]init];
    backbutton.title=@" ";
    self.navigationItem.backBarButtonItem=backbutton;
    //self.navigationItem.leftBarButtonItem=self.btn_area;
    [[UINavigationBar appearance]setTintColor:[UIColor whiteColor]];
}

-(void)viewWillAppear:(BOOL)animated
{
    CGFloat width=[UIScreen mainScreen].bounds.size.width;
    CGFloat height=[UIScreen mainScreen].bounds.size.height;
    self.image_background.frame=CGRectMake(0.0f, 64.0f, width, (height-64));
    //跳转图片的加载
    self.image_photo.frame=CGRectMake(193.0f, 130.0f, 145.0f, 167.0f);
    self.image_first.frame=CGRectMake(46.0f, 32.0f, 52.0f, 37.0f);
    self.lab_first.frame=CGRectMake(46.0f, 86.0f, 59.0f, 21.0f);
    self.image_journey.frame=CGRectMake(67.0f, 167.0f, 118.0f, 128.0f);
    self.image_second.frame=CGRectMake(36.0f, 26.0f, 46.0f, 37.0f);
    self.lab_second.frame=CGRectMake(36.0f, 79.0f, 57.0f, 21.0f);
    self.image_navigation.frame=CGRectMake(37.0f, 303.0f, 148.0f, 134.0f);
    self.image_third.frame=CGRectMake(49.0f, 22.0f, 51.0f, 38.0f);
    self.lab_third.frame=CGRectMake(46.0f, 76.0f, 57.0f, 21.0f);
    self.image_manage.frame=CGRectMake(193.0f, 290.0f, 105.0f, 97.0f);
    self.image_forth.frame=CGRectMake(38.0f, 18.0f, 29.0f, 29.0f);
    self.lab_forth.frame=CGRectMake(23.0f, 55.0f, 59.0f, 21.0f);
    
    self.image_jia.frame=CGRectMake(20.0f, (height-150), 50.0f, 50.0f);
    //加号跳转的第二个imageview
    self.image.frame=CGRectMake(0, (2*height), width, height);
    self.image_impress.frame=CGRectMake(193.0f, 248.0f, 113.0f, 113.0f);
    self.im_impress.frame=CGRectMake(36.0f, 34.0f, 40.0f, 46.0f);
    self.lab_impress.frame=CGRectMake(229.0f, 369.0f, 60.0f, 24.0f);
    self.image_addjourney.frame=CGRectMake(55.0f, 248.0f, 113.0f, 113.0f);
    self.im_addjourney.frame=CGRectMake(31.0f, 34.0f, 55.0f, 46.0f);
    self.lab_addjourney.frame=CGRectMake(96.0f, 369.0f, 60.0f, 24.0f);
    self.image_back.frame=CGRectMake(20.0f, (height-150), 50.0f, 50.0f);
}
#pragma mark-getters
-(UIImageView *)image_background
{
    if (!_image_background) {
        _image_background=[[UIImageView alloc]init];
        _image_background.image=[UIImage imageNamed:@"首页背景"];
    }
    return _image_background;
}
-(UIImageView*)image_photo
{
    if (!_image_photo) {
        _image_photo=[[UIImageView alloc]init];
        _image_photo.image=[UIImage imageNamed:@"图集底纹"];
      
        //增加手势，图片跳转
        _image_photo.userInteractionEnabled=YES;
        UITapGestureRecognizer*tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(click:)];
        tap.cancelsTouchesInView=NO;
        [self.image_photo addGestureRecognizer:tap];
    }
    return _image_photo;
}
-(UIImageView*)image_first
{
    if (!_image_first) {
        _image_first=[[UIImageView alloc]init];
        _image_first.image=[UIImage imageNamed:@"旅行图集"];
    }
    return _image_first;
}
-(UILabel*)lab_first
{
    if (!_lab_first) {
        _lab_first=[[UILabel alloc]init];
        _lab_first.text=@"旅行图集";
        _lab_first.font=[UIFont systemFontOfSize:13.0f];
        _lab_first.textColor=[UIColor whiteColor];
    }
    return _lab_first;
}
-(UIImageView*)image_journey
{
    if (!_image_journey) {
        _image_journey=[[UIImageView alloc]init];
        _image_journey.image=[UIImage imageNamed:@"旅行行程底纹"];
       
        _image_journey.userInteractionEnabled=YES;
        UITapGestureRecognizer*tap1=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(click1:)];
        tap1.cancelsTouchesInView=NO;
        [self.image_journey addGestureRecognizer:tap1];
    }
    return _image_journey;
}
-(UIImageView*)image_second
{
    if (!_image_second) {
        _image_second=[[UIImageView alloc]init];
        _image_second.image=[UIImage imageNamed:@"旅行行程"];
    }
    return _image_second;
}
-(UILabel*)lab_second
{
    if (!_lab_second) {
        _lab_second=[[UILabel alloc]init];
        _lab_second.text=@"旅行行程";
        _lab_second.font=[UIFont systemFontOfSize:13.0f];
        _lab_second.textColor=[UIColor whiteColor];
    }
    return _lab_second;
}
-(UIImageView*)image_navigation
{
    if (!_image_navigation) {
        _image_navigation=[[UIImageView alloc]init];
        _image_navigation.image=[UIImage imageNamed:@"行程导航底纹"];
        
        _image_navigation.userInteractionEnabled=YES;
        UITapGestureRecognizer*tap2=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(click2:)];
        tap2.cancelsTouchesInView=NO;
        [self.image_navigation addGestureRecognizer:tap2];
        [self.image_navigation addGestureRecognizer:tap2];
    }
    return _image_navigation;
}
-(UIImageView*)image_third
{
    if (!_image_third) {
        _image_third=[[UIImageView alloc]init];
        _image_third.image=[UIImage imageNamed:@"行程导航"];
    }
    return _image_third;
}
-(UILabel*)lab_third
{
    if (!_lab_third) {
        _lab_third=[[UILabel alloc]init];
        _lab_third.text=@"行程导航";
        _lab_third.font=[UIFont systemFontOfSize:13.0f];
        _lab_third.textColor=[UIColor whiteColor];
    }
    return _lab_third;
}
-(UIImageView*)image_manage
{
    if (!_image_manage) {
        _image_manage=[[UIImageView alloc]init];
        _image_manage.image=[UIImage imageNamed:@"行程管理底纹"];
        
        _image_manage.userInteractionEnabled=YES;
        UITapGestureRecognizer*tap3=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(click3:)];
        [self.image_manage addGestureRecognizer:tap3];
    }
    return _image_manage;
}
-(UIImageView*)image_forth
{
    if (!_image_forth) {
        _image_forth=[[UIImageView alloc]init];
        _image_forth.image=[UIImage imageNamed:@"行程管理"];
    }
    return _image_forth;
}
-(UILabel*)lab_forth
{
    if (!_lab_forth) {
        _lab_forth=[[UILabel alloc]init];
        _lab_forth.text=@"行程管理";
        _lab_forth.font=[UIFont systemFontOfSize:13.0f];
        _lab_forth.textColor=[UIColor whiteColor];
    }
    return _lab_forth;
}
-(UIImageView*)image_jia
{
    if (!_image_jia) {
        _image_jia=[[UIImageView alloc]init];
        _image_jia.image=[UIImage imageNamed:@"加号"];
        _image_jia.userInteractionEnabled=YES;
        UITapGestureRecognizer*tapp=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hiddenpage:)];
        [_image_jia addGestureRecognizer:tapp];
    }
    return _image_jia;
}
-(UIImageView*)image
{
    if (!_image) {
        _image=[[UIImageView alloc]init];
        _image.image=[UIImage imageNamed:@"背景-1"];
        _image.userInteractionEnabled=YES;
    }
    return _image;
    
}
-(UIImageView*)image_impress
{
    if (!_image_impress) {
        _image_impress=[[UIImageView alloc]init];
        _image_impress.image=[UIImage imageNamed:@"底纹"];
        _image_impress.userInteractionEnabled=YES;
        UITapGestureRecognizer*tap4=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(impressed:)];
        [_image_impress addGestureRecognizer:tap4];
    }
    return _image_impress;
}
-(UIImageView*)im_impress
{
    if (!_im_impress) {
        _im_impress=[[UIImageView alloc]init];
        _im_impress.image=[UIImage imageNamed:@"写印象图标"];
    }
    return _im_impress;
}
-(UILabel*)lab_impress
{
    if (!_lab_impress) {
        _lab_impress=[[UILabel alloc]init];
        _lab_impress.text=@"写印象";
        _lab_impress.textColor=[UIColor whiteColor];
        _lab_impress.font=[UIFont systemFontOfSize:15.0f];
    }
    return _lab_impress;
}
-(UIImageView*)image_addjourney
{
    if (!_image_addjourney) {
        _image_addjourney=[[UIImageView alloc]init];
        _image_addjourney.image=[UIImage imageNamed:@"底纹"];
        _image_addjourney.userInteractionEnabled=YES;
        UITapGestureRecognizer*tap5=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(addjourney:)];
        [_image_addjourney addGestureRecognizer:tap5];
    }
    return _image_addjourney;
}
-(UIImageView*)im_addjourney
{
    if (!_im_addjourney) {
        _im_addjourney=[[UIImageView alloc]init];
        _im_addjourney.image=[UIImage imageNamed:@"行程图标"];
    }
    return _im_addjourney;
}
-(UILabel*)lab_addjourney
{
    if (!_lab_addjourney) {
        _lab_addjourney=[[UILabel alloc]init];
        _lab_addjourney.text=@"添加行程";
        _lab_addjourney.textColor=[UIColor whiteColor];
        _lab_addjourney.font=[UIFont systemFontOfSize:15.0f];
    }
    return _lab_addjourney;
}
-(UIImageView*)image_back
{
    if (!_image_back) {
        _image_back=[[UIImageView alloc]init];
        _image_back.userInteractionEnabled=YES;
        _image_back.image=[UIImage imageNamed:@"关闭"];
        UITapGestureRecognizer*tapback=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(backimageview:)];
        [_image_back addGestureRecognizer:tapback];
    }
    return _image_back;
}
#pragma mark-添加方法
-(void)Search
{
    NSLog(@"search");
    self.hidesBottomBarWhenPushed=YES;
    UIStoryboard*stroy=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    CodeController*controller=[stroy instantiateInitialViewController];
    [self.navigationController pushViewController:controller animated:YES];
//    UIBarButtonItem*backbtn=[[UIBarButtonItem alloc]init];
//    backbtn.title=@" ";
//    self.navigationItem.backBarButtonItem=backbtn;
    self.hidesBottomBarWhenPushed=NO;
}
-(void)area
{
//    AreaController*controller=[[AreaController alloc]init];
//    [self.navigationController pushViewController:controller animated:YES];
    
    AAController*controller=[[AAController alloc]init];
    [self.navigationController pushViewController:controller animated:YES];
}
-(void)hiddenpage:(UITapGestureRecognizer*)tapp
{
        [UIView animateWithDuration:0.5 animations:^{
            CGFloat width=[UIScreen mainScreen].bounds.size.width;
            CGFloat height=[UIScreen mainScreen].bounds.size.height;
            self.image.frame=CGRectMake(0, 0, width, height);
        }];
        self.image_impress.hidden=NO;
        self.image_addjourney.hidden=NO;
        self.image_back.hidden=NO;
        self.image_photo.userInteractionEnabled=NO;
        self.image_journey.userInteractionEnabled=NO;
        self.image_navigation.userInteractionEnabled=NO;
        self.image_manage.userInteractionEnabled=NO;
        [self.view addSubview:self.image];
}
-(void)backimageview:(UITapGestureRecognizer *)tapback
{
        [UIView animateWithDuration:0.5 animations:^{
            CGFloat width=[UIScreen mainScreen].bounds.size.width;
            CGFloat height=[UIScreen mainScreen].bounds.size.height;
            self.image.frame=CGRectMake(0, 2*height, width, height);
        }];
        self.image_photo.userInteractionEnabled=YES;
        self.image_journey.userInteractionEnabled=YES;
        self.image_navigation.userInteractionEnabled=YES;
        self.image_manage.userInteractionEnabled=YES;
}
-(void)click:(UITapGestureRecognizer *)tap
{
    self.hidesBottomBarWhenPushed=YES;
    TourPhotoController*tourcontroller=[[TourPhotoController alloc]init];
    [self.navigationController pushViewController:tourcontroller animated:YES];
    self.hidesBottomBarWhenPushed=NO;
}
-(void)click1:(UITapGestureRecognizer *)tap1
{
    self.hidesBottomBarWhenPushed=YES;
    TourJourneyController*tourcontroller1=[[TourJourneyController alloc]init];
    [self.navigationController pushViewController:tourcontroller1 animated:YES];
    self.hidesBottomBarWhenPushed=NO;
}
-(void)click2:(UITapGestureRecognizer *)tap2
{
    self.hidesBottomBarWhenPushed=YES;
    TourNavigationController*tourcontroller2=[[TourNavigationController alloc]init];
    [self.navigationController pushViewController:tourcontroller2 animated:YES];
    self.hidesBottomBarWhenPushed=NO;
}
-(void)click3:(UITapGestureRecognizer *)tap3
{
    self.hidesBottomBarWhenPushed=YES;
    TourmanageController*tourcontroller3=[[TourmanageController alloc]init];
    [self.navigationController pushViewController:tourcontroller3 animated:YES];
    self.hidesBottomBarWhenPushed=NO;
}
-(void)impressed:(UITapGestureRecognizer *)tap4
{
    ImpressController *imprescontroller=[[ImpressController alloc]init];
    self.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:imprescontroller animated:YES];
    self.hidesBottomBarWhenPushed=NO;
}
-(void)addjourney:(UITapGestureRecognizer *)tap5
{
    self.hidesBottomBarWhenPushed=YES;
    AddJourneyController *addcontroller=[[AddJourneyController alloc]init];
    [self.navigationController pushViewController:addcontroller animated:YES];
    self.hidesBottomBarWhenPushed=NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
