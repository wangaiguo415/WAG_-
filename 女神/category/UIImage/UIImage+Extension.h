//
//  UIImage+Extension.h
//
//  Created by 👄 on 15/6/4.
//  Copyright (c) 2015年 ；. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)

+ (UIImage *)resizableImage:(NSString *)name;
+ (UIImage *)createImageWithColor:(UIColor *)color;
+ (UIImage *)image: (UIImage *) image fillSize:(CGSize)viewsize;
+ (UIImage *)image: (UIImage *) image centerInSize:(CGSize)viewsize;
+ (UIImage *)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize;
+ (CGSize) fitSize: (CGSize)thisSize inSize:(CGSize)aSize;
+ (UIImage *)fixOrientation:(UIImage *)aImage;
+ (CGSize)downloadImageSizeWithURL:(id)imageURL;
+ (UIImage *)resizebleImageWithName:(NSString *)imageName;
+ (UIImage *)image:(UIImage *)image byScalingToSize:(CGSize)targetSize;
+ (UIImage *)resizeImage:(NSString *)imageName;
+ (UIImage *)thumbnailImageForVideo:(NSURL *)videoURL atTime:(NSTimeInterval)time;
+ (UIImage *)Image:(UIImage *)useImage addMsakImage:(UIImage *)maskImage msakRect:(CGRect)rect;


+ (UIImage *)compressImageQuality:(UIImage *)image toByte:(NSInteger)maxLength ;

/**
 通过名字查找图片

 @param name 图片名
 @return image
 */
+ (UIImage *)imageWithName:(NSString *)name;

+ (UIImage *)Base64StrToUIImage:(NSString *)_encodedImageStr;

+ (NSString *) image2DataURL: (UIImage *) image;

@end
