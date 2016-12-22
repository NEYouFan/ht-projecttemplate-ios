//
//  {{args.Prefix}}CommonStyleViews.m
//  {{args.ProductName}}
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
    [reloadButton setTitleColor:[{{args.Prefix}}ThemeColors defaultTextColor] forState:UIControlStateNormal];
    reloadButton.layer.cornerRadius = [{{args.Prefix}}ThemeSizes cornerRadiusSize];
    reloadButton.layer.masksToBounds = YES;
    reloadButton.layer.borderColor = [{{args.Prefix}}ThemeColors themeLineColor].CGColor;
    reloadButton.layer.borderWidth = [{{args.Prefix}}ThemeSizes lineWidth];
    [reloadButton setBackgroundImage:[UIImage imageWithColor:[{{args.Prefix}}ThemeColors themeButtonColor]] forState:UIControlStateNormal];
    [reloadButton setBackgroundImage:[UIImage imageWithColor:[{{args.Prefix}}ThemeColors themeHighlightButtonColor]] forState:UIControlStateHighlighted];
    reloadButton.titleLabel.font = [{{args.Prefix}}ThemeSizes themeFont];
    
    return reloadButton;
}

@end
