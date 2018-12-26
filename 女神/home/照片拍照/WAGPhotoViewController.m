//
//  WAGPhotoViewController.m
//  女神
//
//  Created by wangaiguo on 2018/10/22.
//  Copyright © 2018年 王爱国. All rights reserved.
//

#import "WAGPhotoViewController.h"
#import "PXImagePickerHandler.h"

@interface WAGPhotoViewController (){
    PXImagePickerHandler *imageHandler;
}
@property (nonatomic, strong)UIImageView *imageView;
@end

@implementation WAGPhotoViewController

/*
 设置多媒体权限

 <key>NSCameraUsageDescription</key>
 <string>是否允许云茶萌使用你的相机</string>
 <key>NSPhotoLibraryUsageDescription</key>
 <string>是否允许云茶萌访问你的媒体资料库</string>
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"拍照"];
    [self.view setBackgroundColor:UICyanColor];
    [self configImageV];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    if (imageHandler == nil) {
        imageHandler = [PXImagePickerHandler new];
    }
    __weak WAGPhotoViewController *me = self;
    [imageHandler imagePickerPresentForm:self allowsEditing:NO didFinshBlock:^(NSDictionary *imageInfo) {
        me.imageView.image = imageInfo[UIImagePickerControllerOriginalImage];
    }];
}

- (void)configImageV{
    _imageView = [[UIImageView alloc]init];
    _imageView.frame = CGRectMake(0, 0, 200, 200);
    _imageView.backgroundColor = UIGreenColor;
    _imageView.center = CGPointMake(SCREEN_WIDTH/2.0, SCREEN_HEIGHT/2.0);
    [self.view addSubview:_imageView];
}
@end
