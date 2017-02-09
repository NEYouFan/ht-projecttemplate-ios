//
//  {{args.Prefix}}RefreshView.m
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 09/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "{{args.Prefix}}RefreshView.h"
#import "UIView+Frame.h"

@interface {{args.Prefix}}RefreshView ()

@property (nonatomic, strong) UILabel *indicateLabel;

@end

@implementation {{args.Prefix}}RefreshView

#pragma mark - Load Views.

- (void)loadSubViews {
    self.backgroundColor = [UIColor colorWithRGBValue:kRefreshBackgroundColor];
    _indicateLabel = [[UILabel alloc] init];
    _indicateLabel.textColor = [UIColor colorWithRGBValue:kDefaultTextColor];
    _indicateLabel.font = [UIFont systemFontOfSize:kDefaultFontSize];
    _indicateLabel.textAlignment = NSTextAlignmentCenter;
    _indicateLabel.text = @"继续下拉";
    [self addSubview:_indicateLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_indicateLabel sizeToFit];
    _indicateLabel.middleX = self.width / 2;
    _indicateLabel.middleY = self.height / 2;
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
        }
            break;
        case HTRefreshStateDidDisengageRefresh: {
            // 返回刷新门限内，用户可自定义 view 变化
            _indicateLabel.text = @"继续下拉";
        }
            break;
        case HTRefreshStateWillEndRefresh: {
            // 刷新即将完成，用户可定义一些清理动画的工作
        }
            break;
        case HTRefreshStateDidEndRefresh: {
            // 刷新完成，用户可自定义 view 变化
            _indicateLabel.text = @"继续下拉";
        }
            break;
    }
}

- (void)refreshPercentChanged:(CGFloat)percent offset:(CGFloat)offset direction:(HTRefreshDirection)direction {
    // 下拉的距离与 refreshableInset 的比值，该方法中可以根据 percent 对视图做动画
}

@end
