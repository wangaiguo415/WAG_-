//
//  WAGImageTableViewCell.h
//  女神
//
//  Created by wangaiguo on 2019/6/10.
//  Copyright © 2019 王爱国. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WAGImageTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageV;

- (void)setData:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
