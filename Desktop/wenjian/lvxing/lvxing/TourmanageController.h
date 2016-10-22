//
//  TourmanageController.h
//  lvxing
//
//  Created by wd on 16-9-21.
//  Copyright (c) 2016年 wd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TourmanageController : UIViewController
@property(nonatomic,strong)UIImageView*image1;
@property(nonatomic,strong)UIImageView*image2;
@property(nonatomic,strong)UIImageView*image3;
@property(nonatomic,strong)UIScrollView*scroll;
@property(nonatomic,strong)UIPageControl*pagecontrol;

@property(nonatomic,strong)UIButton*btn_tour;
@property(nonatomic,strong)UIButton*btn_op;
@property(nonatomic,strong)UIImageView*imageview;
@property(nonatomic,strong)UILabel*label;
@property(nonatomic,strong)UIImageView*image_choose;
@property(nonatomic,strong)UILabel*lable_choose1;
@property(nonatomic,strong)UILabel*label_choose2;
@property(nonatomic,strong)UIImageView*image_1;
@property(nonatomic,strong)UIImageView*image_2;
@property(nonatomic,strong)UIImageView*image_add;
//滑动imageview
@property(nonatomic,strong)UIImageView*image_ground;
@property(nonatomic,strong)UIImageView*image_time;//实时情况
@property(nonatomic,strong)UIImageView*image_re;//修改行程
@property(nonatomic,strong)UIImageView*image_new;//刷新行程
@property(nonatomic,strong)UIImageView*image_favour;//我的收藏
@property(nonatomic,strong)UIImageView*image_suggest;//周边推荐
@property(nonatomic,strong)UILabel*label_time;
@property(nonatomic,strong)UILabel*label_re;
@property(nonatomic,strong)UILabel*label_new;
@property(nonatomic,strong)UILabel*label_favour;
@property(nonatomic,strong)UILabel*label_suggest;
@property(nonatomic,strong)UIImageView*image_pop;

@property(nonatomic)BOOL flag;
@property(nonatomic,strong)NSArray*array;
//@property(nonatomic)int i;
//@property(nonatomic)int a;
@end
