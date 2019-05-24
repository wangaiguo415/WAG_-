//
//  WAGAlgorithm.h
//  女神
//
//  Created by wangaiguo on 2019/5/24.
//  Copyright © 2019 王爱国. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WAGAlgorithm : NSObject

#pragma 冒泡排序
/*
 *  冒泡排序
 */
- (void)bubbleSortWithArray:(NSMutableArray *)array;

#pragma 归并排序
/*
 *  归并排序
    递归使用归并排序， 对array【left....right】的范围进行排序
    left 左边界
    right 右边界
 */
- (void)mergeSortWithArray:(NSMutableArray *)array
                      left:(NSInteger)left
                     right:(NSInteger)right;
/**
 对 [left middle] 和 [middle + 1 right]这两个区间归并操作
 @param array 传入的数组
 @param left 左边界
 @param middle 中间位置
 @param right 右边界
 */
- (void)mergeSortWithArray:(NSMutableArray *)array
                      left:(NSInteger)left
                    middle:(NSInteger)middle
                     right:(NSInteger)right;

@end
