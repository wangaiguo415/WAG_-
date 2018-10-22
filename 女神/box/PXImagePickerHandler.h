//
//  BAImagePickerHandler.h
// llhz
//
//  Created by kelamo on 16/10/8.
//  Copyright © 2016年 kelamo. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^PXImagePickerBlock)(NSDictionary *imageInfo);

@interface PXImagePickerHandler : NSObject

- (void)imagePickerPresentForm:(UIViewController *)controller
                 allowsEditing:(BOOL)allowsEditing
                 didFinshBlock:(PXImagePickerBlock)finishBlcok;

- (void)imagePickerPresentForm:(UIViewController *)controller
                    sourceType:(UIImagePickerControllerSourceType)sourceType
                 allowsEditing:(BOOL)allowsEditing
                 didFinshBlock:(PXImagePickerBlock)finishBlcok;

@end
