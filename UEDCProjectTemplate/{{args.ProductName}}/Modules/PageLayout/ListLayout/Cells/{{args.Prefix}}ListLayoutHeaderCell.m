//
//  {{args.Prefix}}ListLayoutHeaderCell.m
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 26/05/2017.
//  Copyright © 2017 Netease. All rights reserved.
//

#import "{{args.Prefix}}ListLayoutHeaderCell.h"
#import "UIView+Frame.h"
#import "{{args.Prefix}}ListLayoutCellDescribeData.h"

@interface {{args.Prefix}}ListLayoutHeaderCell ()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation {{args.Prefix}}ListLayoutHeaderCell

#pragma mark - Life cycle.

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor colorWithRGBValue:kDefaultBackgroundColor];
        [self loadSubviews];
    }
    return self;
}


#pragma mark - Load views.

- (void)loadSubviews {
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.textColor = [UIColor colorWithRGBValue:kSecondClassTitleTextColor];
    _titleLabel.font = [UIFont systemFontOfSize:kSecondClassContentFontSize];
    _titleLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_titleLabel];
}


#pragma mark - Layout.

- (void)layoutSubviews {
    [super layoutSubviews];
    [_titleLabel sizeToFit];
    _titleLabel.middleY = self.contentView.height / 2;
    _titleLabel.x = kLeftMargin;
}

- (CGSize)sizeThatFits:(CGSize)size {
    return CGSizeMake(size.width, 45);
}


#pragma mark - Getter & Setter.

- (void)setDescribeData:(MCTableBaseDescribeData *)describeData {
    if ([describeData isKindOfClass:[{{args.Prefix}}ListLayoutCellDescribeData class]]) {
        {{args.Prefix}}ListLayoutCellDescribeData *data = ({{args.Prefix}}ListLayoutCellDescribeData *)describeData;
        _titleLabel.text = data.title;
        [self setNeedsLayout];
    }
}

@end
