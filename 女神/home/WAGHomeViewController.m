//
//  WAGHomeViewController.m
//  女神
//
//  Created by wangaiguo on 2018/10/19.
//  Copyright © 2018年 王爱国. All rights reserved.
//

#import "WAGHomeViewController.h"
#import "WAGSegmentViewController.h"
#import "WAGShowMessageViewController.h"
#import "WAGPhotoViewController.h"
#import "WAGTableHeaderController.h"
#import "WAGDesignViewController.h"
#import "WAGImageViewController.h"
#import "WAGControlsViewController.h"


@interface WAGHomeViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    UITableView *_tableView;
    NSArray *_dataSource;
}
@end

@implementation WAGHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor cyanColor]];
    [self setTitle:@"我的女神"];
    [self configDataSource];
    [self configTable];
    
}

// ``` 各种三方操作常用数据源 ```
- (void)configDataSource{
    _dataSource = @[@"first::::有问题的segment", @"second::::加载动画", @"third::::照片选择", @"fouth::::表白动图", @"fifth: table_header", @"sixth: 设计模式简介", @"seventh:图片镜像处理", @"控件--链式设置", @"ninth:",];
}

- (void)configTable{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

#pragma tableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.contentView.backgroundColor = UIRandomColor;
    cell.textLabel.text = _dataSource[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self didSelectRow:indexPath];
}
/*
 *  点击操作
 */
- (void)didSelectRow:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
            [self pushTo:[WAGSegmentViewController new]];
            break;
        case 1:
            [self pushTo:[WAGShowMessageViewController new]];
            break;
        case 2:
            [self pushTo:[WAGPhotoViewController new]];
            break;
        case 4:
            [self pushTo:[WAGTableHeaderController new]];
            break;
        case 5:
            [self pushTo:[WAGDesignViewController new]];
            break;
        case 6:
            [self pushTo:[WAGImageViewController new]];
            break;
        case 7:
            [self pushTo:[WAGControlsViewController new]];
            break;
        case 8:
            break;
        default:
            break;
    }
}
/*
 *   视图控制器跳转
 */
- (void)pushTo:(UIViewController *)godness{
    [self.navigationController pushViewController:godness animated:YES];
}
@end
