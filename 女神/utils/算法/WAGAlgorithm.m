//
//  WAGAlgorithm.m
//  女神
//
//  Created by wangaiguo on 2019/5/24.
//  Copyright © 2019 王爱国. All rights reserved.
//

#import "WAGAlgorithm.h"

@implementation WAGAlgorithm
- (void)bubbleSortWithArray:(NSMutableArray *)array {
    for (int i = 0; i < array.count - 1; i++) {
        //外层for循环控制循环次数
        for (int j = 0; j < array.count - 1 - i; j++) {
            //内层for循环控制交换次数
            if ([array[j] integerValue] > [array[j + 1] integerValue]) {
                [array exchangeObjectAtIndex:j withObjectAtIndex:j + 1];
            }
        }
    }
}

- (void)mergeSortWithArray:(NSMutableArray *)array
                      left:(NSInteger)left
                     right:(NSInteger)right {
    //判断递归到底的情况
    if (left >= right) {
        //这时候只有一个元素或者是不存在的情况
        return;
    }
    //中间索引的位置
    NSInteger middle = (right + left) / 2;
    //对 left --- middle 区间的元素进行排序操作
    [self mergeSortWithArray:array left:left right:middle];
    //对 middle + 1 ---- right 区间的元素进行排序操作
    [self mergeSortWithArray:array left:middle + 1 right:right];
    //两边排序完成后进行归并操作
    [self mergeSortWithArray:array left:left middle:middle right:right];
}
- (void)mergeSortWithArray:(NSMutableArray *)array
                      left:(NSInteger)left
                    middle:(NSInteger)middle
                     right:(NSInteger)right {
    //拷贝一个数组出来
    NSMutableArray *copyArray = [NSMutableArray arrayWithCapacity:right - left + 1];
    for (NSInteger i = left; i <= right; i++) {
        //这里要注意有left的偏移量，所以copyArray赋值的时候要减去left
        copyArray[i - left] = array[i];
    }

    NSInteger i = left, j = middle + 1;
    //循环从left开始到right区间内给数组重新赋值，注意赋值的时候也是从left开始的，不要习惯写成了从0开始，还有都是闭区间
    for (NSInteger k = left; k <= right; k++) {
        //当左边界超过中间点时 说明左半部分数组越界了 直接取右边部分的数组的第一个元素即可
        if (i > middle) {
            //给数组赋值 注意偏移量left 因为这里是从left开始的
            array[k] = copyArray[j - left];
            //索引++
            j++;
        } else if (j > right) {//当j大于右边的边界时证明有半部分数组越界了，直接取左半部分的第一个元素即可
            array[k] = copyArray[i - left];
            //索引++
            i++;
        } else if (copyArray[i - left] > copyArray[j - left]) {//左右两半部分数组比较
            //当右半部分数组的第一个元素要小时 给数组赋值为右半部分的第一个元素
            array[k] = copyArray[j - left];
            //右半部分索引加1
            j++;
        } else {//右半部分数组首元素大于左半部分数组首元素
            array[k] = copyArray[i - left];
            i++;
        }
    }
}
@end
