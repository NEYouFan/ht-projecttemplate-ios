//
//  {{args.Prefix}}LoadingEmptyView.m
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 08/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "{{args.Prefix}}LoadingEmptyView.h"
#import "{{args.Prefix}}CommonStyleViews.h"
#import "UIView+Frame.h"

@interface {{args.Prefix}}LoadingEmptyView ()
/// icon
@property (nonatomic, strong) UIImageView *iconImageView;
/// 提示 "暂时没有数据" 的 label
@property (nonatomic, strong) UILabel *indicateLabel;
/// 点击重新加载的 button
@property (nonatomic, strong) UIButton *reloadButton;

@end

@implementation {{args.Prefix}}LoadingEmptyView

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
    _iconImageView = [[UIImageView alloc] init];
    _iconImageView.image = [UIImage imageNamed:@"loading_empty"];
    [self addSubview:_iconImageView];
    
    _indicateLabel = [[UILabel alloc] init];
    _indicateLabel.textColor = [UIColor colorWithRGBValue:kLoadingEmptyTextColor];
    _indicateLabel.font = [UIFont systemFontOfSize:kDefaultTitleFontSize];
    _indicateLabel.textAlignment = NSTextAlignmentCenter;
    _indicateLabel.text = @"这里什么也没有";
    [self addSubview:_indicateLabel];
    
    _reloadButton = [[UIButton alloc] init];
    [_reloadButton setTitle:@"回到XXX" forState:UIControlStateNormal];
    [_reloadButton setTitleColor:[UIColor colorWithRGBValue:kLoadingEmptyTextColor] forState:UIControlStateNormal];
    _reloadButton.layer.cornerRadius = kCornerRadiusSize;
    _reloadButton.layer.masksToBounds = YES;
    _reloadButton.titleLabel.font = [UIFont systemFontOfSize:kRetryButtonTitleFontSize];
    _reloadButton.backgroundColor = [UIColor whiteColor];
    [_reloadButton addTarget:self action:@selector(reloadButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_reloadButton];
}


#pragma mark - Layout.

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _reloadButton.size = CGSizeMake(kLoadingReloadButtonWidth, kLoadingReloadButtonHeight);
    _reloadButton.middleX = self.width / 2;
    _reloadButton.bottom = self.height / 2;;
    
    [_indicateLabel sizeToFit];
    _indicateLabel.bottom = _reloadButton.y - kLoadingIndicationReloadGap;
    _indicateLabel.middleX = self.width / 2;
    
    _iconImageView.size = CGSizeMake(kLoadingIconWidth, kLoadingIconHeight);
    _iconImageView.middleX = self.width / 2;
    _iconImageView.bottom = _indicateLabel.y - kLoadingIconIndicationGap;
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
