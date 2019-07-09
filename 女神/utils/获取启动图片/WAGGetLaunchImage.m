//
//  WAGGetLaunchImage.m
//  女神
//
//  Created by wangaiguo on 2019/7/9.
//  Copyright © 2019 王爱国. All rights reserved.
//

#import "WAGGetLaunchImage.h"

@implementation WAGGetLaunchImage
/** 获取启动图片 */
- (UIImage *)getLaunchImage
{
    CGSize viewSize = [UIScreen mainScreen].bounds.size;
    NSString *viewOrientation = @"Portrait";                // 横屏请设置成 @"Landscape"
    UIImage *lauchImage = nil;
    NSArray *imagesDictionary = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImages"];
    for (NSDictionary *dict in imagesDictionary)
    {
        CGSize imageSize = CGSizeFromString(dict[@"UILaunchImageSize"]);
        if (CGSizeEqualToSize(imageSize, viewSize) && [viewOrientation isEqualToString:dict[@"UILaunchImageOrientation"]])
        {
            lauchImage = [UIImage imageNamed:dict[@"UILaunchImageName"]];
        }
    }
    return lauchImage;
}
+ (UIImage *)getLaunchImage{
    WAGGetLaunchImage * instance = [[[self class] alloc]init];
    UIImage *image = [instance getLaunchImage];
    return image;
}
@end
