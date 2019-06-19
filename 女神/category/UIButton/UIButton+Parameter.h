//
//  UIButton+Parameter.h
//  女神
//
//  Created by wangaiguo on 2019/6/19.
//  Copyright © 2019 王爱国. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (Parameter)
/*
 * UIButton 链式封装
 **/
+ (UIButton *)createBtn:(void (^)(UIButton *btn))block;

/*
 * 属性设置
 **/
- (UIButton *(^)(NSString *))title;
- (UIButton *(^)(UIColor *))titleColor;
- (UIButton *(^)(UIColor *))backGroudColor;
- (UIButton *(^)(UIImage *))image;
- (UIButton *(^)(UIImage *))backGroundImage;
- (UIButton *(^)(UIFont *))font;

- (UIButton *(^)(CGRect))wag_frame;
@end

NS_ASSUME_NONNULL_END
