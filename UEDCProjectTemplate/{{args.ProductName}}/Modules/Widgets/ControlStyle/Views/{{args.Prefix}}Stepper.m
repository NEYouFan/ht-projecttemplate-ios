//
//  {{args.Prefix}}Stepper.m
//  {{args.Prefix}}
//
//  Created by NetEase on 2017/4/26.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}Stepper.h"

@interface {{args.Prefix}}Stepper()

@property(nonatomic, strong) UITextField * countTextField;
@property(nonatomic, strong) UIButton * incrementButton;
@property(nonatomic, strong) UIButton * decrementButton;

@end

@implementation {{args.Prefix}}Stepper

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    
    [self addSubview:self.countTextField];
    [self addSubview:self.incrementButton];
    [self addSubview:self.decrementButton];
    
    self.layer.borderWidth = 0.5f;
    self.layer.borderColor = [UIColor colorWithRGBValue:kStepperBorderColor].CGColor;
    

}

-(void)layoutSubviews{

    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    
    CGFloat scaleWithButton = 90.0/320;
    CGFloat scaleWithCountTextField = 140.0/320;
    
    CGFloat  buttonWidth = width * scaleWithButton;
    CGFloat  countWidth = width * scaleWithCountTextField;
    
    self.decrementButton.frame = CGRectMake(0, 0, buttonWidth, height);
    self.countTextField.frame = CGRectMake(buttonWidth, 0, countWidth, height);
    self.incrementButton.frame = CGRectMake(width - buttonWidth, 0, buttonWidth, height);
    

}

#pragma mark - evert handler

- (void)incrementButtonTapped:(id)sender {
    self.currentValue ++;
    
}
- (void)decrementButtonTapped:(id)sender {
    if (self.currentValue>0) {
        self.currentValue -- ;
    }
    
}

#pragma mark - setter & getter

-(UITextField *)countTextField{
    if(!_countTextField){
        UITextField * countTextField = [[UITextField alloc]init];
        countTextField.textAlignment = NSTextAlignmentCenter;
        countTextField.font = [UIFont systemFontOfSize:15];
        countTextField.layer.masksToBounds = YES;
        countTextField.layer.borderWidth = 0.5f;
        countTextField.layer.borderColor = [UIColor colorWithRGBValue:kStepperBorderColor].CGColor;
        countTextField.text = @"0";
        countTextField.backgroundColor = [UIColor whiteColor];
        _countTextField = countTextField;
    }
    return _countTextField;
}

-(UIButton *)incrementButton{
    if (!_incrementButton) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:@"+" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithRGBValue:kStepperTextColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        [button addTarget:self action:@selector(incrementButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        button.backgroundColor = [UIColor whiteColor];
        _incrementButton = button;
    }
    return _incrementButton;
}

-(UIButton *)decrementButton{
    if (!_decrementButton) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:@"-" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithRGBValue:kStepperTextColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        [button addTarget:self action:@selector(decrementButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        button.backgroundColor = [UIColor whiteColor];
        _decrementButton = button;
    }
    return _decrementButton;
}

-(void)setCurrentValue:(int)currentValue{
    _currentValue = currentValue;
    self.countTextField.text = [NSString stringWithFormat:@"%i",currentValue];
    if (self.valueChangedCallback) {
        self.valueChangedCallback(self, currentValue);
    }
    
}

-(void)setRadian:(CGFloat)radian{
    _radian = radian;
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = radian;
}

@end
