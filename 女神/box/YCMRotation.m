//
//  YCMRotation.m
//  yunchameng
//
//  Created by wangaiguo on 2018/9/4.
//  Copyright © 2018年 wangaiguo. All rights reserved.
//

#import "YCMRotation.h"

@implementation YCMRotation
+ (CABasicAnimation *)animation{
    CABasicAnimation *animation =  [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    //默认是顺时针效果，若将fromValue和toValue的值互换，则为逆时针效果
    animation.fromValue = [NSNumber numberWithFloat:0.f];
    animation.toValue =  [NSNumber numberWithFloat: M_PI *2];
    animation.duration  = 1;
    animation.autoreverses = NO;
    animation.fillMode =kCAFillModeForwards;
    animation.repeatCount = MAXFLOAT;
    return animation;
}
@end
