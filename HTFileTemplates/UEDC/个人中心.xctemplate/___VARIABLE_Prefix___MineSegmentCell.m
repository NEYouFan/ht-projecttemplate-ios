//
//  ___VARIABLE_Prefix:identifier___MineSegmentCell.m
//  ___VARIABLE_Prefix:identifier___
//
//  Created by Baitianyu on 17/05/2017.
//  Copyright © 2017 Netease. All rights reserved.
//

#import "___VARIABLE_Prefix:identifier___MineSegmentCell.h"
#import "UIView+___VARIABLE_Prefix:identifier___Line.h"
#import "UIView+Frame.h"
#import "___VARIABLE_Prefix:identifier___MineCellDescribeData.h"
#import "UIImage+ImageWithColor.h"
#import "___VARIABLE_Prefix:identifier___MineSegmentItem.h"

@interface ___VARIABLE_Prefix:identifier___MineSegmentCell () <___VARIABLE_Prefix:identifier___SegmentItemDelegate>

@property (nonatomic, strong) NSArray<NSString *> *iconNames;
@property (nonatomic, strong) NSMutableArray<___VARIABLE_Prefix:identifier___MineSegmentItem *> *segmentItems;

@end

@implementation ___VARIABLE_Prefix:identifier___MineSegmentCell

#pragma mark - Life cycle.

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}


#pragma mark - Load views.

- (void)reloadSubviews {
    for (___VARIABLE_Prefix:identifier___MineSegmentItem *item in _segmentItems) {
        [item removeFromSuperview];
    }
    _segmentItems = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < _iconNames.count; i++) {
        ___VARIABLE_Prefix:identifier___MineSegmentItem *item = [[___VARIABLE_Prefix:identifier___MineSegmentItem alloc] initWithType:(i+1) iconName:_iconNames[i]];
        item.delegate = self;
        [_segmentItems addObject:item];
        if (i != 0) {
            [item ___VARIABLE_CategoryPrefix:identifier____addVerticalHeadLineWithTopMargin:15 bottomMargin:15];
        }
        [self.contentView addSubview:item];
    }
}


#pragma mark - Layout.

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat width = self.contentView.width / _segmentItems.count;
    for (NSInteger i = 0; i < _segmentItems.count; i++) {
        ___VARIABLE_Prefix:identifier___MineSegmentItem *item = _segmentItems[i];
        item.size = CGSizeMake(width, self.contentView.height);
        item.y = 0;
        item.x = i * width;
    }
}

- (CGSize)sizeThatFits:(CGSize)size {
    return CGSizeMake(size.width, 60);
}


#pragma mark - ___VARIABLE_Prefix:identifier___SegmentItemDelegate.

- (void)segmentItemSelected:(___VARIABLE_Prefix:identifier___MineSegmentItem *)item type:(___VARIABLE_Prefix:identifier___MineSegmentItemType)type {
    switch (type) {
        case ___VARIABLE_Prefix:identifier___MineSegmentItemTypeFirst:
            if ([_delegate respondsToSelector:@selector(firstSegmentClicked:)]) {
                [_delegate firstSegmentClicked:self];
            }
            break;
        case ___VARIABLE_Prefix:identifier___MineSegmentItemTypeSecond:
            if ([_delegate respondsToSelector:@selector(secondSegmentClicked:)]) {
                [_delegate secondSegmentClicked:self];
            }
            break;
        case ___VARIABLE_Prefix:identifier___MineSegmentItemTypeThird:
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
    if ([describeData isKindOfClass:[___VARIABLE_Prefix:identifier___MineCellDescribeData class]]) {
        ___VARIABLE_Prefix:identifier___MineCellDescribeData *data = (___VARIABLE_Prefix:identifier___MineCellDescribeData *)describeData;
        _delegate = data.delegate;
        _iconNames = data.segmentIconNames;
        [self reloadSubviews];
        [self setNeedsLayout];
    }
}

@end
