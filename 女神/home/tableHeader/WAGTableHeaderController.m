//
//  WAGTableHeaderController.m
//  女神
//
//  Created by wangaiguo on 2018/10/23.
//  Copyright © 2018年 王爱国. All rights reserved.
//

#import "WAGTableHeaderController.h"
#import "ParallaxHeaderView.h"
#import "WAGTableViewAdapter.h"
#import "UITableView+Adapter.h"

@interface WAGTableHeaderController (){
    WAGTableViewAdapter *_adapter;
}

@end

@implementation WAGTableHeaderController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"header图片拉伸"];
    [self configHeader];
}
/*
 *  很简单的用法~
 *  声明header + 实现代理方法
 */
- (void)configHeader{
    ParallaxHeaderView *header = [ParallaxHeaderView parallaxHeaderViewWithImage:IMG(@"my_dream_lover") forSize:CGSizeMake(SCREEN_WIDTH, 250)];
    [header refreshBlurViewForNewImage];
    [self.tableView setTableHeaderView:header];
    _adapter = [WAGTableViewAdapter new];
    [self.tableView setAdapter:_adapter];
    [self.tableView setContentInset:UIEdgeInsetsMake(NAV_TOP, 0, 0, 0)];
    WEAK_SELF
    [_adapter setDidScroll:^(UITableView *tableView) {
        [(ParallaxHeaderView *)me.tableView.tableHeaderView layoutHeaderViewForScrollViewOffset:tableView.contentOffset];
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
