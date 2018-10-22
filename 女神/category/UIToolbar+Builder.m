//
//  UIToolbar+Builder.m
//  wte
//
//  Created by 范文青 on 14-6-10.
//  Copyright (c) 2014年 fwq. All rights reserved.
//

#import "UIToolbar+Builder.h"
@implementation UIToolbar (Builder)
+ (UIView *)inputAccessoryView
{
    UIView  *toolBar = [[UIView alloc ]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
    [toolBar setBackgroundColor:UIWhiteColor];
    UIButton  *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setFrame:CGRectMake(SCREEN_WIDTH - 50, 0, 50, 40)];
    [rightButton addTarget:self action:@selector(keyboradResifirstResponder) forControlEvents:UIControlEventTouchUpInside];
    [rightButton setTitle:@"完成" forState:UIControlStateNormal];
    [[rightButton titleLabel] setFont:[UIFont systemFontOfSize:15.0f]];
    [rightButton setTitleColor:UICommonColor forState:UIControlStateNormal];
    [rightButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [toolBar addSubview:rightButton];
    [toolBar setBackgroundColor:UIWhiteColor];
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 40, SCREEN_WIDTH, 1.0/[UIScreen mainScreen].scale)];
    [line setBackgroundColor:UIGrayColor];
    [toolBar addSubview:line];
    return toolBar;
}
- (void)keyboradResifirstResponder{
    [[UIApplication sharedApplication].delegate.window endEditing:YES];
}
@end
