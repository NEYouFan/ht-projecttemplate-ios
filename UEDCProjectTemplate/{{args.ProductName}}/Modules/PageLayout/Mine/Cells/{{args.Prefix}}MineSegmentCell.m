//
//  {{args.Prefix}}MineSegmentCell.m
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 17/05/2017.
//  Copyright © 2017 Netease. All rights reserved.
//

#import "{{args.Prefix}}MineSegmentCell.h"
#import "UIView+{{args.Prefix}}Line.h"
#import "UIView+Frame.h"
#import "{{args.Prefix}}MineCellDescribeData.h"
#import "UIImage+ImageWithColor.h"
#import "{{args.Prefix}}MineSegmentItem.h"

@interface {{args.Prefix}}MineSegmentCell () <{{args.Prefix}}SegmentItemDelegate>

@property (nonatomic, strong) NSArray<NSString *> *iconNames;
@property (nonatomic, strong) NSMutableArray<{{args.Prefix}}MineSegmentItem *> *segmentItems;

@end

@implementation {{args.Prefix}}MineSegmentCell

#pragma mark - Life cycle.

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}


#pragma mark - Load views.

- (void)reloadSubviews {
    for ({{args.Prefix}}MineSegmentItem *item in _segmentItems) {
        [item removeFromSuperview];
    }
    _segmentItems = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < _iconNames.count; i++) {
        {{args.Prefix}}MineSegmentItem *item = [[{{args.Prefix}}MineSegmentItem alloc] initWithType:(i+1) iconName:_iconNames[i]];
        item.delegate = self;
        [_segmentItems addObject:item];
        if (i != 0) {
            [item {{args.CategoryPrefix}}_addVerticalHeadLineWithTopMargin:15 bottomMargin:15];
        }
        [self.contentView addSubview:item];
    }
}


#pragma mark - Layout.

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat width = self.contentView.width / _segmentItems.count;
    for (NSInteger i = 0; i < _segmentItems.count; i++) {
        {{args.Prefix}}MineSegmentItem *item = _segmentItems[i];
        item.size = CGSizeMake(width, self.contentView.height);
        item.y = 0;
        item.x = i * width;
    }
}

- (CGSize)sizeThatFits:(CGSize)size {
    return CGSizeMake(size.width, 60);
}


#pragma mark - {{args.Prefix}}SegmentItemDelegate.

- (void)segmentItemSelected:({{args.Prefix}}MineSegmentItem *)item type:({{args.Prefix}}MineSegmentItemType)type {
    switch (type) {
        case {{args.Prefix}}MineSegmentItemTypeFirst:
            if ([_delegate respondsToSelector:@selector(firstSegmentClicked:)]) {
                [_delegate firstSegmentClicked:self];
            }
            break;
        case {{args.Prefix}}MineSegmentItemTypeSecond:
            if ([_delegate respondsToSelector:@selector(secondSegmentClicked:)]) {
                [_delegate secondSegmentClicked:self];
            }
            break;
        case {{args.Prefix}}MineSegmentItemTypeThird:
            if ([_delegate respondsToSelector:@selector(thirdSegmentClicked:)]) {
                [_delegate thirdSegmentClicked:self];
            }
            break;
        default:
            break;
    }
}


#pragma mark - Getter & Setter.

- (void)setDescribeData:(MCTableBaseDescribeData *)describeData {
    if ([describeData isKindOfClass:[{{args.Prefix}}MineCellDescribeData class]]) {
        {{args.Prefix}}MineCellDescribeData *data = ({{args.Prefix}}MineCellDescribeData *)describeData;
        _delegate = data.delegate;
        _iconNames = data.segmentIconNames;
        [self reloadSubviews];
        [self setNeedsLayout];
    }
}

@end
