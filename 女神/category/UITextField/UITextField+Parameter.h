//
//  UITextField+Parameter.h
//  女神
//
//  Created by wangaiguo on 2019/6/19.
//  Copyright © 2019 王爱国. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (Parameter)
/*
 *  textfield创建
 **/
+ (UITextField *)createField:(void (^)(UITextField *textField))block;

/*
 *  一些属性的设置
 **/
- (UITextField *(^)(NSString *))wag_text;
- (UITextField *(^)(NSString *))wag_placeHolder;
- (UITextField *(^)(UIColor *))wag_textColor;
- (UITextField *(^)(UIFont *))wag_font;
- (UITextField *(^)(UIReturnKeyType))keyType;
- (UITextField *(^)(CGRect))wag_frame;
- (UITextField *(^)(NSTextAlignment))alignment;
- (UITextField *(^)(UIColor *))wag_backgroudColor;
@end

NS_ASSUME_NONNULL_END
