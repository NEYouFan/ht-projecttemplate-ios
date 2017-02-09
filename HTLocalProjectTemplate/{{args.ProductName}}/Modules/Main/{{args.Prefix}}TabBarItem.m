//
//  {{args.Prefix}}TabBarItem.m
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 12/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "{{args.Prefix}}TabBarItem.h"
#import "UIView+{{args.Prefix}}Line.h"
#import "UIImage+ImageWithColor.h"
#import "HTBadgeTextView.h"
#import "UIView+Frame.h"

@interface {{args.Prefix}}TabBarItem ()

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *selectedIcon;

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImage *iconImage;
@property (nonatomic, strong) UIImage *iconSelectedImage;
@property (nonatomic, strong) UIImageView *iconImageView;

@property (nonatomic, strong) HTBadgeTextView *badgeView;
@property (nonatomic, strong) UIView *dotBadgeView;

@end

@implementation {{args.Prefix}}TabBarItem

#pragma mark - Life cycle.

- (instancetype)initWithTitle:(NSString *)title icon:(NSString *)icon selectedIcon:(NSString *)selectedIcon {
    if (self = [super init]){
        _title = title;
        _icon = icon;
        _selectedIcon = selectedIcon;
        
        [self loadSubviews];
        [self addObserver:self forKeyPath:@"selected" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    }
    
    return self;
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"selected"];
}


#pragma mark - Load views.

- (void)loadSubviews {
    UIView *topline = [self {{args.CategoryPrefix}}_addViewWithLeftMargin:0 rightMargin:0 topMargin:-1 bottomMargin:kTabHeight];
    topline.backgroundColor = [UIColor blackColor];
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.text = _title;
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.font = [UIFont systemFontOfSize:kTabBarTitleFontSize];
    [self addSubview:_titleLabel];
    
    _iconImageView = [[UIImageView alloc] init];
    _iconImage = [UIImage imageNamed:_icon];
    _iconSelectedImage = [UIImage imageNamed:_selectedIcon];
    [self addSubview:_iconImageView];
    
    [self selectedChanged];
}


#pragma mark - Layout.

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_iconImageView sizeToFit];
    _iconImageView.middleX = self.width / 2;
    _iconImageView.y = kTabIconTopMargin;
    
    [_titleLabel sizeToFit];
    _titleLabel.width = self.width - 2 * kTabTitleLabelSideEdge;
    _titleLabel.x = kTabTitleLabelSideEdge;
    _titleLabel.y = _iconImageView.bottom + kTabTitleIconGap;
    
    _dotBadgeView.size = CGSizeMake(kDotBadgeWidth, kDotBadgeHeight);
    _dotBadgeView.y = kDotBadgeTopMargin;
    _dotBadgeView.tail = self.width - kDotBadgeRightMargin;
    
    _badgeView.size = CGSizeMake(kBadgeWidth, kBadgeHeight);
    _badgeView.y = kBadgeTopMargin;
    _badgeView.tail = self.width - kBadgeRightMargin;
}


#pragma mark - KVO.

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:@"selected"]){
        [self selectedChanged];
    }
}

- (void)selectedChanged {
    if ([self isSelected]) {
        _titleLabel.textColor = [UIColor colorWithRGBValue:kDefaultTextColor];
        _iconImageView.image = _iconSelectedImage;
    } else {
        _titleLabel.textColor = [UIColor colorWithRGBValue:kDefaultTextColor];
        _iconImageView.image = _iconImage;
    }
}


#pragma mark - Show badge.

- (void)showBadge:({{args.Prefix}}BadgeType)badgeType text:(NSString*)text {
    if (badgeType == {{args.Prefix}}BadgeTypeText && _badgeView) {
        [_badgeView setText:text];
        return;
    } else if (badgeType == {{args.Prefix}}BadgeTypeDot && _dotBadgeView) {
        return;
    }
    
    [self hideBadge];
    
    if (badgeType == {{args.Prefix}}BadgeTypeText){
        _badgeView = [[HTBadgeTextView alloc] initWithInnerSize:CGSizeMake(kBadgeWidth, kBadgeHeight) outerSize:CGSizeMake(kBadgeWidth, kBadgeHeight) isRound:YES];
        [self addSubview:_badgeView];
        _badgeView.innerBackground.backgroundColor = [UIColor colorWithRGBValue:kTabBarBadgebackgroundColor];
        [_badgeView setTextFontSize:kBadgeTextFontSize];
        [_badgeView setText:text];
    } else if (badgeType == {{args.Prefix}}BadgeTypeDot){
        _dotBadgeView = [[UIView alloc] init];
        _dotBadgeView.backgroundColor = [UIColor redColor];
        _dotBadgeView.layer.cornerRadius = kDotBadgeWidth / 2;
        [self addSubview:_dotBadgeView];
    }
}

- (void)hideBadge {
    [_badgeView removeFromSuperview];
    _badgeView = nil;
    
    [_dotBadgeView removeFromSuperview];
    _dotBadgeView = nil;
}

@end
