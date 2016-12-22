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
#import "{{args.Prefix}}NavigationTabBarSizes.h"
#import "{{args.Prefix}}NavigationTabBarColors.h"

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
    UIView *topline = [self {{args.CategoryPrefix}}_addViewWithLeftMargin:0 rightMargin:0 topMargin:-1 bottomMargin:[{{args.Prefix}}ThemeSizes tabHeight]];
    topline.backgroundColor = [UIColor blackColor];
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.text = _title;
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.font = [{{args.Prefix}}NavigationTabBarSizes tabBarTitleFont];
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
    _iconImageView.y = [{{args.Prefix}}NavigationTabBarSizes tabIconTopMargin];
    
    [_titleLabel sizeToFit];
    _titleLabel.width = self.width - 2 * [{{args.Prefix}}NavigationTabBarSizes tabTitleLabelSideEdge];
    _titleLabel.x = [{{args.Prefix}}NavigationTabBarSizes tabTitleLabelSideEdge];
    _titleLabel.y = _iconImageView.bottom + [{{args.Prefix}}NavigationTabBarSizes tabTitleIconGap];
    
    _dotBadgeView.size = [{{args.Prefix}}NavigationTabBarSizes dotBadgeSize];
    _dotBadgeView.y = [{{args.Prefix}}NavigationTabBarSizes dotBadgeTopMargin];
    _dotBadgeView.tail = self.width - [{{args.Prefix}}NavigationTabBarSizes dotBadgeRightMargin];
    
    _badgeView.size = [{{args.Prefix}}NavigationTabBarSizes badgeSize];
    _badgeView.y = [{{args.Prefix}}NavigationTabBarSizes badgeTopMargin];
    _badgeView.tail = self.width - [{{args.Prefix}}NavigationTabBarSizes badgeRightMargin];
}


#pragma mark - KVO.

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:@"selected"]){
        [self selectedChanged];
    }
}

- (void)selectedChanged {
    if ([self isSelected]) {
        _titleLabel.textColor = [{{args.Prefix}}ThemeColors defaultTextColor];
        _iconImageView.image = _iconSelectedImage;
    } else {
        _titleLabel.textColor = [{{args.Prefix}}ThemeColors defaultTextColor];
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
        _badgeView = [[HTBadgeTextView alloc] initWithInnerSize:[{{args.Prefix}}NavigationTabBarSizes badgeSize] outerSize:[{{args.Prefix}}NavigationTabBarSizes badgeSize] isRound:YES];
        [self addSubview:_badgeView];
        _badgeView.innerBackground.backgroundColor = [{{args.Prefix}}NavigationTabBarColors tabBarBadgeBackgroundColor];
        [_badgeView setTextFontSize:[{{args.Prefix}}NavigationTabBarSizes badgeTextFontSize]];
        [_badgeView setText:text];
    } else if (badgeType == {{args.Prefix}}BadgeTypeDot){
        _dotBadgeView = [[UIView alloc] init];
        _dotBadgeView.backgroundColor = [UIColor redColor];
        _dotBadgeView.layer.cornerRadius = [{{args.Prefix}}NavigationTabBarSizes dotBadgeSize].width / 2;
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
