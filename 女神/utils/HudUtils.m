//
//  HudUtils.m
//  BA
//
//  Created by wangaiguo on 17/6/9.
//  Copyright © 2017年 wangaiguo. All rights reserved.
//

#import "HudUtils.h"
#import "YCMRotation.h"

@implementation HudUtils
+ (void)show:(UIView *)view{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.color = UIClearColor;
    hud.mode = MBProgressHUDModeCustomView;
    UIImage *image = [IMG(@"jiazai") imageWithRenderingMode:UIImageRenderingModeAutomatic];
    hud.labelText = @"正在加载，请稍后...";
    hud.labelFont = [UIFont systemFontOfSize:13];
    hud.labelColor = [UIColor colorWithHex:@"666666"];
    UIImageView *imageV = [[UIImageView alloc]initWithImage:image];
    [imageV.layer addAnimation:[YCMRotation animation] forKey:nil];
    hud.customView = imageV;
    [hud show:YES];
}
+ (void)hide:(UIView *)view{
    [MBProgressHUD hideHUDForView:view animated:YES];
}
+ (void)showMessage:(NSString *)message{
    [HudUtils showMessage:message view:[[[UIApplication sharedApplication] delegate] window] duration:1.4f];
}
+ (void)showMessage:(NSString *)message view:(UIView *)view duration:(NSTimeInterval)duration{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = message;
    hud.removeFromSuperViewOnHide = YES;
    [hud  hide:YES afterDelay:duration];
}
@end
