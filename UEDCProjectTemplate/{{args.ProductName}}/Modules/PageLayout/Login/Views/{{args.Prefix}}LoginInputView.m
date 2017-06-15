//
//  {{args.Prefix}}LoginInputView.m
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 15/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "{{args.Prefix}}LoginInputView.h"
#import "UIView+{{args.Prefix}}Line.h"
#import "UIView+Frame.h"

@interface {{args.Prefix}}LoginInputView ()

@end

@implementation {{args.Prefix}}LoginInputView

#pragma mark - Life cycle.

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [self initWithPlaceholder:nil]) {
        
    }
    
    return self;
}

- (instancetype)initWithPlaceholder:(NSString *)placeholder {
    if (self = [super initWithFrame:CGRectZero]) {
        _placeholder = placeholder;
        [self loadSubviews];
    }
    
    return self;
}


#pragma mark - Load views.

- (void)loadSubviews {
    self.layer.cornerRadius = kCornerRadiusSize;
    self.backgroundColor = [UIColor colorWithRGBValue:kDefaultInputViewBackgroundColor];
    
    // 创建文本输入框
    _inputTextField = [[UITextField alloc] init];
    _inputTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _inputTextField.textAlignment = NSTextAlignmentLeft;
    _inputTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [self addSubview:_inputTextField];
    
    // 设置 placeholder 的显示样式
    NSMutableAttributedString *attributedPlaceholder = [[NSMutableAttributedString alloc] initWithString:_placeholder];
    NSMutableParagraphStyle *style = [_inputTextField.defaultTextAttributes[NSParagraphStyleAttributeName] mutableCopy];
    style.minimumLineHeight = _inputTextField.font.lineHeight - (_inputTextField.font.lineHeight - [UIFont systemFontOfSize:14.0].lineHeight) / 2.0;
    [attributedPlaceholder addAttribute:NSForegroundColorAttributeName
                                  value:[UIColor colorWithRGBValue:kPlaceholderTextColor]
                                  range:NSMakeRange(0, _placeholder.length)];
    [attributedPlaceholder addAttribute:NSFontAttributeName
                                  value:[UIFont systemFontOfSize:kPlaceholderFontSize]
                                  range:NSMakeRange(0, _placeholder.length)];
    [attributedPlaceholder addAttribute:NSParagraphStyleAttributeName
                                  value:style
                                  range:NSMakeRange(0, _placeholder.length)];
    _inputTextField.attributedPlaceholder = attributedPlaceholder;
}


#pragma mark - Layout.

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _inputTextField.width = self.width - kLeftMargin;
    _inputTextField.height = self.height;
    _inputTextField.x = kLeftMargin;
    _inputTextField.middleY = self.height / 2;
}


#pragma mark - Setter & Getter.

- (void)setPlaceholder:(NSString *)placeholder {
    if ([_placeholder isEqualToString:placeholder]) {
        return;
    }
    
    _placeholder = placeholder;
    [self setNeedsLayout];
}

- (NSString *)text {
    return _inputTextField.text;
}

@end
