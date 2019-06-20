//
//  UITextField+Parameter.m
//  女神
//
//  Created by wangaiguo on 2019/6/19.
//  Copyright © 2019 王爱国. All rights reserved.
//

#import "UITextField+Parameter.h"

@implementation UITextField (Parameter)
+ (UITextField *)createField:(void (^)(UITextField * _Nonnull))block{
    UITextField *textField = [UITextField new];
    block(textField);
    return textField;
}
- (UITextField * _Nonnull (^)(NSString * _Nonnull))wag_text{
    return ^(NSString *text){
        self.text = text;
        return self;
    };
}
- (UITextField * _Nonnull (^)(NSString * _Nonnull))wag_placeHolder{
    return ^(NSString *placeHolder){
        self.placeholder = placeHolder;
        return self;
    };
}
- (UITextField * _Nonnull (^)(UIColor * _Nonnull))wag_textColor{
    return ^(UIColor * color){
        self.textColor = color;
        return self;
    };
}
- (UITextField * _Nonnull (^)(UIFont * _Nonnull))wag_font{
    return ^(UIFont *font){
        self.font = font;
        return self;
    };
}
- (UITextField * _Nonnull (^)(UIReturnKeyType))keyType{
    return ^(UIReturnKeyType type){
        self.returnKeyType = type;
        return self;
    };
}
- (UITextField * _Nonnull (^)(CGRect))wag_frame{
    return ^(CGRect frame){
        self.frame = frame;
        return self;
    };
}
- (UITextField * _Nonnull (^)(NSTextAlignment))alignment{
    return ^(NSTextAlignment aligment){
        self.textAlignment = aligment;
        return self;
    };
}
- (UITextField * _Nonnull (^)(UIColor * _Nonnull))wag_backgroudColor{
    return ^(UIColor *color){
        self.backgroundColor = color;
        return self;
    };
}
@end
