//
//  {{args.Prefix}}RefreshView.m
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 09/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "{{args.Prefix}}RefreshView.h"
#import "UIView+Frame.h"
#import "{{args.Prefix}}LoadingView.h"
#import "{{args.Prefix}}ActivityIndicator.h"

@interface {{args.Prefix}}RefreshView ()

@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UILabel *indicateLabel;
@property (nonatomic, strong) {{args.Prefix}}ActivityIndicator *loadingIndicator;
@end

@implementation {{args.Prefix}}RefreshView

#pragma mark - Load Views.

- (void)loadSubViews {
    // 添加refreshview内部的元素和样式
    self.backgroundColor = [UIColor clearColor];
    _containerView = [[UIView alloc] init];
    [self addSubview:_containerView];
    
    _loadingIndicator = [[{{args.Prefix}}ActivityIndicator alloc] init];
    CGSize size = [_loadingIndicator sizeThatFits:CGSizeZero];
    _loadingIndicator.frame = CGRectMake(0, 0, size.width, size.height);
    [_containerView addSubview:_loadingIndicator];
    
    _indicateLabel = [[UILabel alloc] init];
    _indicateLabel.textColor = [UIColor colorWithRGBValue:kLightTextColor];
    _indicateLabel.font = [UIFont systemFontOfSize:kDefaultFontSize];
    _indicateLabel.textAlignment = NSTextAlignmentCenter;
    _indicateLabel.text = @"继续下拉";
    [_containerView addSubview:_indicateLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_indicateLabel sizeToFit];
    _containerView.width = _loadingIndicator.width + 10 + _indicateLabel.width;
    _containerView.height = self.height - 15;
    _containerView.middleX = self.width / 2;
    _containerView.middleY = (self.height + 15) / 2;
    
    _loadingIndicator.x = 0;
    _loadingIndicator.middleY = _containerView.height / 2;
    
    _indicateLabel.x = _loadingIndicator.tail + 10;
    _indicateLabel.middleY = _containerView.height / 2;
}


#pragma mark - HTRefreshViewDelegate

- (CGFloat)refreshingInset {
    return kRefreshViewHeight;
}

- (CGFloat)refreshableInset {
    return kRefreshViewHeight;
}

- (void)refreshStateChanged:(HTRefreshState)state {
    switch (state) {
        case HTRefreshStateCanEngageRefresh: {
            // 到达刷新门限，用户可自定义 view 变化
            _indicateLabel.text = @"松开刷新";
        }
            break;
        case HTRefreshStateDidEngageRefresh:{
            // 正在刷新，用户可自定义 view 变化
            _indicateLabel.text = @"正在刷新";
            [_loadingIndicator startAnimating];

        }
            break;
        case HTRefreshStateDidDisengageRefresh: {
            // 返回刷新门限内，用户可自定义 view 变化
            _indicateLabel.text = @"继续下拉";
        }
            break;
        case HTRefreshStateWillEndRefresh: {
            // 刷新即将完成，用户可定义一些清理动画的工作
            _indicateLabel.text = @"刷新完成";
        }
            break;
        case HTRefreshStateDidEndRefresh: {
            // 刷新完成，用户可自定义 view 变化
            _indicateLabel.text = @"下拉刷新";
            [_loadingIndicator stopAnimating];

        }
            break;
    }
}

- (void)refreshPercentChanged:(CGFloat)percent offset:(CGFloat)offset direction:(HTRefreshDirection)direction {
    // 下拉的距离与 refreshableInset 的比值，该方法中可以根据 percent 对视图做动画, 下面的是一个示例
    if (direction != HTRefreshDirectionTop && (direction != HTRefreshDirectionLeft)) {
        return;
    }
    if (offset > self.scrollView.contentInset.top)
        return;
    
    CGFloat contentInset = self.scrollView.contentInset.top;
    CGFloat startPercentOffset = 10;
    if (offset > - contentInset - startPercentOffset)
        percent = 0;
    else{
        percent = fabs((offset - (-contentInset - startPercentOffset))) / (kRefreshViewHeight - startPercentOffset);
    }
    
    if (percent > 1)
        percent = 1;
        
    _loadingIndicator.transform = CGAffineTransformMakeRotation(2 * M_PI * percent);
}

@end
