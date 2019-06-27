//
//  WAGSingletonsObject.h
//  女神
//
//  Created by wangaiguo on 2019/6/26.
//  Copyright © 2019 王爱国. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WAGSingletonsObject : NSObject

/*
 * Singleton objects SHOULD use a thread-safe pattern for creating their shared instance.
 **/

+ (instancetype)sharedInstance;

@end

NS_ASSUME_NONNULL_END
