//
//  {{args.Prefix}}LoadingEmptyView.m
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 08/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "{{args.Prefix}}LoadingEmptyView.h"
#import "{{args.Prefix}}CommonStyleViews.h"
#import "{{args.Prefix}}LoadingSizes.h"
#import "{{args.Prefix}}LoadingColors.h"
#import "UIView+Frame.h"

@interface {{args.Prefix}}LoadingEmptyView ()

/// 提示 "暂时没有数据" 的 label
@property (nonatomic, strong) UILabel *indicateLabel;
/// 点击重新加载的 button
@property (nonatomic, strong) UIButton *reloadButton;

@end

@implementation {{args.Prefix}}LoadingEmptyView

#pragma mark - Life cycle.

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [{{args.Prefix}}LoadingColors loadingBackgroundColor];
        [self loadSubviews];
    }
    
    return self;
}


#pragma mark - Load views.

- (void)loadSubviews {
    _indicateLabel = [[UILabel alloc] init];
    _indicateLabel.textColor = [{{args.Prefix}}ThemeColors defaultTextColor];
    _indicateLabel.font = [{{args.Prefix}}ThemeSizes themeFont];
    _indicateLabel.textAlignment = NSTextAlignmentCenter;
    _indicateLabel.text = @"暂时没有数据";
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
    
    _reloadButton.size = [{{args.Prefix}}LoadingSizes loadingReloadButtonSize];
    _reloadButton.middleX = self.width / 2;
    _reloadButton.y = _indicateLabel.bottom + [{{args.Prefix}}LoadingSizes loadingIndicationReloadGap];
}


#pragma mark - Actions.

- (void)reloadButtonClicked:(id)sender {
    if ([_delegate respondsToSelector:@selector(loadingEmptyReload:)]) {
        [_delegate loadingEmptyReload:self];
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
