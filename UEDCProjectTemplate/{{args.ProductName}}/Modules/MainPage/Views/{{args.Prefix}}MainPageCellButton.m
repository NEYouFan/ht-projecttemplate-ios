//
//  {{args.Prefix}}MainPageCellButton.m
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 2017/4/19.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}MainPageCellButton.h"
#import "{{args.Prefix}}CommonColors.h"

@implementation {{args.Prefix}}MainPageCellButton

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
        self.backgroundColor = [UIColor whiteColor];
    }else{
        self.backgroundColor = [UIColor colorWithRGBValue:kDefaultCellSelectedColor];
    }
}

- (void)cancelTrackingWithEvent:(nullable UIEvent *)event{
    self.backgroundColor = [UIColor whiteColor];
}
@end
