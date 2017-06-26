//
//  ___VARIABLE_Prefix:identifier___AssetPickerUnorderCell.m
//  ___VARIABLE_Prefix:identifier___
//
//  Created by 陶泽宇 on 2017/5/24.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "___VARIABLE_Prefix:identifier___AssetPickerUnorderCell.h"
#import "HTCameraAssetItem.h"

@interface ___VARIABLE_Prefix:identifier___AssetPickerUnorderCell () <HTAssetPickerCellDelegate>
{
    
    UIButton* _selectButton;
}
@end


@implementation ___VARIABLE_Prefix:identifier___AssetPickerUnorderCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
        CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
        CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
        UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
        self.backgroundColor = color;
        self.delegate = self;
        _selectButton = [[UIButton alloc]init];
        [_selectButton setImage:[UIImage imageNamed:@"imagePicker_unselected"] forState:UIControlStateNormal];
        [_selectButton setImage:[UIImage imageNamed:@"imagePicker_selected"] forState:UIControlStateSelected];
        _selectButton.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
        _selectButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        [_selectButton addTarget:self action:@selector(selectButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_selectButton];
    }
    return self;
}
- (void)selectedWithIndex:(NSInteger)index
{
    _selectButton.selected = YES;
}
- (void)deselected
{
    _selectButton.selected = NO;
}


- (void)reset
{
    [super reset];
    _selectButton.selected = NO;
    _selectButton.hidden = NO;
}

- (void)setAssetItem:(HTAssetItem *)assetItem{
    [super setAssetItem:assetItem];
    if ([assetItem isKindOfClass:[HTCameraAssetItem class]]) {
        _selectButton.hidden = YES;
    }
}


- (void)onInteracted:(HTAssetPickerCellInteactType)interactType
{
    
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _selectButton.frame = CGRectMake(self.bounds.size.width - 24 - 6, 6, 24, 24);
    _selectButton.center = CGPointMake(self.bounds.size.width - 12 - 5, 12 + 5);
}

- (void)selectButtonClicked:(id)sender
{
    if (self.assetItem.selected) {
        [self tryDeselect];
    }else{
        if ([self trySelect]) {
            _selectButton.selected = YES;
            _selectButton.alpha = 0;
            
            CGAffineTransform transform = _selectButton.transform;
            _selectButton.transform = CGAffineTransformScale(transform, 0, 0);
            [UIView animateWithDuration:0.2 animations:^{
                _selectButton.transform = CGAffineTransformScale(transform, 1.2, 1.2);
                _selectButton.alpha = 1;
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.1 animations:^{
                    _selectButton.transform = CGAffineTransformScale(transform, 0.9, 0.9);;
                } completion:^(BOOL finished) {
                    [UIView animateWithDuration:0.1 animations:^{
                        _selectButton.transform = CGAffineTransformIdentity;
                    }];
                }];
            }];
        }
    }
}


@end
