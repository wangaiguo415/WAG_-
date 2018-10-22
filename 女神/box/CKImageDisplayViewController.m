//
//  CKImageDisplayViewController.m
//  ck
//
//  Created by 范文青 on 15/12/2.
//  Copyright © 2015年 chin. All rights reserved.
//

#import "CKImageDisplayViewController.h"

@interface CKImageCollectionViewCell()<UIScrollViewDelegate>{
    UITapGestureRecognizer *_doubleTap;
    UITapGestureRecognizer *_singleTap;
}
@end

#pragma mark - **************    CKImageCollectionViewCell    **************
@implementation CKImageCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //_contentImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, DIMENSION(200))];
        _contentImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        [_contentImageView setClipsToBounds:YES];
        [_contentImageView setContentMode:UIViewContentModeScaleAspectFill];
        [_contentImageView setCenterY:self.height/2.0];

        
        /****************///////////////////////////////////////////////////////////////////////*******************/
        
        _didLoadImage = NO;
        WEAK_SELF
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH,self.height)];
        [_scrollView addSubview:_contentImageView];
        [_scrollView setMaximumZoomScale:2.0];
        [_scrollView setMinimumZoomScale:1.0];
        [_scrollView setDecelerationRate:1.0];
        [_scrollView setDelegate:me];
        [_scrollView setClipsToBounds:YES];
        _scrollView.zoomScale = 1.0f;
        
        //Gesture
        _doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTap:)];
        _doubleTap.numberOfTapsRequired = 2;
        _doubleTap.numberOfTouchesRequired  = 1;
        
        _singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
        _singleTap.numberOfTapsRequired = 1;
        _singleTap.numberOfTouchesRequired = 1;
        [_singleTap requireGestureRecognizerToFail:_doubleTap];//只能有一个手势存在
        
        [self.contentView addGestureRecognizer:_doubleTap];
        [self.contentView addGestureRecognizer:_singleTap];
        
        /****************///////////////////////////////////////////////////////////////////////*******************/
        
        [self.contentView addSubview:_scrollView];
    }
    return self;
}

#pragma mark - 1.cell数据注入
- (void)setImageUrl:(NSString *)url{
    WEAK_SELF
    [self setImage:IMG(@"dengluyebeijing")];
    [_contentImageView sd_setImageWithURL:[NSURL URLWithString:YCMUrlString(url)] placeholderImage:IMG(@"dengluyebeijing") completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
         if(image){
            _didLoadImage = YES;
            [me setImage:image];
        }
    }];
}

#pragma mark - 2.注入后UI调整
- (void)setImage:(UIImage *)image{
    [_contentImageView setImage:image];
    CGSize size = [self cropSize:image.size];
    [_contentImageView setFrame:CGRectMake((self.scrollView.width - size.width)/2.0, (self.scrollView.height - size.height)/2.0, size.width, size.height)];
    
}

- (void)setUnifyImage:(YCMSampleInfoImagesBean *)bean{
    if (bean.localString != nil) {
        [self setImage:IMG(bean.localString)];
    }else if (bean.isSubmited){
        [self setImageUrl:bean.urlString];
    }else{
        _didLoadImage = YES;
        [self setImage:bean.image];
    }
}

#pragma mark - ==========    图片缩放   ==========
#pragma mark - 1.手势
- (void)handleDoubleTap:(UITapGestureRecognizer *)recognizer{
    if (!_didLoadImage)return;   //图片还未加载完双击没有效果
    CGPoint touchPoint = [recognizer locationInView:self];
    if (_scrollView.zoomScale <= 1.0){
        CGFloat scaleX = touchPoint.x + _scrollView.contentOffset.x;//需要放大的图片的X点
        CGFloat sacleY = touchPoint.y + _scrollView.contentOffset.y;//需要放大的图片的Y点
        [_scrollView zoomToRect:CGRectMake(scaleX, sacleY, 10, 10) animated:YES];
    }  else{
        [_scrollView setZoomScale:1.0 animated:YES]; //还原
    }
}
- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer{
    [self dismiss];
}

#pragma mark - 2.scrollView delegate

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    //如需在未加载完图片之前不允许俩指缩放图片,需在此处使用_didLoadImage过滤
    return _contentImageView;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView{
    self.contentImageView.center = [self centerOfScrollViewContent:scrollView];
}

- (CGPoint)centerOfScrollViewContent:(UIScrollView *)scrollView{
    CGFloat offsetX = (scrollView.bounds.size.width > scrollView.contentSize.width)?
    (scrollView.bounds.size.width - scrollView.contentSize.width) * 0.5 : 0.0;
    CGFloat offsetY = (scrollView.bounds.size.height > scrollView.contentSize.height)?
    (scrollView.bounds.size.height - scrollView.contentSize.height) * 0.5 : 0.0;
    CGPoint actualCenter = CGPointMake(scrollView.contentSize.width * 0.5 + offsetX,
                                       scrollView.contentSize.height * 0.5 + offsetY);
    return actualCenter;
}

#pragma mark - ==========    其他    ==========
#pragma mark - imageView的比例调整
- (CGSize)cropSize:(CGSize)imageSize{
    CGSize maxSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT);
    float wRatio = imageSize.width/maxSize.width;
    float hRatio = imageSize.height/maxSize.height;
    float ratio  = wRatio > hRatio ? wRatio : hRatio;
    return CGSizeMake(round(imageSize.width / ratio), round(imageSize.height / ratio));
}

- (void)dismiss{
    CKImageDisplayViewController *c = (CKImageDisplayViewController *)[self firstViewController];
    if ([c isKindOfClass:[CKImageDisplayViewController class]]) {
        [c dismiss];
    }
}

- (UIViewController *)firstViewController{
    id responder = self;
    //while循环找到响应者链条中第一个具备响应能力，并通过if筛选出该响应者链条中的控制器类型(只要是UIVC的之类都能通过isKindOfClass)
    while ((responder = [responder nextResponder])){
        if ([responder isKindOfClass:[UIViewController class]]){
            return responder;
        }
    }
    return nil;
}

- (void)setSource:(id)obj{
    if ([obj isKindOfClass:[UIImage class]]) {
        [self setImage:obj];
    }else if ([obj isKindOfClass:[NSString class]]){
        [self setImageUrl:obj];
    }
}

@end


#pragma mark - **************    CKImageDisplayViewController    **************

@interface CKImageDisplayViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>{
    UIImageView *_bgImageView;
    NSInteger _currentPage;
}
@end

@implementation CKImageDisplayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithWhite:0 alpha:1.0]];
    
    UICollectionViewFlowLayout  *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setMinimumInteritemSpacing:0];
    [flowLayout setMinimumLineSpacing:0];
    [flowLayout setItemSize:CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT)];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    [_collectionView setBackgroundColor:UIClearColor];
    [_collectionView setDelegate:self];
    [_collectionView setDataSource:self];
    [_collectionView setPagingEnabled:YES];
    //注册collectionCell
    [_collectionView registerClass:[CKImageCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.view addSubview:_collectionView];

    _numsLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 50, SCREEN_WIDTH, 20)];
    _numsLabel.font = [UIFont systemFontOfSize:12];
    _numsLabel.textAlignment = NSTextAlignmentCenter;
    _numsLabel.textColor = UIffffffColor;
    [self.view addSubview:_numsLabel];
    
}


#pragma mark - ==========    collectionView数据源|代理    ==========

- (void)setSources:(NSArray *)sources{
    _sources = sources;
    [_collectionView reloadData];
}

- (void)setWorkSources:(NSArray<YCMSampleInfoImagesBean *> *)workSources{
    _workSources = workSources;
    //sourcesLink中存储的是所有CKUserWorksImageItem里边的imageUrl的字符串数组
//    NSArray *sourcesLink = [workSources map:^id(CKUserWorksImageItem *object) {
//        return [object imageUrl];
//    }];
//    [self setSources:sourcesLink];
    NSMutableArray *sourcesLink = [NSMutableArray array];
    [workSources enumerateObjectsUsingBlock:^(YCMSampleInfoImagesBean * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.urlString) {
            [sourcesLink addObject:obj.urlString];
        }
    }];
    [self setSources:sourcesLink];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _sources.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CKImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    id obj = [_sources objectAtIndex:indexPath.row];
    
    //以下三条防止复用到之前cell中的已经 zoom out 已变形scrollView
    [cell.scrollView setContentSize:CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT)];//warning
    cell.scrollView.zoomScale = 1.0f;
    cell.didLoadImage = NO;
    
    [cell setUnifyImage:obj];
    return cell;
}

#pragma mark - ==========    cell转向    ==========
#pragma mark -  前方
- (void)selectLink:(YCMSampleInfoImagesBean *)link{
    [self view];
    __block  NSInteger index = 0;
    [_sources enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isEqual:link]) {
            index = idx;
            *stop = YES;
        }
    }];
    //图片浏览器的collectionView和后方的那个collectionView需要同时转到同一个图片位置
    [_collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:index inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    _numsLabel.text = [NSString stringWithFormat:@"(%ld/%ld)", (long)index + 1, (long)_sources.count];
}

#pragma mark - 后方delegate
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger indexOfPage = scrollView.contentOffset.x / scrollView.frame.size.width;
    if (_currentPage == indexOfPage) {
        return;
    }
    _currentPage = indexOfPage;
    _numsLabel.text = [NSString stringWithFormat:@"(%ld/%ld)", (long)_currentPage + 1, (long)_sources.count];
    //报了警告没写防止他崩溃  respondsToSelector
    if ([self.delegate respondsToSelector:@selector(didScrollToLink:)]) {
        [self.delegate didScrollToLink:[_sources objectAtIndex:_currentPage]];
    }
}


#pragma mark - ==========    其他    ==========
- (void)show{
    self.view.alpha = 0.0;
    [[MAIN_WINDOW rootViewController] addChildViewController:self];
    [UIView animateWithDuration:0.3f animations:^{
        self.view.alpha = 1;
        [MAIN_WINDOW addSubview:self.view];
    }];
}

- (void)dismiss{
    [UIView animateWithDuration:0.3f animations:^{
        self.view.alpha = 0.0;
    } completion:^(BOOL finished) {
        if (finished) {
            [self.view removeFromSuperview];
            [self removeFromParentViewController];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
















