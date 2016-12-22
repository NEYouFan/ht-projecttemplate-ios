//
//  {{args.Prefix}}PagingListCell.m
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 13/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "{{args.Prefix}}PagingListCell.h"
#import "{{args.Prefix}}PagingListCellViewModel.h"
#import "UIView+Frame.h"
#import "UIView+{{args.Prefix}}Line.h"
#import "{{args.Prefix}}PagingListSizes.h"

@interface {{args.Prefix}}PagingListCell ()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation {{args.Prefix}}PagingListCell

#pragma mark - Life cycle.

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [{{args.Prefix}}ThemeColors themeBackgroundColor];
        [self loadSubviews];
    }
    
    return self;
}


#pragma mark - Load views.

- (void)loadSubviews {
    [self.contentView {{args.CategoryPrefix}}_addHorizontalBottomLineWithLeftMargin:0 rightMargin:0];
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.textColor = [{{args.Prefix}}ThemeColors defaultTextColor];
    _titleLabel.font = [{{args.Prefix}}ThemeSizes themeFont];
    _titleLabel.numberOfLines = 0;
    [self.contentView addSubview:_titleLabel];
}


#pragma mark - Layout.

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _titleLabel.width = self.contentView.width - [{{args.Prefix}}ThemeSizes leftMargin] - [{{args.Prefix}}ThemeSizes rightMargin];
    [_titleLabel sizeToFit];
    _titleLabel.y = [{{args.Prefix}}PagingListSizes pagingListCellTitleTopGap];
    _titleLabel.x = [{{args.Prefix}}ThemeSizes leftMargin];
}

- (CGSize)sizeThatFits:(CGSize)size {
    CGFloat width = self.contentView.width - [{{args.Prefix}}ThemeSizes leftMargin] - [{{args.Prefix}}ThemeSizes rightMargin];
    
    // 该方法计算 cell 的高度，根据 title 的内容自适应高度
    CGRect titleRect = [_viewModel.title boundingRectWithSize:CGSizeMake(width, [{{args.Prefix}}ThemeSizes screenHeight]) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[{{args.Prefix}}ThemeSizes themeFont]} context:nil];
    
    CGFloat height = titleRect.size.height + [{{args.Prefix}}PagingListSizes pagingListCellTitleTopGap] + [{{args.Prefix}}PagingListSizes pagingListCellTitleBottomGap];

    return CGSizeMake(size.width, height);
}


#pragma mark - Getter & Setter.

- (void)setViewModel:({{args.Prefix}}PagingListCellViewModel *)viewModel {
    // 这里不一定非要返回，如：当 viewModel 某个属性改变后需要刷新 view，不一定需要新建一个 viewModel.
    if (_viewModel == viewModel) {
        return ;
    }

    _viewModel = viewModel;
    _titleLabel.text = _viewModel.title;
    [self setNeedsLayout];
}

@end
