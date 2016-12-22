//
//  {{args.Prefix}}StaticListDemoCell1.m
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 12/16/2016.
//  Copyright © 2016 HT. All rights reserved.
//

#import "{{args.Prefix}}StaticListDemoCell1.h"
#import "{{args.Prefix}}StaticListDescribeData.h"
#import "UIView+{{args.Prefix}}Line.h"
#import "UIView+Frame.h"
#import "{{args.Prefix}}StaticListSizes.h"
#import "{{args.Prefix}}CommonStyleViews.h"

@implementation {{args.Prefix}}StaticListDemoCell1

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
    _titleLabel.textColor = [UIColor redColor];
    _titleLabel.font = [{{args.Prefix}}StaticListSizes titleLabelFont];
    _titleLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_titleLabel];
    
    _contentLabel = [[UILabel alloc] init];
    _contentLabel.textColor = [UIColor blackColor];
    _contentLabel.font = [{{args.Prefix}}StaticListSizes contentLabelFont];
    _contentLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_contentLabel];
    
    _actionButton = [{{args.Prefix}}CommonStyleViews loadingReloadButton];
    [_actionButton addTarget:self action:@selector(changeBadgeCount:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_actionButton];
}


#pragma mark - Layout.

- (void)layoutSubviews {
    [super layoutSubviews];
    [_titleLabel sizeToFit];
    _titleLabel.x = [{{args.Prefix}}ThemeSizes leftMargin];
    _titleLabel.middleY = self.contentView.height / 2;
    
    [_contentLabel sizeToFit];
    _contentLabel.x = [{{args.Prefix}}StaticListSizes contentLeftMargin];
    _contentLabel.middleY = self.contentView.height / 2;
    
    _actionButton.size = [{{args.Prefix}}StaticListSizes actionButtonSize];
    _actionButton.tail = self.contentView.width - [{{args.Prefix}}StaticListSizes actionButtonRightMargin];
    _actionButton.middleY = self.contentView.height / 2;
}


#pragma mark - Getter & Setter.

- (void)setDescribeData:(MCTableBaseDescribeData *)describeData {
    if ([describeData isKindOfClass:{{args.Prefix}}StaticListDescribeData.class]) {
        {{args.Prefix}}StaticListDescribeData *data = ({{args.Prefix}}StaticListDescribeData *)describeData;
        _titleLabel.text = data.title;
        _contentLabel.text = data.content;
        _actionIncrease = data.actionIncrease;
        _delegate = data.cell1Delegate;
        [_actionButton setTitle:data.actionButtonTitle forState:UIControlStateNormal];
        [self setNeedsLayout]; // 如果使用的是 frame 布局，这里需要更新布局
    }
}


#pragma mark - Actions.

- (void)changeBadgeCount:(id)sender {
    if (_actionIncrease) {
        [_delegate increaseBadgeCount:self];
    } else {
        [_delegate decreaseBadgeCount:self];
    }
}

@end
