//
//  WAGImageTableViewCell.m
//  女神
//
//  Created by wangaiguo on 2019/6/10.
//  Copyright © 2019 王爱国. All rights reserved.
//

#import "WAGImageTableViewCell.h"
#import "UIImage+WAGImage.h"

@implementation WAGImageTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _titleLabel.frame = CGRectMake(10, 0, SCREEN_WIDTH - 20, 30);
    _imageV.frame = CGRectMake(10, 30, SCREEN_WIDTH - 20, 270);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setData:(NSIndexPath *)indexPath{
//    _titleLabel.text = @"天青色等烟雨而我在等你";

    UIImage *image = IMG(@"天青色等烟雨而我在等你");
    switch (indexPath.row) {
        case 0:
            _imageV.image = image;
            _titleLabel.text = @"原始图片";
            break;
        case 1:
            _titleLabel.text = @"竖直对称";
            _imageV.image = [image rotate:UIImageOrientationUpMirrored];
            break;
        case 2:
            _titleLabel.text = @"中心点旋转180度";
            _imageV.image = [image rotate:UIImageOrientationDown];
            break;
        case 3:
            _titleLabel.text = @"底部为对称抽对称";
            _imageV.image = [image rotate:UIImageOrientationDownMirrored];
            break;
        case 4:
            _titleLabel.text = @"UIImageOrientationLeft";
            _imageV.image = [image rotate:UIImageOrientationLeft];
            break;
        case 5:
            _titleLabel.text = @"UIImageOrientationLeftMirrored";
            _imageV.image = [image rotate:UIImageOrientationLeftMirrored];
            break;
        case 6:
            _titleLabel.text = @"UIImageOrientationRight";
            _imageV.image = [image rotate:UIImageOrientationRight];
            break;
        case 7:
            _titleLabel.text = @"UIImageOrientationRightMirrored";
            _imageV.image = [image rotate:UIImageOrientationRightMirrored];
            break;
        default:
            break;
    }


}

@end
