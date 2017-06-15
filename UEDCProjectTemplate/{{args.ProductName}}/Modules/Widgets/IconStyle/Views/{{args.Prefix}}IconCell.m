//
//  {{args.Prefix}}IconCell.m
//  {{args.Prefix}}
//
//  Created by NetEase on 2017/5/2.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}IconCell.h"
#import "UIView+Frame.h"
#import "{{args.Prefix}}IconCellModel.h"

@implementation {{args.Prefix}}IconCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    [self.contentView addSubview:self.imageView];
    [self.contentView  addSubview:self.namelabel];
}

-(void)layoutSubviews{
    
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    
    self.imageView.middleX = width/2;
    self.imageView.y = 20;
    
    self.namelabel.middleX = width/2;
    self.namelabel.y = height - 10;
    
}

-(UIImageView *)imageView{
    if (!_imageView) {
        UIImageView * imageView = [[UIImageView alloc]init];
        _imageView = imageView;
    }
    return _imageView;
}

-(UILabel *)namelabel{
    if (!_namelabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:15.0];
        label.textColor = [UIColor colorWithRGBValue:kLightTextColor];
        label.textAlignment = NSTextAlignmentCenter;
        _namelabel = label;
    }
    return _namelabel;
}
-(void)setModel:({{args.Prefix}}IconCellModel *)model{
    _model = model;
    
    self.imageView.image = [UIImage imageNamed:model.imageName];
    [self.imageView sizeToFit];
    
    self.namelabel.text = model.name;
    [self.namelabel sizeToFit];
}
@end
