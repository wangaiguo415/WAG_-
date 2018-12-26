//
//  UIImage+DYExtenstion.m
//  DragonYin
//
//  Created by srxboys on 2018/5/7.
//  Copyright © 2018年 https://github.com/srxboys. All rights reserved.
//

#import "UIImage+DYExtenstion.h"

@implementation UIImage (DYExtenstion)

#pragma mark - 截屏
+ (UIImage *)ex_imageWithScreenShot {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    UIGraphicsBeginImageContextWithOptions(window.bounds.size, YES, 0.0);
    [window.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

#pragma mark - 模糊滤镜
- (UIImage *)ex_imageWithBlur {
    UIImage * image = self;

    /*..CoreImage中的模糊效果滤镜..*/
    //CIImage,相当于UIImage,作用为获取图片资源
    CIImage * ciImage = [[CIImage alloc]initWithImage:image];
    
    //CIFilter,高斯模糊滤镜
    CIFilter * blurFilter = [CIFilter filterWithName:@"CIGaussianBlur"];
    //将图片输入到滤镜中
    [blurFilter setValue:ciImage forKey:kCIInputImageKey];
    //用来查询滤镜可以设置的参数以及一些相关的信息
    //    NSLog(@"%@",[blurFilter attributes]);
    //设置模糊程度,默认为10,取值范围(0-100)
    [blurFilter setValue:@(20) forKey:@"inputRadius"];
    //将处理好的图片输出
    CIImage * outCiImage = [blurFilter valueForKey:kCIOutputImageKey];
    //CIContext
    CIContext * context = [CIContext contextWithOptions:nil];
    //获取CGImage句柄,也就是从数据流中取出图片
    CGImageRef outCGImage = [context createCGImage:outCiImage fromRect:[outCiImage extent]];
    //最终获取到图片
    UIImage * blurImage = [UIImage imageWithCGImage:outCGImage];
    //释放CGImage句柄
    CGImageRelease(outCGImage);
    
    return blurImage;
}


// 画背景
- (UIImage *)ex_imageWithBackgroundColor:(UIColor *)color {
    UIImage * image = self;
    CGRect rect = CGRectMake(0.0f, 0.0f, image.size.width, image.size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, image.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [image drawInRect:rect];
    CGContextSetFillColorWithColor(context, [color CGColor]);
//    CGContextSetStrokeColorWithColor(context, [color CGColor]); //--
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    CGContextFillRect(context, rect);
    
    UIImage*newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

//改变图片颜色
- (UIImage *)ex_imageWithTintColor:(UIColor *)color
{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0, self.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextClipToMask(context, rect, self.CGImage);
    [color setFill];
//    [color setStroke];//--
//    [color set];//--
    CGContextFillRect(context, rect);
    UIImage*newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
