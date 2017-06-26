//
//  ___VARIABLE_Prefix:identifier___ShareCollectionViewCell.m
//  ___VARIABLE_Prefix:identifier___
//
//  Created by 陶泽宇 on 2017/5/16.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "___VARIABLE_Prefix:identifier___ShareCollectionViewCell.h"
#import "UIView+Frame.h"

const CGFloat kShareCollectionCellHeight = 102;

@interface ___VARIABLE_Prefix:identifier___ShareCollectionViewCell ()

@property (nonatomic, strong) UIButton *imageButton;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation ___VARIABLE_Prefix:identifier___ShareCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self loadSubViews];
    }
    return self;
}

- (void)loadSubViews{
    _imageButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _imageButton.width = 60;
    _imageButton.height = 60;
    _imageButton.y = 0;
    _imageButton.layer.cornerRadius = 12;
    _imageButton.clipsToBounds = YES;
    _imageButton.middleX = self.contentView.middleX;
    [_imageButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_imageButton];
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.text = self.data.title;
    _titleLabel.font = [UIFont systemFontOfSize:15];
    _titleLabel.textColor = [UIColor colorWithRGBValue:0x333333];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel.width = self.contentView.width - 10;
    _titleLabel.y = _imageButton.bottom + 6;
    _titleLabel.height = 21;
    _titleLabel.middleX = self.contentView.middleX;
    [self.contentView addSubview:_titleLabel];
}

- (void)setData:(___VARIABLE_Prefix:identifier___ShareContentData *)data{
    _data = data;
//    [_imageButton setImage:self.data.image forState:UIControlStateNormal];
//    [_imageButton setImage:self.data.imagePressed forState:UIControlStateHighlighted];
    [_imageButton setBackgroundImage:self.data.image forState:UIControlStateNormal];
    [_imageButton setBackgroundImage:self.data.imagePressed forState:UIControlStateHighlighted];
    _titleLabel.text = self.data.title;
    [self setNeedsLayout];
}

- (void)buttonClicked:(id)sender{
    if ([self.delegate respondsToSelector:@selector(onClickShareItem:)]) {
        [self.delegate onClickShareItem:self];
    }
}


@end
