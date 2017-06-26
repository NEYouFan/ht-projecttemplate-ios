//
//  ___VARIABLE_Prefix:identifier___MineSettingSwitchCell.m
//  ___VARIABLE_Prefix:identifier___
//
//  Created by Baitianyu on 25/05/2017.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "___VARIABLE_Prefix:identifier___SettingSwitchCell.h"
#import "___VARIABLE_Prefix:identifier___SettingCellDescribeData.h"
#import "UIView+Frame.h"
#import "UIView+___VARIABLE_Prefix:identifier___Line.h"

static const int kTitleIconGap = 15;

@interface ___VARIABLE_Prefix:identifier___SettingSwitchCell ()

@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UISwitch *switchButton;

@end

@implementation ___VARIABLE_Prefix:identifier___SettingSwitchCell

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
    _iconImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_iconImageView];
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.textColor = [UIColor colorWithRGBValue:kFisrtClassTitleTextColor];
    _titleLabel.font = [UIFont systemFontOfSize:kFirstClassContentFontSize];
    [self.contentView addSubview:_titleLabel];

    _switchButton = [[UISwitch alloc] init];
    _switchButton.onTintColor = [UIColor colorWithRGBValue:kSwitchOnTintColor];
    [_switchButton addTarget:self action:@selector(switchChanged:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_switchButton];
}


#pragma mark - Layout.

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _iconImageView.size = CGSizeMake(22, 22);
    _iconImageView.middleY = self.contentView.height / 2;
    _iconImageView.x = kLeftMargin;
    
    [_titleLabel sizeToFit];
    _titleLabel.x = _iconImageView.tail + kTitleIconGap;
    _titleLabel.middleY = self.contentView.height / 2;

    _switchButton.tail = self.contentView.width - kRightMargin;
    _switchButton.middleY = _titleLabel.middleY;
}

- (CGSize)sizeThatFits:(CGSize)size {
    return CGSizeMake(size.width, 60);
}


#pragma mark - Setter.

- (void)setDescribeData:(MCTableBaseDescribeData *)describeData {
    if ([describeData isKindOfClass:[___VARIABLE_Prefix:identifier___SettingCellDescribeData class]]) {
        ___VARIABLE_Prefix:identifier___SettingCellDescribeData *data = (___VARIABLE_Prefix:identifier___SettingCellDescribeData *)describeData;
        _titleLabel.text = data.title;
        _switchButton.on = data.switchOn;
        _delegate = data.switchDelegate;
        _iconImageView.image = [UIImage imageNamed:data.iconName];
        [self setNeedsLayout];
    }
}


#pragma mark - Actions.

- (void)switchChanged:(id)sender {
    if ([_delegate respondsToSelector:@selector(switchChanged:)]) {
        [_delegate switchChanged:_switchButton.on];
    }
}

@end
