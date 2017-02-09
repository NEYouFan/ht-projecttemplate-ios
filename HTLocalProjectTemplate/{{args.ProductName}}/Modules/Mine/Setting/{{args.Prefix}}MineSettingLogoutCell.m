//
//  {{args.Prefix}}MineSettingLogoutCell.m
//  StandardizationPractice
//
//  Created by {{args.Author}} on 21/10/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "{{args.Prefix}}MineSettingLogoutCell.h"
#import "UIView+{{args.Prefix}}Line.h"
#import "{{args.Prefix}}MineSettingCellDescribeData.h"
#import "UIView+Frame.h"

static const int kLogoutButtonWidth = 214;
static const int kLogoutButtonHeight = 35;

@interface {{args.Prefix}}MineSettingLogoutCell ()

@property (nonatomic, strong) UIButton *logoutButton;

@end

@implementation {{args.Prefix}}MineSettingLogoutCell

#pragma mark - Life cycle.

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self loadSubviews];
    }
    return self;
}


#pragma mark - Load views.

- (void)loadSubviews {
    _logoutButton = [[UIButton alloc] init];
    [_logoutButton addTarget:self action:@selector(logout:) forControlEvents:UIControlEventTouchUpInside];
    [_logoutButton setBackgroundImage:[UIImage imageNamed:@"setting_logout"] forState:UIControlStateNormal];
    [_logoutButton setBackgroundImage:[UIImage imageNamed:@"setting_logout_highlight"] forState:UIControlStateHighlighted];
    _logoutButton.layer.cornerRadius = kCornerRadiusSize;
    _logoutButton.layer.masksToBounds = YES;
    [self.contentView addSubview:_logoutButton];
}


#pragma mark - Layout.

- (void)layoutSubviews {
    [super layoutSubviews];

    _logoutButton.size = CGSizeMake(kLogoutButtonWidth, kLogoutButtonHeight);
    _logoutButton.middleX = self.contentView.width / 2;
    _logoutButton.bottom = self.contentView.height;
}

- (CGSize)sizeThatFits:(CGSize)size {
    return CGSizeMake(size.width, 93);
}


#pragma mark - Setter.

- (void)setDescribeData:(MCTableBaseDescribeData *)describeData {
    if ([describeData isKindOfClass:[{{args.Prefix}}MineSettingCellDescribeData class]]) {
        {{args.Prefix}}MineSettingCellDescribeData *data = ({{args.Prefix}}MineSettingCellDescribeData *)describeData;
        _delegate = data.logoutDelegate;
    }
}


#pragma mark - Actions.

- (void)logout:(id)sender {
    if ([_delegate respondsToSelector:@selector(logout:)]) {
        [_delegate logout:self];
    }
}

@end
