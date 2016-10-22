//
//  EffectController.m
//  lvxing
//
//  Created by wd on 16-9-23.
//  Copyright (c) 2016年 wd. All rights reserved.
//

#import "EffectController.h"
#import "WriteController.h"
@interface EffectController ()

@end

@implementation EffectController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    UIButton*button=[[UIButton alloc]init];
//    button.frame=CGRectMake(100.0f, 100.0f, 50.0f, 50.0f);
//    [button setTitle:@"文件夹" forState:UIControlStateNormal];
//    button.backgroundColor=[UIColor grayColor];
//    [button addTarget:self action:@selector(add) forControlEvents:UIControlEventTouchDown];
//    [self.view addSubview:button];
    
    
    //navigation
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"晶格背景"] forBarMetrics:UIBarMetricsDefault];
    self.navigationItem.title=@"印象";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    [self.view addSubview:self.label_write];
    [self.view addSubview:self.image1];
    [self.view addSubview:self.image2];
    [self.image1 addSubview:self.label1];
    [self.image2 addSubview:self.label2];
}
-(void)viewWillAppear:(BOOL)animated
{
    CGFloat width=[UIScreen mainScreen].bounds.size.width;
    self.label_write.frame=CGRectMake(20.0f, 80.0f, 50.0f, 20.0f);
    self.image1.frame=CGRectMake((width-335)/2, 120.0f, 335.0f, 200.0f);
    self.image2.frame=CGRectMake((width-335)/2, 360.0f, 335.0f, 200.0f);
    self.label1.frame=CGRectMake(10.0f, 170.0f, 150.0f, 20.0f);
    self.label2.frame=CGRectMake(10.0f, 170.0f, 150.0f, 20.0f);
}
#pragma mark-getters
-(UILabel*)label_write
{
    if (!_label_write) {
        _label_write=[[UILabel alloc]init];
        _label_write.text=@"游记薄";
        _label_write.textColor=[UIColor grayColor];
        _label_write.font=[UIFont systemFontOfSize:15.0f];
      
    }
    return _label_write;
}
-(UIImageView*)image1
{
    if (!_image1) {
        _image1=[[UIImageView alloc]init];
        _image1.image=[UIImage imageNamed:@"图层1"];
        _image1.userInteractionEnabled=YES;
        UITapGestureRecognizer*tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapgesture:)];
        [_image1 addGestureRecognizer:tap];
    }
    return _image1;
}
-(UIImageView*)image2
{
    if (!_image2) {
        _image2=[[UIImageView alloc]init];
        _image2.image=[UIImage imageNamed:@"图层2"];
        _image2.userInteractionEnabled=YES;
        UITapGestureRecognizer*tap1=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapgesture:)];
        [_image2 addGestureRecognizer:tap1];
    }
    return _image2;
}
-(UILabel*)label1
{
    if (!_label1) {
        _label1=[[UILabel alloc]init];
        _label1.text=@"点击图片写游记";
        _label1.textColor=[UIColor whiteColor];
    }
    return _label1;
}
-(UILabel*)label2
{
    if (!_label2) {
        _label2=[[UILabel alloc]init];
        _label2.text=@"点击图片写游记";
        _label2.textColor=[UIColor whiteColor];
    }
    return _label2;
}
//调用方法
-(void)tapgesture:(UITapGestureRecognizer*)tap
{
    WriteController*controller=[[WriteController alloc]init];
    [self.navigationController pushViewController:controller animated:YES];
}
//-(void)add
//{
//    NSLog(@"文件夹");
//    NSFileManager*fileManager=[[NSFileManager alloc]init];
//
//    NSString*imageDir=[NSString stringWithFormat:@"%@/caches/%@",NSHomeDirectory(),@"aaa"];
//    NSLog(@"%@",NSHomeDirectory());
//    BOOL isDir=NO;
//    BOOL existed=[fileManager fileExistsAtPath:imageDir isDirectory:&isDir];
//    if (!(isDir==YES && existed==YES)) {
//        [fileManager createDirectoryAtPath:imageDir withIntermediateDirectories:YES attributes:nil error:nil];
//    }
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
