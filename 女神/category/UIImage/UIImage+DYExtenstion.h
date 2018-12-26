//
//  UIImage+DYExtenstion.h
//  DragonYin
//
//  Created by srxboys on 2018/5/7.
//  Copyright © 2018年 https://github.com/srxboys. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (DYExtenstion)

/* 截屏 */
+ (UIImage *)ex_imageWithScreenShot;

/* 模糊滤镜 */
- (UIImage *)ex_imageWithBlur;

/* 画背景 */
- (UIImage *)ex_imageWithBackgroundColor:(UIColor *)color;

/* 改变图片颜色 */
- (UIImage *)ex_imageWithTintColor:(UIColor *)color;
@end
