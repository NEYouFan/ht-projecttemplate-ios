//
//  {{args.Prefix}}LeftPanButtonCell.m
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 2017/5/3.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}LeftPanButtonCell.h"
#import "UIView+Frame.h"

@interface {{args.Prefix}}LeftPanButtonCell ()

@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subTitleLabel;

@end

@implementation {{args.Prefix}}LeftPanButtonCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self loadSubViews];
    }
    return self;
}

-(void)loadSubViews{
    [self addSubview:self.titleLabel];
    [self addSubview:self.subTitleLabel];
    [self addSubview:self.icon];
}

-(void)layoutSubviews{
    self.icon.x = 30;
    self.icon.y = 9;
    
    self.titleLabel.x = self.icon.tail + 10;
    self.titleLabel.y = 13;
    
    self.subTitleLabel.x = self.titleLabel.x;
    self.subTitleLabel.y = self.titleLabel.bottom + 3;
}

-(UILabel *)titleLabel{
    if (!_titleLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.text = @"左滑出现";
        label.font = [UIFont systemFontOfSize:16];
        label.textColor = [UIColor colorWithRGBValue:kFisrtClassTitleTextColor];
        label.textAlignment = NSTextAlignmentLeft;
        [label sizeToFit];
        _titleLabel = label;
    }
    return _titleLabel;
}

-(UILabel *)subTitleLabel{
    if (!_subTitleLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.text = @"左滑出现的按钮";
        label.font = [UIFont systemFontOfSize:13];
        label.textColor = [UIColor colorWithRGBValue:kLightTextColor];
        label.textAlignment = NSTextAlignmentLeft;
        [label sizeToFit];
        _subTitleLabel = label;
    }
    return _subTitleLabel;
}

-(UIImageView *)icon{
    if (!_icon) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image = [UIImage imageNamed:@"widget_default_l"];
        imageView.size = CGSizeMake(45, 45);
        _icon = imageView;
    }
    return _icon;
}

@end
