//
//  AppDelegate.m
//  lvxing
//
//  Created by wd on 16-9-9.
//  Copyright (c) 2016年 wd. All rights reserved.
//

#import "AppDelegate.h"
#import "InitController.h"
#import "EffectController.h"
#import "DiscoverController.h"
#import "WoController.h"
#import "ViewController.h"

#import "XSingleTon.h"
#import <sqlite3.h>
#import "RegisterController.h"
#import <SMS_SDK/SMSSDK.h>

@interface AppDelegate ()
{
    int ok;
    sqlite3*db;
    char*msg;
}
@end

@implementation AppDelegate
//数据连接
-(NSString*)fullpath:(NSString*)path
{
    NSArray*array=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString*str=array[0];
    return [str stringByAppendingPathComponent:path];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    CGRect rect=[UIScreen mainScreen].bounds;
    self.window=[[UIWindow alloc]initWithFrame:rect];
    self.window.backgroundColor=[UIColor whiteColor];
    UITabBarController *tabBarController=[[UITabBarController alloc]init];
    InitController*controller1=[[InitController alloc]init];
    controller1.tabBarItem.image=[UIImage imageNamed:@"首页"];
    controller1.tabBarItem.title=@"首页";
    UINavigationController*naviFirst=[[UINavigationController alloc]initWithRootViewController:controller1];
    [tabBarController addChildViewController:naviFirst];
    
    EffectController*controller2=[[EffectController alloc]init];
    controller2.tabBarItem.image=[UIImage imageNamed:@"印象"];
    controller2.tabBarItem.title=@"印象";
    UINavigationController*naviSecond=[[UINavigationController alloc]initWithRootViewController:controller2];
    [tabBarController addChildViewController:naviSecond];
    
    DiscoverController*controller3=[[DiscoverController alloc]init];
    controller3.tabBarItem.image=[UIImage imageNamed:@"发现"];
    controller3.tabBarItem.title=@"发现";
    UINavigationController*naviThird=[[UINavigationController alloc]initWithRootViewController:controller3];
    [tabBarController addChildViewController:naviThird];
    
    WoController*controller4=[[WoController alloc]init];
    controller4.tabBarItem.image=[UIImage imageNamed:@"我"];
    controller4.tabBarItem.title=@"我";
    UINavigationController*naviForth=[[UINavigationController alloc]initWithRootViewController:controller4];
    [tabBarController addChildViewController:naviForth];
    //[tabBarController addChildViewController:controller4];
    [[UINavigationBar appearance]setTintColor:[UIColor whiteColor]];
    self.window.rootViewController=tabBarController;
    [self.window makeKeyAndVisible];
    
    //短信验证
    [SMSSDK registerApp:@"156e80351d748" withSecret:@"0ed8b0f14f3d54a903032082251486a9"];

    
    //数据库
    
    NSLog(@"%@",[self fullpath:@"test.png"]);
    NSString*db_path=[self fullpath:@"lvyou.db"];
    ok=sqlite3_open([db_path UTF8String], &db);
    if (ok!=SQLITE_OK) {
        NSLog(@"open is not ok");
    }
    else
    {
        NSLog(@"open is ok");
    }
   
    //创建表的结构和数据
    NSString*sql=@"CREATE TABLE user(phone VARCHAR (64) PRIMARY KEY UNIQUE NOT NULL,password VARCHAR (64) NOT NULL,repassword VARCHAR (64) NOT NULL);";
    ok = sqlite3_exec(db, [sql UTF8String],NULL, NULL, &msg);
    if (ok!=SQLITE_OK) {
        NSLog(@"msg=%s",msg);
    }
    else
    {
        NSLog(@"建表");
    }
    XSingleTon *sx = [XSingleTon shareSingleton];
    [sx shujv:db];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
