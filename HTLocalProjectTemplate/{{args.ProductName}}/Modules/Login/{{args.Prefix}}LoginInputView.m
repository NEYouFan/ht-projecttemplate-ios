//
//  {{args.Prefix}}LoginInputView.m
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 15/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "{{args.Prefix}}LoginInputView.h"
#import "UIView+{{args.Prefix}}Line.h"
#import "UIView+Frame.h"
#import "{{args.Prefix}}LoginSizes.h"
#import "{{args.Prefix}}LoginInputViewModel.h"

@interface {{args.Prefix}}LoginInputView ()

/// 输入框起始处的图标
@property (nonatomic, strong) UIImageView *iconImageView;

@end

@implementation {{args.Prefix}}LoginInputView

#pragma mark - Life cycle.

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self loadSubviews];
    }
    
    return self;
}


#pragma mark - Load views.

- (void)loadSubviews {
    [self {{args.CategoryPrefix}}_addHorizontalBottomLineWithLeftMargin:0 rightMargin:0];
    
    // 创建文本输入框
    _inputTextField = [[UITextField alloc] init];
    _inputTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self addSubview:_inputTextField];
    
    // 创建起始处图标
    _iconImageView = [[UIImageView alloc] init];
    [self addSubview:_iconImageView];
}


#pragma mark - Layout.

- (void)layoutSubviews {
    [super layoutSubviews];
    
    // 布局可根据产品具体视觉进行调整
    [_iconImageView sizeToFit];
    _iconImageView.middleY = self.height / 2;
    _iconImageView.x = 0;
    
    _inputTextField.width = self.width - _iconImageView.width - [{{args.Prefix}}LoginSizes iconTextFieldGap];
    _inputTextField.height = self.height;
    _inputTextField.x = _iconImageView.tail + [{{args.Prefix}}LoginSizes iconTextFieldGap];
    _inputTextField.middleY = self.height / 2;
}


#pragma mark - Setter & Getter.

- (void)setViewModel:({{args.Prefix}}LoginInputViewModel *)viewModel {
    if (_viewModel == viewModel) {
        return;
    }
    
    _viewModel = viewModel;
    
    // 设置 placeholder 的显示样式
    NSMutableAttributedString *attributedPlaceholder = [[NSMutableAttributedString alloc] initWithString:_viewModel.placeholder];
    [attributedPlaceholder addAttribute:NSForegroundColorAttributeName
                                  value:[{{args.Prefix}}ThemeColors placeholderTextColor]
                                  range:NSMakeRange(0, _viewModel.placeholder.length)];
    [attributedPlaceholder addAttribute:NSFontAttributeName
                                  value:[{{args.Prefix}}ThemeSizes placeholderFont]
                                  range:NSMakeRange(0, _viewModel.placeholder.length)];
    _inputTextField.attributedPlaceholder = attributedPlaceholder;
    
    _iconImageView.image = _viewModel.iconImage;
    
    [self setNeedsLayout];
}

- (NSString *)text {
    return _inputTextField.text;
}

@end
