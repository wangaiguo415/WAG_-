//
//  WAGSingletonsObject.m
//  女神
//
//  Created by wangaiguo on 2019/6/26.
//  Copyright © 2019 王爱国. All rights reserved.
//

#import "WAGSingletonsObject.h"

@implementation WAGSingletonsObject

/*
 * This will prevent possible and sometimes frequent crashes.
 **/

+ (instancetype)sharedInstance {
    static id sharedInstance = nil;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[[self class] alloc] init];
    });
    
    return sharedInstance;
}
@end
