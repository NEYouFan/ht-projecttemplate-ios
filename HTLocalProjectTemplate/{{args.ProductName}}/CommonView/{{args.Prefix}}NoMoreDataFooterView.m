//
//  {{args.Prefix}}NoMoreDataFooterView.m
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 08/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "{{args.Prefix}}NoMoreDataFooterView.h"
#import "Masonry.h"
#import "{{args.Prefix}}LoadingSizes.h"

@interface {{args.Prefix}}NoMoreDataFooterView()

@property (nonatomic, strong) UILabel *footerLabel;

@end

@implementation {{args.Prefix}}NoMoreDataFooterView

#pragma mark - Life cycle.

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self loadSubviews];
    }
    return self;
}


#pragma mark - Load views.

- (void)loadSubviews {
    _footerLabel = [[UILabel alloc] init];
    _footerLabel.text = @"没有更多了";
    _footerLabel.font = [{{args.Prefix}}ThemeSizes themeFont];
    _footerLabel.textColor = [{{args.Prefix}}ThemeColors defaultTextColor];
    [_footerLabel sizeToFit];
    CGSize size = _footerLabel.bounds.size;
    [self addSubview:_footerLabel];
    [_footerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.width.equalTo(@(size.width));
        make.height.equalTo(@(size.height));
    }];
}

@end
