//
//  {{args.Prefix}}SwithCell.m
//  {{args.Prefix}}
//
//  Created by NetEase on 2017/4/27.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}SwithCell.h"
#import "UIView+Frame.h"
#import "{{args.Prefix}}SwitchCellModel.h"
#import "UIView+{{args.Prefix}}Line.h"
#import "{{args.Prefix}}Slider.h"

@interface {{args.Prefix}}SwithCell()

@end

@implementation {{args.Prefix}}SwithCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
         [self commonInit];
    }
    return self;
}

-(void)commonInit{
    
    [self addSubview:self.titleLabel];
    [self addSubview:self.switchWidget];
    [self addSubview:self.slider];
    
    [self {{args.CategoryPrefix}}_addHorizontalBottomLineWithLeftMargin:20 rightMargin:0];
    
    
}

-(void)layoutSubviews{
    
    self.titleLabel.x = 20;
    self.titleLabel.middleY = self.bounds.size.height/2;
    
    self.switchWidget.x = SCREEN_WIDTH - 70;
    self.switchWidget.middleY =self.bounds.size.height/2;
    
    self.slider.x = self.titleLabel.x + self.titleLabel.width + 20;
    self.slider.width = SCREEN_WIDTH - self.slider.x - 20;
    self.slider.middleY = self.bounds.size.height/2;
    
    
}

-(UILabel *)titleLabel{
    if (!_titleLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:15];
        label.textColor = [UIColor colorWithRGBValue:kContentTextColor];
        label.textAlignment = NSTextAlignmentLeft;
        _titleLabel = label;
    }
    return _titleLabel;
}

-(UISwitch *)switchWidget{
    if (!_switchWidget) {
        UISwitch * switchWidget = [[UISwitch alloc]init];
        switchWidget.onTintColor = [UIColor colorWithRGBValue:kDefaultSwitchHighlightColor];
        _switchWidget = switchWidget;
    }
    return _switchWidget;
}

-({{args.Prefix}}Slider *)slider{
    if (!_slider){
        {{args.Prefix}}Slider *slider = [[{{args.Prefix}}Slider alloc]init];
        slider.maximumTrackTintColor = [UIColor colorWithRGBValue:kDefaultSliderKMaxColor];
        slider.minimumTrackTintColor = [UIColor colorWithRGBValue:kDefaultSwitchHighlightColor];
        UIImage * image = [UIImage imageNamed:@"widget_slider"];
        [slider setThumbImage:image forState:UIControlStateNormal];
        [slider setThumbImage:image forState:UIControlStateHighlighted];
        _slider = slider;
    }
    return _slider;
}

-(void)setModel:({{args.Prefix}}SwitchCellModel *)model{
    _model = model;
    self.titleLabel.text = model.title;
    [self.titleLabel sizeToFit];
    
    if(model.sliderValue){
        self.switchWidget.hidden = YES;
        self.slider.hidden = NO;
    }else{
        self.switchWidget.hidden = NO;
        self.slider.hidden = YES;
    }
    
    [self.switchWidget setOn:model.isOpen];
    self.slider.value = model.sliderValue;
    
    
}
@end
