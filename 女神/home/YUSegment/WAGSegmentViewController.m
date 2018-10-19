//
//  WAGSegmentViewController.m
//  女神
//
//  Created by wangaiguo on 2018/10/19.
//  Copyright © 2018年 王爱国. All rights reserved.
//

#import "WAGSegmentViewController.h"
#import <YUSegment.h>

@interface WAGSegmentViewController (){
    YUSegmentedControl *_segment;
}

@end

@implementation WAGSegmentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"segment";
    [self configSegment];
}
// 这家伙不太好用啊 ···· 竟然有很大的问题 ····
- (void)configSegment{
    _segment = [[YUSegmentedControl alloc]initWithTitles:@[@"first", @"second", @"third"]];
    _segment.frame = CGRectMake(0, NAV_TOP, SCREEN_WIDTH, 44);
    [self.view addSubview:_segment];
}
@end
