//
//  {{args.Prefix}}SharePopView.m
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 2017/5/16.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}SharePopView.h"
#import "{{args.Prefix}}PopView.h"
#import "{{args.Prefix}}ShareCollectionViewCell.h"

const CGFloat kNumberOfCellsInRow = 5;

@interface {{args.Prefix}}SharePopView () <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,{{args.Prefix}}ShareCollectionViewCellDelegate>

@property (nonatomic, strong) {{args.Prefix}}PopView *popUpView;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIView *contentView;

@end

@implementation {{args.Prefix}}SharePopView

+ (instancetype)sharedInstance{
    static {{args.Prefix}}SharePopView *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[{{args.Prefix}}SharePopView alloc] init];
    });
    return sharedInstance;
}

- (void)setContents:(NSArray *)contents{
    _contents = contents;
    [self configView];
}

-(void)configView{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init]; // 自定义的布局对象
    layout.itemSize = [self calculateItemSize];
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 45 + [self collectionViewHeight])];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 45)];
    titleLabel.text = @"分享到";
    titleLabel.textColor = [UIColor colorWithRGBValue:0x333333];
    titleLabel.font = [UIFont systemFontOfSize:18];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.backgroundColor = [UIColor colorWithRGBValue:0xf4f4f4];
    [_contentView addSubview:titleLabel];
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 45, SCREEN_WIDTH, [self collectionViewHeight])
                                         collectionViewLayout:layout];
    _collectionView.backgroundColor = [UIColor colorWithRGBValue:0xf4f4f4];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    [_collectionView registerClass:[{{args.Prefix}}ShareCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([{{args.Prefix}}ShareCollectionViewCell class])];
    [_contentView addSubview:_collectionView];
    
    _popUpView = [[{{args.Prefix}}PopView alloc] initWithContentView:_contentView];
}

- (void)show{
    [self.popUpView popup];
}

- (void)dismiss{
    [self.popUpView dismiss];
}

#pragma mark ---- UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _contents.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    {{args.Prefix}}ShareCollectionViewCell *cell = [_collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([{{args.Prefix}}ShareCollectionViewCell class]) forIndexPath:indexPath];
    cell.data = _contents[indexPath.row];
    cell.delegate = self;
    return cell;
}


#pragma mark ---- UICollectionViewDelegate

// 选中某item
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}

#pragma mark ---- UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return [self calculateItemSize];
}


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 13, 0, 13);
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}


- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

#pragma mark ------SPShareCollectionViewCellDelegate

- (void)onClickShareItem:({{args.Prefix}}ShareCollectionViewCell *)cell{
    // to do: 处理cell点击之后的操作
    [self dismiss];
}


# pragma mark private method
- (CGFloat)collectionViewHeight{
    return kShareCollectionCellHeight * ceilf(_contents.count/kNumberOfCellsInRow);
}

- (CGSize)calculateItemSize{
    CGFloat height = kShareCollectionCellHeight;
    CGFloat width = (SCREEN_WIDTH - 26)/kNumberOfCellsInRow;
    return CGSizeMake(width, height);
}


@end
