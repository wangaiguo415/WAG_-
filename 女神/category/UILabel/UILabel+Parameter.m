//
//  UILabel+Parameter.m
//  女神
//
//  Created by wangaiguo on 2019/6/19.
//  Copyright © 2019 王爱国. All rights reserved.
//

#import "UILabel+Parameter.h"

@implementation UILabel (Parameter)
+ (UILabel *)wag_createLabel:(void (^)(UILabel * _Nonnull label))block{
    UILabel *label = [UILabel new];
    block(label);
    return label;
}
- (UILabel *(^)(NSString *))wag_text{
    return ^(NSString *str){
        self.text = str;
        return self;
    };
}
- (UILabel *(^)(UIFont *))wag_font{
    return ^(UIFont *font){
        self.font = font;
        return self;
    };
}
- (UILabel * _Nonnull (^)(CGFloat))wag_boldFontSize{
    return ^(CGFloat size){
        self.font = [UIFont boldSystemFontOfSize:size];
        return self;
    };
}
- (UILabel *(^)(UIColor *))wag_textColor{
    return ^(UIColor *color){
        self.textColor = color;
        return self;
    };
}
- (UILabel *(^)(NSTextAlignment))wag_textAlignment{
    return ^(NSTextAlignment alignment){
        self.textAlignment = alignment;
        return self;
    };
}
- (UILabel * _Nonnull (^)(CGRect))wag_frame{
    return ^(CGRect frame){
        self.frame = frame;
        return self;
    };
}
@end
