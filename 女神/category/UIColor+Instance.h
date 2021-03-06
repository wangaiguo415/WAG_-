//
//  UIColor+Instance.h
//  BA
//
//  Created by wangaiguo on 17/6/8.
//  Copyright © 2017年 wangaiguo. All rights reserved.
//

#import <UIKit/UIKit.h>

#define UIBlackColor        [UIColor blackColor]
#define UIWhiteColor        [UIColor whiteColor]
#define UIRedColor          [UIColor redColor]
#define UIGreenColor        [UIColor greenColor]
#define UIBlueColor         [UIColor blueColor]
#define UIClearColor        [UIColor clearColor]
#define UICyanColor         [UIColor cyanColor]
#define UIRandomColor       [UIColor randomColor]

#define UILightGrayColor          RGBCOLOR(220, 220, 220)
#define UIGrayColor         [UIColor grayColor]
#define UIOrangeColor       [UIColor orangeColor]
#define UISeperatorColor    [UIColor seperatorColor]
#define UIBackgroundColor   [UIColor backgroundColor]
#define UICommonColor       [UIColor commonColor]



@interface UIColor (Instance)
+ (UIColor *)RGBColor:(int)red green:(int)green blue:(int)blue;
+ (UIColor *)RGBColor:(int)red green:(int)green blue:(int)blue alpha:(float)alpha;
+ (UIColor *)randomColor;
+ (UIColor *)colorWithHex:(NSString *)hexColor;

+ (UIColor *)commonColor;
+ (UIColor *)darkGrayColor;
+ (UIColor *)grayColor;
+ (UIColor *)lightGrayColor;
+ (UIColor *)backgroundColor;
+ (UIColor *)seperatorColor;




UIKIT_EXTERN UIColor* RGBCOLORA(int r,int g,int b,float a);
UIKIT_EXTERN UIColor* RGBCOLOR(int r,int g,int b);
@end
