//
//  CKImageDisplayViewController.h
//  ck
//
//  Created by 范文青 on 15/12/2.
//  Copyright © 2015年 chin. All rights reserved.
//

#import "YCMBaseViewController.h"
#import "YCMSampleInfoImagesBean.h"

@protocol CKImageDisplayViewControllerDelegate <NSObject>
- (void)didScrollToLink:(NSString *)link;
@end


@interface CKImageDisplayViewController : YCMBaseViewController{
    UICollectionView *_collectionView;
}
@property (nonatomic, strong) UILabel *numsLabel;

- (void)show;
- (void)dismiss;
- (void)selectLink:(NSString *)link;

@property (nonatomic, assign) id<CKImageDisplayViewControllerDelegate> delegate;
//sources中存储的是workSources数组中所有CKUserWorksImageItem里边的imageUrl的字符串数组
@property (nonatomic, strong) NSArray *sources;
@property (nonatomic, strong) NSArray<YCMSampleInfoImagesBean  *> *workSources;
@end


@interface CKImageCollectionViewCell : UICollectionViewCell{
}
@property (nonatomic, strong) UIImageView *contentImageView;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, assign) BOOL didLoadImage;
@end
