//
//  WAGPhotoViewController.m
//  女神
//
//  Created by wangaiguo on 2018/10/22.
//  Copyright © 2018年 王爱国. All rights reserved.
//

#import "WAGPhotoViewController.h"
#import "PXImagePickerHandler.h"

@interface WAGPhotoViewController ()

@end

@implementation WAGPhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"拍照"];
    [self.view setBackgroundColor:UICyanColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
//    [PXImagePickerHandler ]
    
}

@end
