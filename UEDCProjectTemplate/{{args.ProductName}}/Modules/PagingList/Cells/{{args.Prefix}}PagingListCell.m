//
//  {{args.Prefix}}PagingListCell.m
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 13/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "{{args.Prefix}}PagingListCell.h"
#import "{{args.Prefix}}PagingListCellModel.h"
#import "UIView+Frame.h"
#import "UIView+{{args.Prefix}}Line.h"

/// pagingListCell 中标题距离 cell 的 contentView 的上边距
static const CGFloat kPagingListCellTitleTopGap = 10;
/// pagingListCell 中标题距离 cell 的 contentView 的上边距
static const CGFloat kPagingListCellTitleBottomGap = 10;

@interface {{args.Prefix}}PagingListCell ()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation {{args.Prefix}}PagingListCell

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
    [self.contentView {{args.CategoryPrefix}}_addHorizontalBottomLineWithLeftMargin:0 rightMargin:0];
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.textColor = [UIColor colorWithRGBValue:kDefaultTextColor];
    _titleLabel.font = [UIFont systemFontOfSize:kDefaultFontSize];
    _titleLabel.numberOfLines = 0;
    [self.contentView addSubview:_titleLabel];
}


#pragma mark - Layout.

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _titleLabel.width = self.contentView.width - kLeftMargin - kRightMargin;
    [_titleLabel sizeToFit];
    _titleLabel.y = kPagingListCellTitleTopGap;
    _titleLabel.x = kLeftMargin;
}

- (CGSize)sizeThatFits:(CGSize)size {
    CGFloat width = self.contentView.width - kLeftMargin - kRightMargin;
    
    // 该方法计算 cell 的高度，根据 title 的内容自适应高度
    CGRect titleRect = [_model.title boundingRectWithSize:CGSizeMake(width, SCREEN_HEIGHT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:kDefaultFontSize]} context:nil];
    
    CGFloat height = titleRect.size.height + kPagingListCellTitleTopGap + kPagingListCellTitleBottomGap;

    return CGSizeMake(size.width, height);
}


#pragma mark - Getter & Setter.

- (void)setModel:({{args.Prefix}}PagingListCellModel *)model {
    // 这里不一定非要返回，如：当 model 某个属性改变后需要刷新 view，不一定需要新建一个 model.
    if (_model == model) {
        return ;
    }

    _model = model;
    _titleLabel.text = _model.title;
    [self setNeedsLayout];
}

@end
