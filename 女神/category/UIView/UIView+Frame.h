//
//  UIView+Frame.h
//  YJ_微信
//
//  Created by Mr.Wang on 2017/3/20.
//  Copyright © 2017年 Mr.Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)


@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGSize size;

@property (nonatomic, assign) CGFloat originX;
@property (nonatomic, assign) CGFloat originY;

@property (nonatomic, assign) CGFloat frameRight;
@property (nonatomic, assign) CGFloat frameBottom;

@property (nonatomic, assign) CGFloat frameWidth;
@property (nonatomic, assign) CGFloat frameHeight;

- (BOOL) containsSubView:(UIView *)subView;
- (BOOL) containsSubViewOfClassType:(Class)aClass;


@property (nonatomic, assign) CGFloat Ex_x;
@property (nonatomic, assign) CGFloat Ex_y;
@property (nonatomic, assign) CGFloat Ex_centerX;
@property (nonatomic, assign) CGFloat Ex_centerY;
@property (nonatomic, assign) CGFloat Ex_width;
@property (nonatomic, assign) CGFloat Ex_height;
@property (nonatomic, assign) CGSize  Ex_size;
@property (nonatomic, assign) CGPoint Ex_origin;
@property (nonatomic, assign) CGFloat Ex_bottom;
@property (nonatomic, assign) CGFloat Ex_right;

@end
