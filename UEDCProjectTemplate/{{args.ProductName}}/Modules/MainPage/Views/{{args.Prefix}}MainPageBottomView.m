//
//  {{args.Prefix}}MainPageBottomView.m
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 2017/4/19.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}MainPageBottomView.h"
#import "UIView+Frame.h"
#import "{{args.Prefix}}CommonSizes.h"
#import "{{args.Prefix}}CommonColors.h"
@implementation {{args.Prefix}}MainPageBottomView

- (instancetype)init{
    if (self = [super init]) {
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, 82.5);
        self.backgroundColor = [UIColor colorWithRGBValue:kDefaultBackgroundColor];
        [self loadSubViews];
    }
    return self;
}

- (void)loadSubViews{
    UIImageView *iconView = [[UIImageView alloc] init];
    iconView.image = [UIImage imageNamed:@"mainPage_{{args.CategoryPrefix}}"];
    iconView.width = 52;
    iconView.height = 22;
    iconView.middleX = SCREEN_WIDTH/2;
    iconView.middleY = self.height/2;
    [self addSubview:iconView];
}

@end
