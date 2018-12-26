//
//  UIView+Frame.m
//  YJ_微信
//
//  Created by Mr.Wang on 2017/3/20.
//  Copyright © 2017年 Mr.Wang. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)


- (BOOL) containsSubView:(UIView *)subView
{
    for (UIView *view in [self subviews]) {
        if ([view isEqual:subView]) {
            return YES;
        }
    }
    return NO;
}

- (BOOL) containsSubViewOfClassType:(Class)aClass
{
    for (UIView *view in [self subviews]) {
        if ([view isMemberOfClass:aClass]) {
            return YES;
        }
    }
    return NO;
}

- (CGPoint) origin
{
    return self.frame.origin;
}

- (void) setOrigin:(CGPoint)newOrigin
{
    self.Ex_origin = newOrigin;
}

- (CGSize) size
{
    return self.frame.size;
}

- (void) setSize:(CGSize)newSize
{
    self.Ex_size = newSize;
}

- (CGFloat) originX
{
    return self.frame.origin.x;
}

- (void) setOriginX:(CGFloat)originX
{
    self.Ex_x = originX;
}

- (CGFloat)originY
{
    return self.frame.origin.y;
}

- (void)setOriginY:(CGFloat)originY
{
    self.Ex_y = originY;
}

- (CGFloat)frameRight
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setFrameRight:(CGFloat)newRight
{
    self.Ex_right = newRight;
}

- (CGFloat)frameBottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setFrameBottom:(CGFloat)newBottom
{
    self.Ex_bottom = newBottom;;
}

- (CGFloat)frameWidth
{
    return self.frame.size.width;
}

- (void)setFrameWidth:(CGFloat)newWidth
{
    self.Ex_width = newWidth;
}

- (CGFloat)frameHeight
{
    return self.frame.size.height;
}

- (void)setFrameHeight:(CGFloat)newHeight
{
    self.Ex_height = newHeight;
}



- (void)setEx_x:(CGFloat)Ex_x{
    CGRect frame = self.frame;
    frame.origin.x = Ex_x;
    self.frame = frame;
}

- (void)setEx_y:(CGFloat)Ex_y{
    CGRect frame = self.frame;
    frame.origin.y = Ex_y;
    self.frame = frame;
}

- (CGFloat)Ex_x{
    return self.frame.origin.x;
}

- (CGFloat)Ex_y{
    return self.frame.origin.y;
}

- (void)setEx_centerX:(CGFloat)Ex_centerX{
    CGPoint center = self.center;
    center.x = Ex_centerX;
    self.center = center;
}

- (CGFloat)Ex_centerX{
    return self.center.x;
}

- (void)setEx_centerY:(CGFloat)Ex_centerY{
    CGPoint center = self.center;
    center.y = Ex_centerY;
    self.center = center;
}

- (CGFloat)Ex_centerY{
    return self.center.y;
}

- (void)setEx_width:(CGFloat)Ex_width{
    CGRect frame = self.frame;
    frame.size.width = Ex_width;
    self.frame = frame;
}

- (void)setEx_height:(CGFloat)Ex_height{
    CGRect frame = self.frame;
    frame.size.height = Ex_height;
    self.frame = frame;
}

- (CGFloat)Ex_height{
    return self.frame.size.height;
}

- (CGFloat)Ex_width{
    return self.frame.size.width;
}

- (void)setEx_size:(CGSize)Ex_size{
    CGRect frame = self.frame;
    frame.size = Ex_size;
    self.frame = frame;
}

- (CGSize)Ex_size{
    return self.frame.size;
}

- (void)setEx_origin:(CGPoint)Ex_origin{
    CGRect frame = self.frame;
    frame.origin = Ex_origin;
    self.frame = frame;
}

- (CGPoint)Ex_origin{
    return self.frame.origin;
}

- (CGFloat)Ex_bottom {
    
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setEx_bottom:(CGFloat)Ex_bottom {
    
    self.Ex_bottom = Ex_bottom;
}

- (void)setEx_right:(CGFloat)Ex_right {
    
    self.Ex_right = Ex_right;
}

- (CGFloat)Ex_right {
    
    return self.frame.origin.x + self.frame.size.width;
}

@end
