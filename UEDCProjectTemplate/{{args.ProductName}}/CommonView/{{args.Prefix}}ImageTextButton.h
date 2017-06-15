//
//  {{args.Prefix}}ImageTextButton.h
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 2017/4/18.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface {{args.Prefix}}ImageTextButton : UIButton

@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *textLabel;

@property (nonatomic, strong) UIImage *normalImage;
@property (nonatomic, strong) UIImage *highlightedImage;

@property (nonatomic, strong) UIColor *normalTextColor;
@property (nonatomic, strong) UIColor *highlightedTextColor;

@end
