//
//  {{args.Prefix}}CommonStyleViews.m
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 08/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "{{args.Prefix}}CommonStyleViews.h"
#import "UIImage+ImageWithColor.h"

@implementation {{args.Prefix}}CommonStyleViews

+ (UIButton *)loadingReloadButton {
    UIButton *reloadButton = [[UIButton alloc] init];
    [reloadButton setTitle:@"点击重新加载" forState:UIControlStateNormal];
    [reloadButton setTitleColor:[UIColor colorWithRGBValue:kDefaultTextColor] forState:UIControlStateNormal];
    reloadButton.layer.cornerRadius = kCornerRadiusSize;
    reloadButton.layer.masksToBounds = YES;
    reloadButton.layer.borderColor = [UIColor colorWithRGBValue:kDefaultLineColor].CGColor;
    reloadButton.layer.borderWidth = LINE_WIDTH;
    [reloadButton setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithRGBValue:kDefaultButtonColor]] forState:UIControlStateNormal];
    [reloadButton setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithRGBValue:kDefaultButtonHighlightColor]] forState:UIControlStateHighlighted];
    reloadButton.titleLabel.font = [UIFont systemFontOfSize:kDefaultFontSize];
    
    return reloadButton;
}

+ (UIButton *)loginStyleButtonWithTitle:(NSString *)title {
    UIButton *button = [[UIButton alloc] init];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithRGBValue:kWhitheTextColor] forState:UIControlStateNormal];
    button.layer.cornerRadius = kCornerRadiusSize;
    button.layer.masksToBounds = YES;
    button.titleLabel.font = [UIFont systemFontOfSize:kDefaultTitleFontSize];
    button.backgroundColor = [UIColor colorWithRGBValue:kDefaultButtonBackgroundColor];
    
    return button;
}

+ (UIButton *)loadingReloadButtonWithTitle:(NSString *)title {
    UIButton *reloadButton = [[UIButton alloc] init];
    [reloadButton setTitle:title forState:UIControlStateNormal];
    [reloadButton setTitleColor:[UIColor colorWithRGBValue:kWhitheTextColor] forState:UIControlStateNormal];
    reloadButton.layer.cornerRadius = kCornerRadiusSize;
    reloadButton.layer.masksToBounds = YES;
    reloadButton.titleLabel.font = [UIFont systemFontOfSize:kDefaultFontSize];
    reloadButton.backgroundColor = [UIColor colorWithRGBValue:kDefaultButtonColor];
    
    return reloadButton;
}

@end
