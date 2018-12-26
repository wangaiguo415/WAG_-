//
//  CommonHeader.h
//  女神
//
//  Created by wangaiguo on 2018/10/26.
//  Copyright © 2018 王爱国. All rights reserved.
//

#ifndef CommonHeader_h
#define CommonHeader_h

/*
 *  沙盒存取
 */
// 写入
#define USER_D_SAVE(key, value)\
NSUserDefaults *def =[NSUserDefaults standardUserDefaults];\
[def setObject:value forKey:key];\
[def synchronize];
// 拿出
#define USER_D_GET(key)   [[NSUserDefaults standardUserDefaults] objectForKey:key]
// 删除
#define USER_D_REMOVE(key) \
NSUserDefaults *def =[NSUserDefaults standardUserDefaults];\
[def removeObjectForKey:key];\
[def synchronize];


/*
 *  常用的一些操作方法设置
 */
#define IMG(img) [UIImage imageNamed:img]
#define FONT_BASE(size) [UIFont systemFontOfSize:size]
#define FONT_BOLD(size) [UIFont boldSystemFontOfSize:size]
#define kStringIsEmpty(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )
#define kArrayIsEmpty(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)
#define kDictIsEmpty(dic) (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0)



//#pragma mark ---- 去除 performSelector警告 --------
//去除"-(id)performSelector:(SEL)aSelector withObject:(id)object;"的警告
#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)

#endif /* CommonHeader_h */
