//
//  {{args.Prefix}}MineSettingCommonCell.m
//  StandardizationPractice
//
//  Created by {{args.Author}} on 21/10/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "{{args.Prefix}}MineSettingCommonCell.h"
#import "{{args.Prefix}}MineSettingCellDescribeData.h"
#import "UIView+Frame.h"
#import "UIView+{{args.Prefix}}Line.h"

static const int kTitleIconGap = 10;

@interface {{args.Prefix}}MineSettingCommonCell ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *rightTitleLabel;
@property (nonatomic, strong) UIImageView *arrowImageView;

@end

@implementation {{args.Prefix}}MineSettingCommonCell

#pragma mark - Life cycle.

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self loadSubviews];
    }
    return self;
}


#pragma mark - Load views.

- (void)loadSubviews {
    [self.contentView {{args.CategoryPrefix}}_addHorizontalBottomLineWithLeftMargin:0 rightMargin:0];
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.textColor = [UIColor colorWithRGBValue:kDefaultTextColor];
    _titleLabel.font = [UIFont systemFontOfSize:kDefaultTitleFontSize];
    [self.contentView addSubview:_titleLabel];

    _rightTitleLabel = [[UILabel alloc] init];
    _rightTitleLabel.textColor = [UIColor colorWithRGBValue:kDefaultTextColor];
    _rightTitleLabel.font = [UIFont systemFontOfSize:kDefaultTitleFontSize];
    [self.contentView addSubview:_rightTitleLabel];

    _arrowImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mine_right_arrow"]];
    [self.contentView addSubview:_arrowImageView];
}


#pragma mark - Layout.

- (void)layoutSubviews {
    [super layoutSubviews];

    [_titleLabel sizeToFit];
    _titleLabel.x = kLeftMargin;
    _titleLabel.middleY = self.contentView.height / 2;

    [_arrowImageView sizeToFit];
    _arrowImageView.tail = self.contentView.width - kRightMargin;
    _arrowImageView.middleY = _titleLabel.middleY;

    [_rightTitleLabel sizeToFit];
    _rightTitleLabel.tail = _arrowImageView.x - kTitleIconGap;
    _rightTitleLabel.middleY = _titleLabel.middleY;
}

- (CGSize)sizeThatFits:(CGSize)size {
    return CGSizeMake(size.width, 44);
}


#pragma mark - Setter.

- (void)setDescribeData:(MCTableBaseDescribeData *)describeData {
    if ([describeData isKindOfClass:[{{args.Prefix}}MineSettingCellDescribeData class]]) {
        {{args.Prefix}}MineSettingCellDescribeData *data = ({{args.Prefix}}MineSettingCellDescribeData *)describeData;
        _titleLabel.text = data.title;
        _rightTitleLabel.hidden = !(data.rightTitle.length > 0);
        _rightTitleLabel.text = data.rightTitle;
        self.selectionStyle = data.selectionStyle;
        [self setNeedsLayout];
    }
}

@end
