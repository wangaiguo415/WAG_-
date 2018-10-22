//
//  DZApplication.h
//  BA
//
//  Created by wangaiguo on 17/6/8.
//  Copyright © 2017年 wangaiguo. All rights reserved.
//

#import <Foundation/Foundation.h>
#define MAIN_WINDOW    [[YCMApplication currentApplication] mainWindow]
#define SCREEN_BOUNDS  [[YCMApplication currentApplication] screenBounds]
//#define SCREEN_WIDTH   [[YCMApplication currentApplication] screenWidth]
//#define SCREEN_HEIGHT  [[YCMApplication currentApplication] screenHeight]
#define APPDELEGATE    [[YCMApplication currentApplication] appDelegate]
#define DIMENSION(dimen)   [[YCMApplication currentApplication] dimension:dimen]
#define WEAK_SELF __weak typeof(self) me = self;
#define ONE_PIXEL 1.0/[UIScreen mainScreen].scale
#define IS_IPHONE_X    ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define DZ_TOP         ([[UIApplication sharedApplication] statusBarFrame].size.height + 44)
#define COMMON_FRAME CGRectMake(0, DZ_TOP + 43, SCREEN_WIDTH, SCREEN_HEIGHT - DZ_TOP - 43)
#define TRIM_STRING( object ) [object stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet] ]
#define TRIM_STRING_length( object )  [[object stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet] ] length]
#define IMG(img) [UIImage imageNamed:img]

@class AppDelegate;
@interface YCMApplication : NSObject
+ (YCMApplication *)currentApplication;
- (UIWindow *)mainWindow;
- (int)systemVersion;
- (CGRect)screenBounds;
- (float)screenScale;
- (float)screenWidth;
- (float)screenHeight;
- (NSString *)version;
- (NSString *)shortVersion;
- (AppDelegate *)appDelegate;
- (CGFloat)dimension:(CGFloat)dimension;
- (void)openUrl: (NSString *)urlStr;
@end
