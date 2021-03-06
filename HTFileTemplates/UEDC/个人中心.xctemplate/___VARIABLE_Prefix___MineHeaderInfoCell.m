//
//  ___VARIABLE_Prefix:identifier___MineHeaderInfoCell.m
//  ___VARIABLE_Prefix:identifier___
//
//  Created by Baitianyu on 17/05/2017.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "___VARIABLE_Prefix:identifier___MineHeaderInfoCell.h"
#import "___VARIABLE_Prefix:identifier___MineCellDescribeData.h"
#import "UIView+Frame.h"
#import "UIImage+ImageWithColor.h"
#import "___VARIABLE_Prefix:identifier___UserDataManager.h"
#import "UIView+___VARIABLE_Prefix:identifier___Line.h"

static const int kHeaderIconWidth = 90;
static const int kTitleIconGap = 20;
static const int kTitleDescGap = 5;

@interface ___VARIABLE_Prefix:identifier___MineHeaderInfoCell ()

@property (nonatomic, strong) UIView *bgView; // 用于保持个人页面最顶部的背景色
@property (nonatomic, strong) UIImageView *headerImageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *descLabel;

@end

@implementation ___VARIABLE_Prefix:identifier___MineHeaderInfoCell

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
    [self.contentView ___VARIABLE_CategoryPrefix:identifier____addHorizontalBottomLineWithLeftMargin:0 rightMargin:0];
    _bgView = [[UIView alloc] init];
    _bgView.backgroundColor = [UIColor colorWithRGBValue:kDefaultColor];
    [self.contentView addSubview:_bgView];
    
    _headerImageView = [[UIImageView alloc] init];
    _headerImageView.layer.cornerRadius = kHeaderIconWidth / 2;
    _headerImageView.backgroundColor = [UIColor colorWithRGBValue:kDefaultBackgroundColor];
    [self.contentView addSubview:_headerImageView];

    _nameLabel = [[UILabel alloc] init];
    _nameLabel.textColor = [UIColor colorWithRGBValue:kSecondClassTitleTextColor];
    _nameLabel.font = [UIFont systemFontOfSize:kFirstClassContentFontSize];
    [self.contentView addSubview:_nameLabel];
    
    _descLabel = [[UILabel alloc] init];
    _descLabel.textColor = [UIColor colorWithRGBValue:0x999999];
    _descLabel.font = [UIFont systemFontOfSize:kThirdClassContentFontSize];
    [self.contentView addSubview:_descLabel];
}


#pragma mark - Layout.

- (void)layoutSubviews {
    [super layoutSubviews];

    _bgView.width = self.contentView.width;
    _bgView.height = SCREEN_HEIGHT;
    _bgView.x = 0;
    _bgView.bottom = self.contentView.height;
    
    [_nameLabel sizeToFit];
    [_descLabel sizeToFit];
    
    _headerImageView.width = kHeaderIconWidth;
    _headerImageView.height = kHeaderIconWidth;
    _headerImageView.middleX = self.width / 2;
    _headerImageView.y = (self.height - 2 * kTitleIconGap - _headerImageView.height - _nameLabel.height - _descLabel.height) / 2;
    
    _nameLabel.middleX = self.contentView.width / 2;
    _nameLabel.y = _headerImageView.bottom + kTitleIconGap;
    
    _descLabel.middleX = self.contentView.width / 2;
    _descLabel.y = _nameLabel.bottom + kTitleDescGap;
}

- (CGSize)sizeThatFits:(CGSize)size {
    return CGSizeMake(size.width, 248);
}


#pragma mark - Setter.

- (void)setDescribeData:(MCTableBaseDescribeData *)describeData {
    if ([describeData isKindOfClass:[___VARIABLE_Prefix:identifier___MineCellDescribeData class]]) {
        ___VARIABLE_Prefix:identifier___MineCellDescribeData *data = (___VARIABLE_Prefix:identifier___MineCellDescribeData *)describeData;
        _headerImageView.image = [UIImage imageNamed:data.headerIconName];
        _nameLabel.text = data.userName;
        _descLabel.text = data.userDesc;
        [self setNeedsLayout];
    }
}

@end
