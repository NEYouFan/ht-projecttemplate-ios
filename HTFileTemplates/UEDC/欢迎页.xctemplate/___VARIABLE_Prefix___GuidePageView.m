//
//  ___VARIABLE_Prefix:identifier___GuidePageView.m
//  ___VARIABLE_Prefix:identifier___
//
//  Created by shoulei ma on 2017/5/26.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "___VARIABLE_Prefix:identifier___GuidePageView.h"
#import "___VARIABLE_Prefix:identifier___GuidePageModel.h"
#import "___VARIABLE_Prefix:identifier___GuidePageItem.h"
#import "UIView+Frame.h"

@interface ___VARIABLE_Prefix:identifier___GuidePageView () <UIScrollViewDelegate,
                                 ___VARIABLE_Prefix:identifier___GuidePageItemDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;

@property (nonatomic, strong) NSMutableArray <___VARIABLE_Prefix:identifier___GuidePageItem *> *gidePageItems;

@end

@implementation ___VARIABLE_Prefix:identifier___GuidePageView

#pragma mark - Life cycle.

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _scrollView.frame = self.frame;
    _scrollView.contentSize = CGSizeMake(self.width * _models.count, self.height);
    
    _pageControl.width = self.width;
    _pageControl.height = 15;
    _pageControl.x = 0;
    _pageControl.bottom = self.height - 30;
    
    for (NSInteger i = 0; i < _gidePageItems.count; i++) {
        ___VARIABLE_Prefix:identifier___GuidePageItem *item = _gidePageItems[i];
        item.size = CGSizeMake(self.width, self.height);
        item.y = 0;
        item.x = i * self.width;
        
        if (_models[i].isShowButton) {
            item.delegate = self;
        }
    }
}


#pragma mark - Load subViews.

- (void)reloadSubViews {
    _scrollView = [[UIScrollView alloc] init];
    [self addSubview:_scrollView];
    _scrollView.delegate = self;
    _scrollView.backgroundColor = [UIColor whiteColor];
    _scrollView.pagingEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.contentOffset = CGPointMake(0, 0);
    
    _pageControl = [[UIPageControl alloc] init];
    [self addSubview:_pageControl];
    _pageControl.currentPageIndicatorTintColor = [UIColor colorWithRGBValue:kLightTextColor];
    _pageControl.pageIndicatorTintColor =  [UIColor colorWithRGBValue:0xdddddd];
    _pageControl.numberOfPages = _models.count;
    _pageControl.transform = CGAffineTransformMakeScale(0.8, 0.8);
    [_pageControl addTarget:self action:@selector(pageControlClick:) forControlEvents:UIControlEventTouchUpInside];
    
    for (___VARIABLE_Prefix:identifier___GuidePageItem *item in _gidePageItems) {
        [item removeFromSuperview];
    }
    _gidePageItems = [[NSMutableArray alloc] init];
    
    for (NSInteger i = 0; i < _models.count; i++) {
        ___VARIABLE_Prefix:identifier___GuidePageItem *item = [[___VARIABLE_Prefix:identifier___GuidePageItem alloc] initWithType:(i + 1) model:_models[i]];
        [_gidePageItems addObject:item];
        [_scrollView addSubview:item];
    }
}


#pragma mark - UIScrollViewDelegate.

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat pageWidth = CGRectGetWidth(self.bounds);
    CGFloat pageFraction = self.scrollView.contentOffset.x / pageWidth;
    self.pageControl.currentPage = roundf(pageFraction);
    self.pageControl.hidden = _models[self.pageControl.currentPage].isShowButton;
}


#pragma mark - ___VARIABLE_Prefix:identifier___GuidePageItemDelegate.

- (void)guidePageButtonClicked:(___VARIABLE_Prefix:identifier___GuidePageItem *)item type:(___VARIABLE_Prefix:identifier___GuidePageItemType)type {
    if ([_delegate respondsToSelector:@selector(enterButtonClicked:type:)]) {
        [_delegate enterButtonClicked:self type:type];
    }
}


#pragma mark - Setter & Getter.

- (void)setModels:(NSArray<___VARIABLE_Prefix:identifier___GuidePageModel *> *)models {
    if (_models == models) {
        return;
    }
    
    _models = models;
    [self reloadSubViews];
}


#pragma mark - Action.

- (void)pageControlClick:(id)sender {
    UIPageControl *pageControl = sender;
    NSInteger page = pageControl.currentPage;
    CGRect frame = _scrollView.frame;
    frame.origin.x = frame.size.width * page;
    frame.origin.y = 0;
    [_scrollView scrollRectToVisible:frame animated:YES];
}

@end
