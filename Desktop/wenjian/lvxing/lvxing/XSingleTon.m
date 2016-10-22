//
//  XSingleTon.m
//  lvxing
//
//  Created by wd on 16-9-25.
//  Copyright (c) 2016年 wd. All rights reserved.
//

#import "XSingleTon.h"
#import <sqlite3.h>
static XSingleTon *g_ShareSingleton=nil;
static sqlite3 *m_db=nil;

@implementation XSingleTon
+(XSingleTon*)shareSingleton
{
    if (g_ShareSingleton ==nil) {
        g_ShareSingleton=[[XSingleTon alloc]init];
    }
    return g_ShareSingleton;
}
-(sqlite3*)date
{
    return m_db;
}
-(void)shujv:(sqlite3 *)a
{
    m_db=a;
}
@end
