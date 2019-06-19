//
//  UILabel+Parameter.h
//  女神
//
//  Created by wangaiguo on 2019/6/19.
//  Copyright © 2019 王爱国. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (Parameter)
/*
 *  调用UILabel 并设置label的参数
 *
 **/
+ (UILabel *)wag_createLabel:(void (^)(UILabel * _Nonnull label))block;

- (UILabel *(^)(NSString *))wag_text;
- (UILabel *(^)(UIFont *))wag_font;
- (UILabel *(^)(CGFloat))wag_boldFontSize;
- (UILabel *(^)(UIColor *))wag_textColor;
- (UILabel *(^)(NSTextAlignment))wag_textAlignment;

// frame
- (UILabel *(^)(CGRect))wag_frame;

// 可以有 left、top、right、bottom 但感觉都写到一块的看着有点庞大 所以感觉还是单独写frame
@end

NS_ASSUME_NONNULL_END
