//
//  {{args.Prefix}}ListLayoutCommonCell.m
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 26/05/2017.
//  Copyright © 2017 Netease. All rights reserved.
//

#import "{{args.Prefix}}ListLayoutCommonCell.h"
#import "{{args.Prefix}}ListLayoutCellDescribeData.h"
#import "UIView+Frame.h"

static const CGFloat kSubTitleFontSize = 13;
static const CGFloat kLeftIconTitleGap = 15;

@interface {{args.Prefix}}ListLayoutCommonCell ()

@property (nonatomic, strong) UIImageView *leftIconImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subTitleLabel;
@property (nonatomic, strong) UIImageView *rightIconImageView;

@end

@implementation {{args.Prefix}}ListLayoutCommonCell

#pragma mark - Life cycle.

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self loadSubviews];
    }
    return self;
}


#pragma mark - Load views.

- (void)loadSubviews {
    _leftIconImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_leftIconImageView];
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.textColor = [UIColor colorWithRGBValue:kFisrtClassTitleTextColor];
    _titleLabel.font = [UIFont systemFontOfSize:kFirstClassContentFontSize];
    _titleLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_titleLabel];
    
    _subTitleLabel = [[UILabel alloc] init];
    _subTitleLabel.textColor = [UIColor colorWithRGBValue:kLightTextColor];
    _subTitleLabel.font = [UIFont systemFontOfSize:kSubTitleFontSize];
    _subTitleLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_subTitleLabel];
    
    _rightIconImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_rightIconImageView];
}


#pragma mark - Layout.

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_leftIconImageView sizeToFit];
    _leftIconImageView.x = kLeftMargin;
    _leftIconImageView.middleY = self.contentView.height / 2;
    
    [_titleLabel sizeToFit];
    if (_leftIconImageView.hidden) {
        _titleLabel.x = kLeftMargin;
    } else {
        _titleLabel.x = _leftIconImageView.tail + kLeftIconTitleGap;
    }
    if (_subTitleLabel.hidden) {
        _titleLabel.middleY = self.contentView.height / 2;
    } else {
        _titleLabel.y = 11;
    }
    
    [_subTitleLabel sizeToFit];
    _subTitleLabel.x = _titleLabel.x;
    _subTitleLabel.y = _titleLabel.bottom;
    
    [_rightIconImageView sizeToFit];
    _rightIconImageView.middleY = self.contentView.height / 2;
    _rightIconImageView.tail = self.contentView.width - kRightMargin;
}

- (CGSize)sizeThatFits:(CGSize)size {
    return CGSizeMake(size.width, 60);
}


#pragma mark - Getter & Setter.

- (void)setDescribeData:(MCTableBaseDescribeData *)describeData {
    if ([describeData isKindOfClass:[{{args.Prefix}}ListLayoutCellDescribeData class]]) {
        {{args.Prefix}}ListLayoutCellDescribeData *data = ({{args.Prefix}}ListLayoutCellDescribeData *)describeData;
        _titleLabel.text = data.title;
        _subTitleLabel.text = data.subTitle;
        _leftIconImageView.image = [UIImage imageNamed:data.leftIconName];
        _rightIconImageView.image = [UIImage imageNamed:data.rightIconName];
        
        _leftIconImageView.hidden = (data.leftIconName.length <= 0);
        _rightIconImageView.hidden = (data.rightIconName.length <= 0);
        _subTitleLabel.hidden = (data.subTitle.length <= 0);
        
        [self setNeedsLayout];
    }
}

@end
