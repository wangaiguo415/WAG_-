//
//  WAGImageViewController.m
//  女神
//
//  Created by wangaiguo on 2019/6/10.
//  Copyright © 2019 王爱国. All rights reserved.
//

#import "WAGImageViewController.h"
#import "WAGImageAdapter.h"
#import "UITableView+Adapter.h"
#import "WAGImageTableViewCell.h"

@interface WAGImageViewController (){
    WAGImageAdapter *_adapter;
}

@end

@implementation WAGImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"图片镜像处理"];
    _adapter = [WAGImageAdapter new];
    [self.tableView setAdapter:_adapter];
    [self.tableView registerNib:[UINib nibWithNibName:@"WAGImageTableViewCell" bundle:nil] forCellReuseIdentifier:@"imageCell"];
}


@end
