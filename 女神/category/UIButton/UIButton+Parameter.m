//
//  UIButton+Parameter.m
//  女神
//
//  Created by wangaiguo on 2019/6/19.
//  Copyright © 2019 王爱国. All rights reserved.
//

#import "UIButton+Parameter.h"

@implementation UIButton (Parameter)

+ (UIButton *)createBtn:(void (^)(UIButton * _Nonnull))block{
    //UIButton *btn = [UIButton new];
    //默认button type 为 UIButtonTypeCustom
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    block(btn);
    return btn;
}
- (UIButton * _Nonnull (^)(NSString * _Nonnull))title{
    return ^(NSString *title){
        [self setTitle:title forState:UIControlStateNormal];
        return self;
    };
}
- (UIButton * _Nonnull (^)(UIColor * _Nonnull))titleColor{
    return ^(UIColor *color){
        [self setTitleColor:color forState:UIControlStateNormal];
        return self;
    };
}
- (UIButton * _Nonnull (^)(UIColor * _Nonnull))backGroudColor{
    return ^(UIColor *color){
        [self setBackgroundColor:color];
        return self;
    };
}
- (UIButton * _Nonnull (^)(UIImage * _Nonnull))image{
    return ^(UIImage *image){
        [self setImage:image forState:UIControlStateNormal];
        return self;
    };
}
- (UIButton * _Nonnull (^)(UIImage * _Nonnull))backGroundImage{
    return ^(UIImage *image){
        [self setBackgroundImage:image forState:UIControlStateNormal];
        return self;
    };
}
- (UIButton * _Nonnull (^)(UIFont * _Nonnull))font{
    return ^(UIFont *font){
        self.titleLabel.font = font;
        return self;
    };
}
- (UIButton * _Nonnull (^)(CGRect))wag_frame{
    return ^(CGRect frame){
        self.frame = frame;
        return self;
    };
}
@end
