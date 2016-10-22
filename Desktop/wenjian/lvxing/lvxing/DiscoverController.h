//
//  DiscoverViewController.h
//  lvxing
//
//  Created by wd on 16-9-9.
//  Copyright (c) 2016年 wd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
@interface DiscoverController : UIViewController
//- (IBAction)beginGuiding:(id)sender;
//@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property(nonatomic,strong)UIButton*btn_gps;
@property(nonatomic,strong)MKMapView*mapview;

@end
