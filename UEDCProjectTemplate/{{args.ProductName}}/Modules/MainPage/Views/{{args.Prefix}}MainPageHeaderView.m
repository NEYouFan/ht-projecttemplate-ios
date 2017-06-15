//
//  {{args.Prefix}}MainPageHeaderView.m
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 2017/4/19.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}MainPageHeaderView.h"
#import "{{args.Prefix}}CommonColors.h"
#import "{{args.Prefix}}CommonSizes.h"
#import "UIView+Frame.h"

@implementation {{args.Prefix}}MainPageHeaderView

- (instancetype)init{
    if (self = [super init]) {
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, 0);
        self.backgroundColor = [UIColor colorWithRGBValue:kDefaultBackgroundColor];
        [self loadSubViews];
    }
    return self;
}

- (void)loadSubViews{
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, 34, 0, 35)];
    titleLabel.font = [UIFont systemFontOfSize:25];
    titleLabel.text = @"NetEase UI";
    titleLabel.textColor = [UIColor colorWithRGBValue:kDefaultTextColor];
    titleLabel.textAlignment = NSTextAlignmentLeft;
    [titleLabel sizeToFit];
    [self addSubview:titleLabel];
    
    UILabel *contentLabel = [[UILabel alloc] init];
    contentLabel.font = [UIFont systemFontOfSize:kDefaultFontSize];
    contentLabel.textAlignment = NSTextAlignmentLeft;
    contentLabel.textColor = [UIColor colorWithRGBValue:kLightTextColor];
    contentLabel.numberOfLines = 0;
    contentLabel.text = @"NetEase UI是一套网易集团内部视觉体验统一的基础样式库，由网易{{args.Prefix}}移动端视觉委员会为集团旗下产品量身打造，使用户的使用感知更加统一，同时大大提高设计与开发的效率。";
    contentLabel.x = 30;
    contentLabel.y = titleLabel.bottom +6.5;
    contentLabel.width = SCREEN_WIDTH - 60;
    [contentLabel sizeToFit];
    [self addSubview:contentLabel];
    self.height = 34 + titleLabel.height + 6.5 +contentLabel.height + 5;
}

@end
