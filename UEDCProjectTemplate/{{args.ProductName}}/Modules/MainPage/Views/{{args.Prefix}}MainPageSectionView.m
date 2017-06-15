//
//  {{args.Prefix}}MainPageSectionView.m
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 2017/4/19.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}MainPageSectionView.h"
#import "{{args.Prefix}}CommonSizes.h"
#import "{{args.Prefix}}CommonColors.h"
#import "{{args.Prefix}}MainPageCellButton.h"
#import "UIView+Frame.h"
#import "UIView+{{args.Prefix}}Line.h"

const CGFloat kSectionViewCellHeight = 44;
const CGFloat kSectionHeaderHeight = 68.5;


@implementation {{args.Prefix}}MainPageSectionView

/**
 初始化生成SectionView， View的高度会根据传入的参数自动计算
 
 @param title Section 标题
 @param iconName 图标的名称
 @param cellNames 每个cell的展示名称
 @param urls 每个cell点击之后的跳转routerURL
 @return SectionView
 */
- (instancetype)initWithTitle:(NSString *)title
                     iconName:(NSString *)iconName
                    cellNames:(NSArray<NSString *> *)cellNames
                   routerURLs:(NSArray<NSString *> *)urls{
    CGFloat height = kSectionHeaderHeight + [cellNames count] * kSectionViewCellHeight;
    self = [[{{args.Prefix}}MainPageSectionView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, height)];
    self.backgroundColor = [UIColor whiteColor];
    self.layer.cornerRadius = 2.0;
    
    UILabel *titleLable = [[UILabel alloc] initWithFrame:CGRectMake(15.5, 23, 0, 22.5)];
    titleLable.text = title;
    titleLable.textColor = [UIColor colorWithRGBValue:kLightTextColor];
    titleLable.font = [UIFont systemFontOfSize:16];
    titleLable.textAlignment = NSTextAlignmentLeft;
    [titleLable sizeToFit];
    [self addSubview:titleLable];
    
    UIImageView *iconView = [[UIImageView alloc] init];
    iconView.width = 30;
    iconView.height = 30;
    iconView.y = 18.5;
    iconView.tail = self.width - 20.5;
    iconView.image = [UIImage imageNamed:iconName];
    [self addSubview:iconView];
    
    for (int index = 0; index < [cellNames count]; index ++) {
        {{args.Prefix}}MainPageCellButton *button = [[{{args.Prefix}}MainPageCellButton alloc] initWithFrame:CGRectMake(0, kSectionHeaderHeight + kSectionViewCellHeight * index, self.width, kSectionViewCellHeight)];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15.5, 14, 0, 16)];
        label.textColor = [UIColor colorWithRGBValue:kDefaultTextColor];
        label.text = [cellNames objectAtIndex:index];
        label.textAlignment = NSTextAlignmentLeft;
        label.font = [UIFont systemFontOfSize:16];
        [label sizeToFit];
        button.textLabel = label;
        
        UIImageView *iconView = [[UIImageView alloc] initWithFrame:CGRectMake(self.width-7.5-20, 16, 7.5, 12)];
        iconView.image = [UIImage imageNamed:@"mainPage_rightArrow"];
        button.iconView = iconView;
        
        if (index != [cellNames count] - 1) {
            [button {{args.CategoryPrefix}}_addHorizontalBottomLineWithLeftMargin:15 rightMargin:15];
        }
        
        [button addTarget:self action:@selector(onCellClicked:) forControlEvents:UIControlEventTouchUpInside];
        button.routerURL = [urls objectAtIndex:index];
        [self addSubview:button];
    }
    return self;
}

- (void)onCellClicked:(UIButton *)btn{
    if ([btn isKindOfClass:[{{args.Prefix}}MainPageCellButton class]]) {
        if ([self.delegate conformsToProtocol:@protocol({{args.Prefix}}MainPageSectionViewDelegate)]) {
            [self.delegate jumpWithRouterURL:(({{args.Prefix}}MainPageCellButton *)btn).routerURL];
        }
    }
}

@end
