//
//  {{args.Prefix}}ImageTextButton.m
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 2017/4/18.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}ImageTextButton.h"

@implementation {{args.Prefix}}ImageTextButton

- (void)setIconView:(UIImageView *)iconView{
    [self addSubview:iconView];
    _iconView = iconView;
}

- (void)setTextLabel:(UILabel *)textLabel{
    [self addSubview:textLabel];
    _textLabel = textLabel;
}

- (void)setHighlighted:(BOOL)highlighted{
    if (!highlighted) {
        self.iconView.image = self.normalImage;
        self.textLabel.textColor = self.normalTextColor;
    }else{
        self.iconView.image = self.highlightedImage;
        self.textLabel.textColor = self.highlightedTextColor;
    }
}

- (void)cancelTrackingWithEvent:(nullable UIEvent *)event{
    self.iconView.image = self.normalImage;
    self.textLabel.textColor = self.normalTextColor;
}

@end
