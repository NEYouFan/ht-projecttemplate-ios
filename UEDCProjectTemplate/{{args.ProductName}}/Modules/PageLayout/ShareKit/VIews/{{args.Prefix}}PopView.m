//
//  {{args.Prefix}}PopView.m
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 2017/5/16.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}PopView.h"
#import "UIView+Frame.h"
#import "UIView+{{args.Prefix}}Line.h"

const CGFloat kCancelButtonHeight = 49;


@interface {{args.Prefix}}PopView ()

@property (nonatomic, strong) UIView *shadowView;
@property (nonatomic, strong) UIButton *cancelButton;

@end

@implementation {{args.Prefix}}PopView

- (instancetype)initWithContentView:(UIView *)contentView{
    if (self = [super init]) {
        _contentView = contentView;
        [self configView];
        return self;
    }
    return nil;
}

- (void)configView{
    self.frame = CGRectMake(0, SCREEN_HEIGHT - kNavigationHeight, SCREEN_WIDTH, kCancelButtonHeight + _contentView.height);
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    [window addSubview:self];
    [self loadSubviews];
}

- (void)loadSubviews{
    [self addSubview:_contentView];
    
    _cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _cancelButton.frame = CGRectMake(0, self.height - kCancelButtonHeight, self.width, kCancelButtonHeight);
    _cancelButton.backgroundColor = [UIColor whiteColor];
    [_cancelButton setTitleColor:[UIColor colorWithRGBValue:0x333333] forState:UIControlStateNormal];
    [_cancelButton setTitleColor:[UIColor colorWithRGBValue:0x777777] forState:UIControlStateHighlighted];
    [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    _cancelButton.titleLabel.font = [UIFont systemFontOfSize:18];
    _cancelButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [_cancelButton {{args.CategoryPrefix}}_addHorizontalTopLineWithLeftMargin:0 rightMargin:0];
    [_cancelButton addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_cancelButton];
}


- (void)popup{
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    _shadowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, window.width, window.height)];
    _shadowView.backgroundColor = [UIColor blackColor];
    _shadowView.alpha = 0;
    [window addSubview:_shadowView];
    [window bringSubviewToFront:self];
    self.y = SCREEN_HEIGHT;
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.y = SCREEN_HEIGHT - self.height;
        _shadowView.alpha = 0.45;
    } completion:^(BOOL finished) {
    }];
}

- (void)dismiss{
    _shadowView.alpha = 0.45;
    self.y = SCREEN_HEIGHT - self.height;
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        _shadowView.alpha = 0.0;
        self.y = SCREEN_HEIGHT;
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [_shadowView removeFromSuperview];
        _shadowView =nil;
        [self removeFromSuperview];
    }];
}


@end
