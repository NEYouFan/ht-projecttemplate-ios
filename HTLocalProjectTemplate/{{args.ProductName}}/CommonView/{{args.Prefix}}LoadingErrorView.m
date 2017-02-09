//
//  {{args.Prefix}}LoadingErrorView.m
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 08/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "{{args.Prefix}}LoadingErrorView.h"
#import "{{args.Prefix}}CommonStyleViews.h"
#import "UIView+Frame.h"

@interface {{args.Prefix}}LoadingErrorView ()

/// 提示 "数据加载错误" 的 label
@property (nonatomic, strong) UILabel *indicateLabel;
/// 点击重新加载的 button
@property (nonatomic, strong) UIButton *reloadButton;

@end

@implementation {{args.Prefix}}LoadingErrorView

#pragma mark - Life cycle.

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithRGBValue:kLoadingBackgroundColor];
        [self loadSubviews];
    }
    
    return self;
}


#pragma mark - Load views.

- (void)loadSubviews {
    _indicateLabel = [[UILabel alloc] init];
    _indicateLabel.textColor = [UIColor colorWithRGBValue:kDefaultTextColor];
    _indicateLabel.font = [UIFont systemFontOfSize:kDefaultFontSize];
    _indicateLabel.textAlignment = NSTextAlignmentCenter;
    _indicateLabel.text = @"获取数据失败";
    [self addSubview:_indicateLabel];
    
    _reloadButton = [{{args.Prefix}}CommonStyleViews loadingReloadButton];
    [_reloadButton addTarget:self action:@selector(reloadButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_reloadButton];
}


#pragma mark - Layout.

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_indicateLabel sizeToFit];
    _indicateLabel.bottom = self.height / 2;
    _indicateLabel.middleX = self.width / 2;
    
    _reloadButton.size = CGSizeMake(kLoadingReloadButtonWidth, kLoadingReloadButtonHeight);
    _reloadButton.middleX = self.width / 2;
    _reloadButton.y = _indicateLabel.bottom + kLoadingIndicationReloadGap;
}


#pragma mark - Actions.

- (void)reloadButtonClicked:(id)sender {
    if ([_delegate respondsToSelector:@selector(loadingErrorReload:)]) {
        [_delegate loadingErrorReload:self];
    }
}


#pragma mark - Getter & Setter.

- (void)setIndication:(NSString *)indication {
    if (_indication == indication) {
        return;
    }
    
    _indication = indication;
    _indicateLabel.text = _indication;
    [self setNeedsLayout];
}

@end
