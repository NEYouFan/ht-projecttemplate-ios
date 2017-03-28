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

/// 用户名、密码输入框的起始图标与文本输入框之间的间隔，参考登录页面即可理解。
static const CGFloat kIconTextFieldGap = 8;

@interface {{args.Prefix}}LoginInputView ()

/// 输入框起始处的图标
@property (nonatomic, strong) UIImageView *iconImageView;

@end

@implementation {{args.Prefix}}LoginInputView

#pragma mark - Life cycle.

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [self initWithImageName:nil placeholder:nil]) {
        
    }
    
    return self;
}

- (instancetype)initWithImageName:(NSString *)imageName placeholder:(NSString *)placeholder {
    if (self = [super initWithFrame:CGRectZero]) {
        _placeholder = placeholder;
        _iconImageName = imageName;
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
    
    // 设置 placeholder 的显示样式
    NSMutableAttributedString *attributedPlaceholder = [[NSMutableAttributedString alloc] initWithString:_placeholder];
    [attributedPlaceholder addAttribute:NSForegroundColorAttributeName
                                  value:[UIColor colorWithRGBValue:kPlaceholderTextColor]
                                  range:NSMakeRange(0, _placeholder.length)];
    [attributedPlaceholder addAttribute:NSFontAttributeName
                                  value:[UIFont systemFontOfSize:kPlaceholderFontSize]
                                  range:NSMakeRange(0, _placeholder.length)];
    _inputTextField.attributedPlaceholder = attributedPlaceholder;
    
    _iconImageView.image = [UIImage imageNamed:_iconImageName];
}


#pragma mark - Layout.

- (void)layoutSubviews {
    [super layoutSubviews];
    
    // 布局可根据产品具体视觉进行调整
    [_iconImageView sizeToFit];
    _iconImageView.middleY = self.height / 2;
    _iconImageView.x = 0;
    
    _inputTextField.width = self.width - _iconImageView.width - kIconTextFieldGap;
    _inputTextField.height = self.height;
    _inputTextField.x = _iconImageView.tail + kIconTextFieldGap;
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

- (void)setIconImageName:(NSString *)imageName {
    if ([_iconImageName isEqualToString:imageName]) {
        return;
    }
    
    _iconImageName = imageName;
    [self setNeedsLayout];
}

- (NSString *)text {
    return _inputTextField.text;
}

@end
