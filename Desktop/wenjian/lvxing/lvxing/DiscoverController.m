//
//  DiscoverViewController.m
//  lvxing
//
//  Created by wd on 16-9-9.
//  Copyright (c) 2016年 wd. All rights reserved.
//

#import "DiscoverController.h"
#import "JRAnnotation.h"
@interface DiscoverController ()<MKMapViewDelegate>

@property(nonatomic,strong)CLGeocoder*geocoder;
@property(nonatomic,strong)MKMapItem*sourceItem;
@property(nonatomic,strong)MKMapItem*destItem;
@end

@implementation DiscoverController

-(CLGeocoder *)geocoder{
    if (_geocoder==nil) {
        _geocoder=[[CLGeocoder alloc] init];
    }
    return _geocoder;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.view addSubview:self.mapview];
    [self.view addSubview:self.btn_gps];
    self.mapview.delegate=self;
    
    
    // 两地之间划线
    NSString * sourceName=@"新疆";
    NSString * destinationName=@"烟台";
    
    
    [self.geocoder geocodeAddressString:sourceName completionHandler:^(NSArray *sourcemarks, NSError *error) {
        [self.geocoder geocodeAddressString:destinationName completionHandler:^(NSArray *destmarks, NSError *error) {
            
            
            CLPlacemark * sourceMark=[sourcemarks firstObject];
            CLPlacemark * toMark=[destmarks firstObject];
            
            //1 增加自定义大头针
            JRAnnotation * source=[[JRAnnotation alloc] init];
            source.title=sourceName;
            source.subtitle=sourceMark.name;
            source.coordinate=sourceMark.location.coordinate;
            [self.mapview addAnnotation:source];
            
            
            JRAnnotation * dest=[[JRAnnotation alloc] init];
            dest.title=destinationName;
            dest.subtitle=toMark.name;
            dest.coordinate=toMark.location.coordinate;
            [self.mapview addAnnotation:dest];
            
            //2 划线
            //            [self _mapGuilderFromMark:sourceMark toMark:toMark];
            
            
            
        }];
        
    }];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    CGFloat width=[UIScreen mainScreen].bounds.size.width;
    CGFloat height=[UIScreen mainScreen].bounds.size.height;
    self.btn_gps.frame=CGRectMake(20.0f, 90.0f, 65.0f, 41.0f);
    self.mapview.frame=CGRectMake(0.0f, 0.0f, width, height);
}
#pragma mark-getters
-(MKMapView*)mapview
{
    if (!_mapview) {
        _mapview=[[MKMapView alloc]init];
    }
    return _mapview;
}
-(UIButton*)btn_gps
{
    if (!_btn_gps) {
        _btn_gps=[[UIButton alloc]init];
        [_btn_gps setTitle:@"导航" forState:UIControlStateNormal];
        [_btn_gps addTarget:self action:@selector(beginGuiding) forControlEvents:UIControlEventTouchDown];
        [_btn_gps setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    }
    return _btn_gps;
}
#pragma mark  - 导航之前划线

- (void)_mapGuilderFromMark:(CLPlacemark * ) sourceMark toMark:(CLPlacemark *) destMark{
    
    
    //1 定义方向请求
    MKDirectionsRequest * request=[[MKDirectionsRequest alloc] init];
    
    //2 定义开始和结束位置
    
    //1> 开始
    MKPlacemark *sourcemkpm=[[MKPlacemark alloc] initWithPlacemark:sourceMark];
    MKMapItem * sourceItem=[[MKMapItem alloc] initWithPlacemark:sourcemkpm];
    request.source=sourceItem;
    self.sourceItem=sourceItem;
    //2> 结束
    MKPlacemark *destmkpm=[[MKPlacemark alloc] initWithPlacemark:destMark];
    MKMapItem * destItem=[[MKMapItem alloc] initWithPlacemark:destmkpm];
    request.destination=destItem;
    self.destItem=destItem;
    
    //3 根据方向请求获取方向
    MKDirections *dirction=[[MKDirections alloc] initWithRequest:request];
    
    //4 计算路线模型
    [dirction calculateDirectionsWithCompletionHandler:^(MKDirectionsResponse *response, NSError *error) {
        if(error) return ;
        
        NSArray * routesArray=response.routes;
        
        for (MKRoute * root in routesArray) {
            
            //添加路线遮盖，传递路线遮盖模型
            [self.mapview addOverlay:root.polyline];
        }
        
    }];
    
    
    
}


#pragma mark - mapViewDelegate

//返回遮盖渲染器
-(MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay{
    
    MKPolylineRenderer * render=[[MKPolylineRenderer alloc]initWithPolyline:overlay];
    render.lineWidth=5;
    render.strokeColor=[UIColor blueColor];
    
    return render;
}



//返回大头针渲染器

- (MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    
    static  NSString * identy=@"big";
    MKPinAnnotationView * pinView=(MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identy];
    if(pinView==nil){
        pinView=[[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:identy];
        pinView.canShowCallout=YES;//设置点击出明细
    }
    
    pinView.pinColor=MKPinAnnotationColorGreen;//设置大头针颜色
    return pinView;
    
}


#pragma mark - 导航
//-(void)beginGuiding
//{
//    //1 设置起始item
//    NSArray * array=@[self.sourceItem,self.destItem];
//    
//    //2 设置导航模式，走路还是开车，以及是否显示路况
//    NSDictionary * dic=@{MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving,MKLaunchOptionsShowsTrafficKey:@YES};
//    
//    //3 打开苹果地图开始导航
//    [MKMapItem openMapsWithItems:array launchOptions:dic];
//
//}

//- (IBAction)beginGuiding:(id)sender {
//    
//    //1 设置起始item
//    NSArray * array=@[self.sourceItem,self.destItem];
//    
//    //2 设置导航模式，走路还是开车，以及是否显示路况
//    NSDictionary * dic=@{MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving,MKLaunchOptionsShowsTrafficKey:@YES};
//    
//    //3 打开苹果地图开始导航
//    [MKMapItem openMapsWithItems:array launchOptions:dic];
//    
//    
//}



@end
