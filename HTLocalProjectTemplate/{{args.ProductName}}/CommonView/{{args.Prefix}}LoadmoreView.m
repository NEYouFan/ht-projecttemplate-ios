//
//  {{args.Prefix}}LoadmoreView.m
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 09/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "{{args.Prefix}}LoadmoreView.h"
#import "UIView+Frame.h"

@interface {{args.Prefix}}LoadmoreView ()

@property (nonatomic, strong) UILabel *indicateLabel;

@end


@implementation {{args.Prefix}}LoadmoreView

#pragma mark - Load views.

- (void)loadSubViews {
    self.backgroundColor = [UIColor colorWithRGBValue:kRefreshBackgroundColor];
    _indicateLabel = [[UILabel alloc] init];
    _indicateLabel.textColor = [UIColor colorWithRGBValue:kDefaultTextColor];
    _indicateLabel.font = [UIFont systemFontOfSize:kDefaultFontSize];
    _indicateLabel.textAlignment = NSTextAlignmentCenter;
    _indicateLabel.text = @"正在加载数据，请稍等";
    [self addSubview:_indicateLabel];
}


#pragma mark - Layout.

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_indicateLabel sizeToFit];
    _indicateLabel.middleX = self.width / 2;
    _indicateLabel.middleY = self.height / 2;
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
        }
            break;
    }
}

@end
