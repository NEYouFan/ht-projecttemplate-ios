//
//  {{args.Prefix}}StaticListDemoCell2.m
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 12/16/2016.
//  Copyright © 2016 HT. All rights reserved.
//

#import "{{args.Prefix}}StaticListDemoCell2.h"
#import "{{args.Prefix}}StaticListDescribeData.h"
#import "UIView+{{args.Prefix}}Line.h"
#import "UIView+Frame.h"
#import "{{args.Prefix}}StaticListSizes.h"

@implementation {{args.Prefix}}StaticListDemoCell2

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
    
    _headerIconImageView = [[UIImageView alloc] init];
    [self.contentView addSubview:_headerIconImageView];
   
    _contentLabel = [[UILabel alloc] init];
    _contentLabel.textColor = [UIColor blackColor];
    _contentLabel.font = [{{args.Prefix}}StaticListSizes contentLabelFont];
    _contentLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_contentLabel];
    
    _rightSwitchButton = [[UISwitch alloc] init];
    [_rightSwitchButton addTarget:self action:@selector(switchStatusChanged:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_rightSwitchButton];
}


#pragma mark - Layout.

- (void)layoutSubviews {
    [super layoutSubviews];
    [_headerIconImageView sizeToFit];
    _headerIconImageView.x = [{{args.Prefix}}ThemeSizes leftMargin];
    _headerIconImageView.middleY = self.contentView.height / 2;
   
    [_contentLabel sizeToFit];
    _contentLabel.x = [{{args.Prefix}}StaticListSizes contentLeftMargin];
    _contentLabel.middleY = self.contentView.height / 2;
    
    _rightSwitchButton.tail = self.contentView.width - [{{args.Prefix}}StaticListSizes actionButtonRightMargin];
    _rightSwitchButton.middleY = self.contentView.height / 2;
}


#pragma mark - Getter & Setter.

- (void)setDescribeData:(MCTableBaseDescribeData *)describeData {
    if ([describeData isKindOfClass:{{args.Prefix}}StaticListDescribeData.class]) {
        {{args.Prefix}}StaticListDescribeData *data = ({{args.Prefix}}StaticListDescribeData *)describeData;
        _headerIconImageView.image = [UIImage imageNamed:data.headerIconName];
        _contentLabel.text = data.content;
        _rightSwitchButton.on = data.switchStatus;
        _delegate = data.cell2Delegate;
    }
}


#pragma mark - Actions.

- (void)switchStatusChanged:(id)sender {
    [_delegate switchStatusChanged:self];
}

@end
