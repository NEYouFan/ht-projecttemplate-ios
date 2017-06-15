//
//  {{args.Prefix}}ToolBarItem.m
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 2017/5/10.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}ToolBarItem.h"
#import "UIView+{{args.Prefix}}Line.h"
#import "UIImage+ImageWithColor.h"
#import "HTBadgeTextView.h"
#import "UIView+Frame.h"
#import "UIImage+Alpha.h"

@interface {{args.Prefix}}ToolBarItem ()

@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *selectedIcon;

@property (nonatomic, strong) UIImage *iconImage;
@property (nonatomic, strong) UIImage *iconSelectedImage;
@property (nonatomic, strong) UIImageView *iconImageView;

@property (nonatomic, assign) BOOL defaultSelectdStyle;
@end

@implementation {{args.Prefix}}ToolBarItem

#pragma mark - Life cycle.

- (instancetype)initWithIcon:(NSString *)icon selectedIcon:(NSString *)selectedIcon {
    if (self = [super init]){
        _icon = icon;
        _selectedIcon = selectedIcon;
        if ( !selectedIcon ) {
            _defaultSelectdStyle = YES;
        }
        
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
    UIView *topline = [self {{args.CategoryPrefix}}_addViewWithLeftMargin:0 rightMargin:0 topMargin:-1 bottomMargin:kToolBarHeight];
    topline.backgroundColor = [UIColor blackColor];
    
    _iconImageView = [[UIImageView alloc] init];
    _iconImage = [UIImage imageNamed:_icon];
    if (_defaultSelectdStyle) {
        _iconSelectedImage = [[UIImage imageNamed:_icon] imageByApplyingAlpha:0.6];
    }else{
        _iconSelectedImage = [UIImage imageNamed:_selectedIcon];
    }
    [self addSubview:_iconImageView];
    
    [self selectedChanged];
}


#pragma mark - Layout.

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_iconImageView sizeToFit];
    _iconImageView.size = CGSizeMake(kTabIconWitdh, kTabIconHeight);
    _iconImageView.middleX = self.width / 2;
    _iconImageView.middleY = kToolBarHeight/2;
    
}


#pragma mark - KVO.

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:@"selected"]){
        [self selectedChanged];
    }
}

- (void)selectedChanged {
    if ([self isSelected]) {
        _iconImageView.image = _iconSelectedImage;
    } else {
        _iconImageView.image = _iconImage;
    }
}

@end
