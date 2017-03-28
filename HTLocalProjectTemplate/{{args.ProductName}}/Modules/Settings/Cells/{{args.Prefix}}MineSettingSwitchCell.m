//
//  {{args.Prefix}}MineSettingSwitchCell.m
//  TestNei
//
//  Created by {{args.Author}} on 21/10/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "{{args.Prefix}}MineSettingSwitchCell.h"
#import "{{args.Prefix}}MineSettingCellDescribeData.h"
#import "UIView+Frame.h"
#import "UIView+{{args.Prefix}}Line.h"

@interface {{args.Prefix}}MineSettingSwitchCell ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UISwitch *switchButton;

@end

@implementation {{args.Prefix}}MineSettingSwitchCell

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
    [self.contentView {{args.CategoryPrefix}}_addHorizontalBottomLineWithLeftMargin:0 rightMargin:0];
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.textColor = [UIColor colorWithRGBValue:kDefaultTextColor];
    _titleLabel.font = [UIFont systemFontOfSize:kDefaultFontSize];
    [self.contentView addSubview:_titleLabel];

    _switchButton = [[UISwitch alloc] init];
    [_switchButton addTarget:self action:@selector(switchChanged:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_switchButton];
}


#pragma mark - Layout.

- (void)layoutSubviews {
    [super layoutSubviews];

    [_titleLabel sizeToFit];
    _titleLabel.x = kLeftMargin;
    _titleLabel.middleY = self.contentView.height / 2;

    _switchButton.tail = self.contentView.width - kRightMargin;
    _switchButton.middleY = _titleLabel.middleY;
}

- (CGSize)sizeThatFits:(CGSize)size {
    return CGSizeMake(size.width, 44);
}


#pragma mark - Setter.

- (void)setDescribeData:(MCTableBaseDescribeData *)describeData {
    if ([describeData isKindOfClass:[{{args.Prefix}}MineSettingCellDescribeData class]]) {
        {{args.Prefix}}MineSettingCellDescribeData *data = ({{args.Prefix}}MineSettingCellDescribeData *)describeData;
        _titleLabel.text = data.title;
        _switchButton.on = data.switchOn;
        _delegate = data.switchDelegate;
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
