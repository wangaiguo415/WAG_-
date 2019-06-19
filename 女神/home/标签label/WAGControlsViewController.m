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

@interface WAGControlsViewController ()

@end

@implementation WAGControlsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"控件--链式设置"];
    self.view.backgroundColor = [UIColor whiteColor];

    [self lable];
    [self button];
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
@end
