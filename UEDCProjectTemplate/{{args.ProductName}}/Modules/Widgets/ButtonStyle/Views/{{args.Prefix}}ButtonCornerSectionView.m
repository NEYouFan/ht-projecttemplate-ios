//
//  {{args.Prefix}}ButtonCornerSectionView.m
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 2017/4/21.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}ButtonCornerSectionView.h"
#import "{{args.Prefix}}ButtonCornerModel.h"
#import "UIView+Frame.h"

const CGFloat kButtonHeihgt = 45;
const CGFloat kButtonGap = 15;

@interface {{args.Prefix}}ButtonCornerSectionView ()

@property (nonatomic, copy) NSArray <{{args.Prefix}}ButtonCornerModel *> *models;
@property (nonatomic, copy) NSString *title;

@end

@implementation {{args.Prefix}}ButtonCornerSectionView

- ({{args.Prefix}}ButtonCornerSectionView *)initWithTitle:(NSString *)title
                                        Models:(NSArray <{{args.Prefix}}ButtonCornerModel *> *)models{
    if (self = [super init]) {
        self.title = title;
        self.models = models;
        [self loadSubViews];
    }
    return self;
}

- (void)loadSubViews{
    self.backgroundColor = [UIColor colorWithRGBValue:kDefaultBackgroundColor];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 26, 0, 21)];
    titleLabel.text = self.title;
    titleLabel.font = [UIFont systemFontOfSize:kDefaultTitleFontSize];
    titleLabel.textColor = [UIColor colorWithRGBValue:kLightTextColor];
    titleLabel.textAlignment = NSTextAlignmentLeft;
    [titleLabel sizeToFit];
    [self addSubview:titleLabel];
    
    CGFloat totalHeight = 52;
    
    for (int i = 0;  i < [self.models count]; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(15, totalHeight + kButtonGap, SCREEN_WIDTH - 30, 45);
        {{args.Prefix}}ButtonCornerModel *model = self.models[i];
        button.titleLabel.font = [UIFont systemFontOfSize:kDefaultButtonTitleFontSize];
        [button setTitle:model.text forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithRGBValue:model.textColor] forState:UIControlStateNormal];
        button.titleLabel.textAlignment = NSTextAlignmentCenter;
        button.layer.cornerRadius = model.cornerRadius;
        button.layer.borderColor = [UIColor colorWithRGBValue:kDefaultButtonColor].CGColor;
        button.layer.borderWidth = 0.5;
        button.backgroundColor = [UIColor colorWithRGBValue:model.backgroundColor];
        button.alpha = model.alpha;
        [self addSubview:button];
        totalHeight += kButtonGap + kButtonHeihgt;
    }
    totalHeight += 2;
    
    self.width = SCREEN_WIDTH;
    self.height = totalHeight;
}

@end
