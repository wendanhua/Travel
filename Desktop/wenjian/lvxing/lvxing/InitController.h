//
//  InitViewController.h
//  lvxing
//
//  Created by wd on 16-9-9.
//  Copyright (c) 2016年 wd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InitController : UIViewController<UIScrollViewDelegate>

//启动页
@property(nonatomic,strong)UIImageView*image1;
@property(nonatomic,strong)UIImageView*image2;
@property(nonatomic,strong)UIImageView*image3;
@property(nonatomic,strong)UIScrollView*scroll;
@property(nonatomic,strong)UIButton*btn;//跳转按钮

@property(nonatomic,strong)UIImageView*image_background;//背景图片
//四个底层跳转图片
@property(nonatomic,strong)UIImageView*image_photo;//旅行图集
@property(nonatomic,strong)UIImageView*image_journey;//旅行行程
@property(nonatomic,strong)UIImageView*image_navigation;//行程导航
@property(nonatomic,strong)UIImageView*image_manage;//行程管理

@property(nonatomic,strong)UIImageView*image_first;
@property(nonatomic,strong)UIImageView*image_second;
@property(nonatomic,strong)UIImageView*image_third;
@property(nonatomic,strong)UIImageView*image_forth;

@property(nonatomic,strong)UILabel*lab_first;
@property(nonatomic,strong)UILabel*lab_second;
@property(nonatomic,strong)UILabel*lab_third;
@property(nonatomic,strong)UILabel*lab_forth;
@property(nonatomic,strong)UIImageView*image_jia;
//点击加号跳转第二层背景
@property(nonatomic,strong)UIImageView*image;
@property(nonatomic,strong)UIImageView*image_impress;
@property(nonatomic,strong)UIImageView*image_addjourney;
@property(nonatomic,strong)UIImageView*im_impress;
@property(nonatomic,strong)UIImageView*im_addjourney;
@property(nonatomic,strong)UILabel*lab_impress;
@property(nonatomic,strong)UILabel*lab_addjourney;

@property(nonatomic,strong)UIImageView*image_back;

@property(nonatomic)int flag;
@end
