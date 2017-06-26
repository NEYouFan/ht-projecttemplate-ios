//
//  ___VARIABLE_Prefix:identifier___SettingCommonCell.m
//  StandardizationPractice
//
//  Created by Baitianyu on 25/05/2017.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "___VARIABLE_Prefix:identifier___SettingCommonCell.h"
#import "___VARIABLE_Prefix:identifier___SettingCellDescribeData.h"
#import "UIView+Frame.h"
#import "UIView+___VARIABLE_Prefix:identifier___Line.h"

static const int kTitleIconGap = 15;
static const int kRightTitleIconGap = 12.5;

@interface ___VARIABLE_Prefix:identifier___SettingCommonCell ()

@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subTitleLabel;
@property (nonatomic, strong) UILabel *rightTitleLabel;
@property (nonatomic, strong) UIImageView *arrowImageView;

@end

@implementation ___VARIABLE_Prefix:identifier___SettingCommonCell

#pragma mark - Life cycle.

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self loadSubviews];
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
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
    
    _subTitleLabel = [[UILabel alloc] init];
    _subTitleLabel.textColor = [UIColor colorWithRGBValue:kLightTextColor];
    _subTitleLabel.font = [UIFont systemFontOfSize:kSecondClassContentFontSize];
    [self.contentView addSubview:_subTitleLabel];

    _rightTitleLabel = [[UILabel alloc] init];
    _rightTitleLabel.textColor = [UIColor colorWithRGBValue:kLightTextColor];
    _rightTitleLabel.font = [UIFont systemFontOfSize:kSecondClassContentFontSize];
    [self.contentView addSubview:_rightTitleLabel];

    _arrowImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mine_right_arrow"]];
    [self.contentView addSubview:_arrowImageView];
}


#pragma mark - Layout.

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _iconImageView.size = CGSizeMake(22, 22);
    _iconImageView.middleY = self.contentView.height / 2;
    _iconImageView.x = kLeftMargin;

    [_titleLabel sizeToFit];
    _titleLabel.x = _iconImageView.tail + kTitleIconGap;
    if (_subTitleLabel.hidden) {
        _titleLabel.middleY = self.contentView.height / 2;
    } else {
        _titleLabel.y = 12;
    }
    
    [_subTitleLabel sizeToFit];
    _subTitleLabel.x = _titleLabel.x;
    _subTitleLabel.y = _titleLabel.bottom;

    [_arrowImageView sizeToFit];
    _arrowImageView.tail = self.contentView.width - kRightMargin;
    _arrowImageView.middleY = _iconImageView.middleY;

    [_rightTitleLabel sizeToFit];
    _rightTitleLabel.tail = _arrowImageView.x - kRightTitleIconGap;
    _rightTitleLabel.middleY = _titleLabel.middleY;
}

- (CGSize)sizeThatFits:(CGSize)size {
    return CGSizeMake(size.width, 60);
}


#pragma mark - Setter.

- (void)setDescribeData:(MCTableBaseDescribeData *)describeData {
    if ([describeData isKindOfClass:[___VARIABLE_Prefix:identifier___SettingCellDescribeData class]]) {
        ___VARIABLE_Prefix:identifier___SettingCellDescribeData *data = (___VARIABLE_Prefix:identifier___SettingCellDescribeData *)describeData;
        _iconImageView.image = [UIImage imageNamed:data.iconName];
        _titleLabel.text = data.title;
        _rightTitleLabel.hidden = !(data.rightTitle.length > 0);
        _rightTitleLabel.text = data.rightTitle;
        _subTitleLabel.hidden = !(data.subTitle.length > 0);
        _subTitleLabel.text = data.subTitle;
        [self setNeedsLayout];
    }
}

@end
