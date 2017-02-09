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

@end
