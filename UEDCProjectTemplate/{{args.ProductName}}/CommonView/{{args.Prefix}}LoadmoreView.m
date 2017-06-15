//
//  {{args.Prefix}}LoadmoreView.m
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 09/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "{{args.Prefix}}LoadmoreView.h"
#import "UIView+Frame.h"
#import "{{args.Prefix}}ActivityIndicator.h"

@interface {{args.Prefix}}LoadmoreView ()

@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UILabel *indicateLabel;
@property (nonatomic, strong) {{args.Prefix}}ActivityIndicator *loadingIndicator;

@end


@implementation {{args.Prefix}}LoadmoreView

#pragma mark - Load views.

- (void)loadSubViews {
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
    _indicateLabel.text = @"正在加载数据，请稍等";
    [_containerView addSubview:_indicateLabel];

}


#pragma mark - Layout.

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_indicateLabel sizeToFit];
    _containerView.width = _indicateLabel.width + _loadingIndicator.width + kLeftMargin;
    _containerView.height = self.height;
    _containerView.middleY = self.height / 2;
    _containerView.middleX = self.width / 2;
    
    _loadingIndicator.x = 0;
    _loadingIndicator.middleY = _containerView.height / 2;
    
    _indicateLabel.tail = _containerView.width;
    _indicateLabel.middleY = _containerView.height / 2;
}


#pragma mark - HTRefreshViewDelegate

- (CGFloat)refreshingInset {
    return 0;
}

- (CGFloat)refreshableInset {
    return kLoadmoreViewHeight;
}

- (CGFloat)promptingInset {
    if (self.hiddenRefresh) {
        return 0;
    }
    return kLoadmoreViewHeight; // 一般与 refreshableInset 相等
}

- (void)refreshStateChanged:(HTRefreshState)state {
    switch (state) {
        case HTRefreshStateCanEngageRefresh: {
            // 到达刷新门限，用户可自定义 view 变化
        }
            break;
        case HTRefreshStateDidEngageRefresh: {
            // 正在刷新，用户可自定义 view 变化
            [_loadingIndicator startAnimating];

        }
            break;
        case HTRefreshStateDidDisengageRefresh: {
            // 返回刷新门限内，用户可自定义 view 变化
        }
            break;
        case HTRefreshStateWillEndRefresh: {
            // 刷新即将完成，用户可定义一些清理动画的工作
        }
            break;
        case HTRefreshStateDidEndRefresh: {
            // 刷新完成，用户可自定义 view 变化
            [_loadingIndicator stopAnimating];

        }
            break;
    }
}

@end
