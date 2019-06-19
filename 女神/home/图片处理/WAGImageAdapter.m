//
//  WAGImageAdapter.m
//  女神
//
//  Created by wangaiguo on 2019/6/10.
//  Copyright © 2019 王爱国. All rights reserved.
//

#import "WAGImageAdapter.h"
#import "WAGImageTableViewCell.h"

@implementation WAGImageAdapter
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 8;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 300;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WAGImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"imageCell"];
    [cell setData:indexPath];
    return cell;
}
@end
