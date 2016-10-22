//
//  XSingleTon.h
//  lvxing
//
//  Created by wd on 16-9-25.
//  Copyright (c) 2016年 wd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface XSingleTon : NSObject

@property(nonatomic,strong)NSString*single_phone;
@property(nonatomic,strong)NSString*single_password;
@property(nonatomic,strong)NSString*single_repassword;
+(XSingleTon *)shareSingleton;
-(sqlite3*)date;
-(void)shujv:(sqlite3*)a;

@end
