//
//  WAGShowMessageViewController.m
//  女神
//
//  Created by wangaiguo on 2018/10/19.
//  Copyright © 2018年 王爱国. All rights reserved.
//

#import "WAGShowMessageViewController.h"
#import "HudUtils.h"

@interface WAGShowMessageViewController ()

@end

@implementation WAGShowMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"加载动画";
    [self.view setBackgroundColor:UICyanColor];
    [HudUtils show:self.view];
    [self performSelector:@selector(hudHide) withObject:nil afterDelay:3];
}
- (void)hudHide{
    [HudUtils hide:self.view];
    [HudUtils showMessage:@"提示信息"];
}
@end
