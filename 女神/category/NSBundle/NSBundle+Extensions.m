//
//  NSBundle+Extensions.m
//  DiabetesManager
//
//  Created by majianglin on 13-5-30.
//  Copyright (c) 2013年 totemtec.com. All rights reserved.
//

#import "NSBundle+Extensions.h"

#import <sys/utsname.h>

@implementation NSBundle (Extentions)

+ (NSString *)bundleIdentifier
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
}

+ (NSString *)bundleName
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"];
}

+ (NSString *)bundleDisplayName
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
}

+ (NSString *)bundleVersion
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}





#pragma mark - ~~~~~~~~~~~ 设备硬件 4 4s 5 5c ... ~~~~~~~~~~~~~~~
+ (NSString *)getDeviceVersionInfo
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithFormat:@"%s", systemInfo.machine];
    
    //    //返回  iPhone iPod iPad
    //    NSString *deviceType = [[UIDevice currentDevice] model];
    
    return platform;
}

+ (NSString *)bundlePhoneModel {
    
    NSString *correspondVersion = [self getDeviceVersionInfo];
    
    if ([correspondVersion isEqualToString:@"i386"])        return@"Simulator";
    if ([correspondVersion isEqualToString:@"x86_64"])      return @"Simulator";
    
    return correspondVersion;
}

@end
