//
//  {{args.Prefix}}MineOperationCell.m
//  TestNei
//
//  Created by {{args.Author}} on 19/10/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "{{args.Prefix}}MineOperationCell.h"
#import "UIView+{{args.Prefix}}Line.h"
#import "UIView+Frame.h"
#import "{{args.Prefix}}MineCellDescribeData.h"

static const int kMineTitleFontSize = 15;
static const int kTitleIconGap = 10;

@interface {{args.Prefix}}MineOperationCell ()

@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *rightArrowImageView;

@end

@implementation {{args.Prefix}}MineOperationCell

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
    _iconImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_iconImageView];

    _titleLabel = [[UILabel alloc] init];
    _titleLabel.textColor = [UIColor colorWithRGBValue:kLightTextColor];
    _titleLabel.font = [UIFont systemFontOfSize:kMineTitleFontSize];
    _titleLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_titleLabel];

    _rightArrowImageView = [[UIImageView alloc] init];
    _rightArrowImageView.image = [UIImage imageNamed:@"mine_right_arrow"];
    [self.contentView addSubview:_rightArrowImageView];
}


#pragma mark - Layout.

- (void)layoutSubviews {
    [super layoutSubviews];

    [_iconImageView sizeToFit];
    _iconImageView.x = kLeftMargin;
    _iconImageView.middleY = self.height / 2;

    [_titleLabel sizeToFit];
    _titleLabel.x = _iconImageView.tail + kTitleIconGap;
    _titleLabel.middleY = self.height / 2;

    [_rightArrowImageView sizeToFit];
    _rightArrowImageView.tail = self.width - kRightMargin;
    _rightArrowImageView.middleY = self.height / 2;
}

- (CGSize)sizeThatFits:(CGSize)size {
    return CGSizeMake(size.width, 44);
}


#pragma mark - Getter & Setter.

- (void)setDescribeData:(MCTableBaseDescribeData *)describeData {
    if ([describeData isKindOfClass:[{{args.Prefix}}MineCellDescribeData class]]) {
        {{args.Prefix}}MineCellDescribeData *data = ({{args.Prefix}}MineCellDescribeData *)describeData;
        _iconImageView.image = [UIImage imageNamed:data.iconName];
        _titleLabel.text = data.title;
    }
}

@end
