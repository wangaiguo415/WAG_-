//
//  WAGLabelViewController.m
//  女神
//
//  Created by wangaiguo on 2019/6/19.
//  Copyright © 2019 王爱国. All rights reserved.
//

#import "WAGControlsViewController.h"
#import "UILabel+Parameter.h"
#import "UIButton+Parameter.h"
#import "UITextField+Parameter.h"
#import <IQKeyboardManager.h>

@interface WAGControlsViewController ()

@end

@implementation WAGControlsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"控件--链式设置"];
    self.view.backgroundColor = [UIColor whiteColor];

    [self lable];
    [self button];
    [self textField];

    NSObject *wag1 = [NSObject alloc];
    NSObject *wag2 = [NSObject init];
    NSLog(@"%p --- %p", wag1, wag2);

    UIStackView
}

- (void)lable{
    UILabel *label = [UILabel wag_createLabel:^(UILabel * _Nonnull label) {
        label.wag_text(@"label -- easy").wag_font([UIFont systemFontOfSize:25]).wag_textColor([UIColor blueColor]).wag_textAlignment(NSTextAlignmentCenter);
    }];
    label.frame = CGRectMake(0, 200, self.view.Ex_width, 30);
    [self.view addSubview:label];
}

- (void)button{
    UIButton *btn = [UIButton createBtn:^(UIButton * _Nonnull btn) {
        btn.title(@"按钮").titleColor([UIColor redColor]).backGroudColor([UIColor cyanColor])
        .wag_frame(CGRectMake(0, 250, SCREEN_WIDTH, 30));
    }];
    [self.view addSubview:btn];
}

- (void)textField{
    UITextField *textField = [UITextField createField:^(UITextField * _Nonnull textField) {
        textField.wag_placeHolder(@"请输入......")
        .wag_textColor([UIColor greenColor])
        .wag_font([UIFont systemFontOfSize:20])
        .keyType(UIReturnKeyDone)
        .wag_frame(CGRectMake(0, SCREEN_HEIGHT - 88, SCREEN_WIDTH, 40))
        .wag_backgroudColor([UIColor cyanColor])
        .alignment(NSTextAlignmentCenter);
    }];
    [self.view addSubview:textField];
}
@end
