//
//  BAImagePickerHandler.m
// llhz
//
//  Created by kelamo on 16/10/8.
//  Copyright © 2016年 kelamo. All rights reserved.
//

#import "PXImagePickerHandler.h"

@interface PXImagePickerHandler ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate,UIAlertViewDelegate>

@property (nonatomic, copy) PXImagePickerBlock finishBlcok;

@end

@implementation PXImagePickerHandler

- (void)imagePickerPresentForm:(UIViewController *)controller
                 allowsEditing:(BOOL)allowsEditing
                 didFinshBlock:(PXImagePickerBlock)finishBlcok{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    __weak __typeof(&*self)weakSelf = self;
    UIAlertAction *libraryAction = [UIAlertAction actionWithTitle:@"从相册上传" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        __strong __typeof(&*weakSelf)strongSelf = weakSelf;
        [strongSelf imagePickerPresentForm:controller sourceType:UIImagePickerControllerSourceTypePhotoLibrary allowsEditing:allowsEditing didFinshBlock:finishBlcok];
    }];
    [alertController addAction:libraryAction];
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIAlertAction *cameraAction = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            __strong __typeof(&*weakSelf)strongSelf = weakSelf;
            [strongSelf imagePickerPresentForm:controller sourceType:UIImagePickerControllerSourceTypeCamera allowsEditing:allowsEditing didFinshBlock:finishBlcok];
        }];
        [alertController addAction:cameraAction];
    }
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:cancelAction];
    
    [controller presentViewController:alertController animated:YES completion:nil];
}

- (void)imagePickerPresentForm:(UIViewController *)controller
                    sourceType:(UIImagePickerControllerSourceType)sourceType
                 allowsEditing:(BOOL)allowsEditing
                 didFinshBlock:(PXImagePickerBlock)finishBlcok{
    self.finishBlcok = finishBlcok;
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.allowsEditing = allowsEditing;
    imagePicker.delegate = self;
    imagePicker.sourceType = sourceType;
    [controller presentViewController:imagePicker animated:YES completion:^{}];
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    __weak __typeof(&*self)weakSelf = self;
    [picker dismissViewControllerAnimated:NO completion:^{
        CGRect cropRect = [info[UIImagePickerControllerCropRect] CGRectValue];
        UIImage *originImage = info[UIImagePickerControllerOriginalImage] ;
        UIImage *resultImg = [self originImage:originImage cropRect:cropRect slider:1024];
        if (resultImg) {
            [info setValue:resultImg forKey:UIImagePickerControllerEditedImage];
        }
        if (weakSelf.finishBlcok) {
            weakSelf.finishBlcok(info);
            weakSelf.finishBlcok = nil;
        }
    }];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    __weak __typeof(&*self)weakSelf = self;
    [picker dismissViewControllerAnimated:YES completion:^{
        if (weakSelf.finishBlcok) {
            weakSelf.finishBlcok = nil;
        }
    }];
}

//缩放
- (UIImage*)originImage:(UIImage *)originImage cropRect:(CGRect)cropRect slider:(CGFloat)slider{
    CGImageRef imageRef = CGImageCreateWithImageInRect(originImage.CGImage, cropRect);
    UIImage *cropImage = [UIImage imageWithCGImage:imageRef];
    CGFloat width = CGImageGetWidth(imageRef);
    CGFloat height = CGImageGetHeight(imageRef);
    CGImageRelease(imageRef);
    
    CGFloat verticalRadio = slider*1.0/height;
    CGFloat horizontalRadio = slider*1.0/width;
    CGFloat radio = 1;
    if(verticalRadio > 1 && horizontalRadio > 1){
        return cropImage;
    } else {
        radio = verticalRadio > horizontalRadio ? horizontalRadio : verticalRadio;
        width = width*radio;
        height = height*radio;
        CGSize newSize = CGSizeMake(width, height);
        UIGraphicsBeginImageContext(newSize);
        [cropImage drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
        UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return scaledImage;
    }
    
    
}


@end
