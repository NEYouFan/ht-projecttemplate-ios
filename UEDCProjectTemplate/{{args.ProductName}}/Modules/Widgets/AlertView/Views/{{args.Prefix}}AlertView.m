//
//  {{args.Prefix}}AlertView.m
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 2017/5/4.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}AlertView.h"
#import "UIView+{{args.Prefix}}Line.h"
#import "UIView+Frame.h"

const CGFloat animateTime  = 0.35f;
const CGFloat buttonHeight = 45;

@interface {{args.Prefix}}AlertView ()<UITextFieldDelegate>

@property (nonatomic, copy) InputTextBlock inputblock;
@property (nonatomic, copy) ClickBlock clickblock;
@property (nonatomic, strong) UIView * maskBackgroundView;
@property (nonatomic, strong) UIView * operateView; //操作视图
@property (nonatomic, strong) UITextField * inputTextField;  //输入框
@property (nonatomic, assign) BOOL notifiKeyboardHide;

@end

@implementation {{args.Prefix}}AlertView

+ (instancetype)sharedInstance{
    static {{args.Prefix}}AlertView *_alertView = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_alertView == nil) {
            _alertView = [[{{args.Prefix}}AlertView alloc] init];
        }
    });
    return _alertView;
}

/**
 自定义alertView，并且显示到屏幕的正中央
 
 @param view 自定义的alertView的上方的View
 @param buttonTitles alertView下方button的title数组，传入几个title，代表有几个button
 @param block 点击button之后的回调，通过buttonIndex来判断是点击了哪个button
 */
- (void)alertWithCustomView:(UIView *)view
               buttonTitles:(NSArray <NSString *> *)buttonTitles
                   andBlock:(ClickBlock)block{
    /**
     *  背景视图
     */
    _maskBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    _maskBackgroundView.backgroundColor = self.maskBackgroundColor;
    [[UIApplication sharedApplication].keyWindow addSubview:_maskBackgroundView];
    _maskBackgroundView.alpha = 0;
    [UIView animateWithDuration:animateTime animations:^{
        _maskBackgroundView.alpha = 1;
    }];
    
    /**
     *  操作区背景
     */
    _operateView = [[UIView alloc] init];
    _operateView.center = CGPointMake(SCREEN_WIDTH/2., SCREEN_HEIGHT/2.);
    _operateView.bounds = CGRectMake(0, 0, alertViewWidth, view.height + buttonHeight);
    _operateView.backgroundColor = self.alertBackgroundColor;
    _operateView.layer.cornerRadius = 4;
    _operateView.clipsToBounds = YES;
    [_operateView addSubview:view];
    [_maskBackgroundView addSubview:_operateView];
    [self shakeToShow:_operateView];
    
    /**
     *  按钮
     */
    NSUInteger numberOfBtns = [buttonTitles count];
    for (int i = 0; i < numberOfBtns; i ++) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        CGFloat width = (alertViewWidth)/numberOfBtns;
        button.x = width * i;
        button.y = view.height;
        button.height = buttonHeight;
        button.width = width;
        [button {{args.CategoryPrefix}}_addHorizontalTopLineWithLeftMargin:0 rightMargin:0];
        if ( i != numberOfBtns -1) {
            [button {{args.CategoryPrefix}}_addVerticalTailLineWithTopMargin:0 bottomMargin:0];
        }
        [button setTitleColor:self.buttonTitleColor forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithRGBValue:kDefaultButtonHighlightColor] forState:UIControlStateHighlighted];

        [button setTitle:buttonTitles[i] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:kAlertViewButtonTitleFontSize];
        button.tag = i;
        [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [_operateView addSubview:button];
    }
    
    /**
     *  button点击回调
     */
    self.clickblock = block;
    
}

/**
 展示没有title 仅有content的最基本的alertView
 
 @param content  alertView中部的内容
 @param buttonTitles alertView下方button的title数组，传入几个title，代表有几个button
 @param block 点击button之后的回调，通过buttonIndex来判断是点击了哪个button
 */
- (void)alertWithContent:(NSString *)content
            buttonTitles:(NSArray <NSString *> *)buttonTitles
                andBlock:(ClickBlock)block{
    UIView *view = [[UIView alloc] init];
    view.width = alertViewWidth;
    
    UILabel *contentLabel = [[UILabel alloc] init];
    contentLabel.text = content;
    contentLabel.numberOfLines = 0;
    contentLabel.font = [UIFont systemFontOfSize:kAlertViewContentFontSize];
    contentLabel.textColor = [UIColor colorWithRGBValue:KAlertViewContentColor];
    contentLabel.textAlignment = NSTextAlignmentCenter;
    contentLabel.x = 24;
    contentLabel.width = alertViewWidth - 48;
    contentLabel.y = 20;
    [contentLabel sizeToFit];
    [view addSubview:contentLabel];
    
    view.height = 20 + contentLabel.height + 20.5;
    [self alertWithCustomView:view buttonTitles:buttonTitles andBlock:block];

}

/**
 展示有title 有content的最基本的alertView
 
 @param title alertView最上方的title
 @param content  alertView中部的内容
 @param buttonTitles alertView下方button的title数组，传入几个title，代表有几个button
 @param block 点击button之后的回调，通过buttonIndex来判断是点击了哪个button
 */
- (void)alertWithTitle:(NSString *)title
               content:(NSString *)content
          buttonTitles:(NSArray <NSString *> *)buttonTitles
              andBlock:(ClickBlock)block{
    UIView *view = [[UIView alloc] init];
    view.width = alertViewWidth;
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = title;
    titleLabel.font = [UIFont systemFontOfSize:kAlertViewTitleFontSize];
    titleLabel.textColor = [UIColor colorWithRGBValue:kAlertViewTitleTextColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [titleLabel sizeToFit];
    titleLabel.height = 25;
    titleLabel.x = 25;
    titleLabel.width = alertViewWidth - 50;
    titleLabel.middleY = 23.5 + titleLabel.height/2;
    [view addSubview:titleLabel];
    
    UILabel *contentLabel = [[UILabel alloc] init];
    contentLabel.text = content;
    contentLabel.numberOfLines = 0;
    contentLabel.font = [UIFont systemFontOfSize:kAlertViewContentFontSize];
    contentLabel.textColor = [UIColor colorWithRGBValue:KAlertViewContentColor];
    contentLabel.textAlignment = NSTextAlignmentLeft;
    contentLabel.x = 25;
    contentLabel.width = alertViewWidth - 50;
    contentLabel.y = titleLabel.bottom + 17;
    [contentLabel sizeToFit];
    [view addSubview:contentLabel];
    
    view.height = 23.5 + titleLabel.height + 17 + contentLabel.height + 20.5;
    [self alertWithCustomView:view buttonTitles:buttonTitles andBlock:block];
}

/**
 展示顶部中央为一个图标，中间为content文字样式的alertView
 
 @param image 图标image
 @param content content文字内容
 @param buttonTitles alertView下方button的title数组，传入几个title，代表有几个button
 @param block 点击button之后的回调，通过buttonIndex来判断是点击了哪个button
 */
- (void)alertWithIconImage:(UIImage *)image
                   content:(NSString *)content
              buttonTitles:(NSArray <NSString *> *)buttonTitles
                  andBlock:(ClickBlock)block{
    UIView *view = [[UIView alloc] init];
    view.width = alertViewWidth;
    
    UIImageView *iconView = [[UIImageView alloc] init];
    iconView.image = image;
    iconView.width = 45;
    iconView.height = 45;
    [iconView sizeToFit];
    iconView.middleX = view.width/2.f;
    iconView.y = 24.5;
    [view addSubview:iconView];
    
    UILabel *contentLabel = [[UILabel alloc] init];
    contentLabel.text = content;
    contentLabel.numberOfLines = 0;
    contentLabel.font = [UIFont systemFontOfSize:kAlertViewContentFontSize];
    contentLabel.textColor = [UIColor colorWithRGBValue:KAlertViewContentColor];
    contentLabel.textAlignment = NSTextAlignmentCenter;
    contentLabel.width = alertViewWidth - 50;
    [contentLabel sizeToFit];
    contentLabel.middleX = view.width/2.f;
    contentLabel.y = iconView.bottom + 18;
    [view addSubview:contentLabel];
    
    view.height = 24.5 + iconView.height + 18 + contentLabel.height + 21;
    [self alertWithCustomView:view buttonTitles:buttonTitles andBlock:block];
}

/**
 展示中间是一个输入框形式的alertView
 
 @param title alertView的title
 @param placeholderText alertView 输入框 placeholder的内容
 @param buttonTitles alertView下方button的title数组，传入几个title，代表有几个button
 @param block 点击button之后的回调，通过buttonIndex来判断是点击了哪个button，inputText来获取输入的字符串
 */
- (void)alertWithInputTitle:(NSString *)title
            placeholderText:(NSString *)placeholderText
               buttonTitles:(NSArray <NSString *> *)buttonTitles
              andInputBlock:(InputTextBlock)block{
    _notifiKeyboardHide = NO;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    /**
     *  背景视图
     */
    _maskBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    _maskBackgroundView.backgroundColor = self.maskBackgroundColor;
    [[UIApplication sharedApplication].keyWindow addSubview:_maskBackgroundView];
    _maskBackgroundView.alpha = 0;
    [UIView animateWithDuration:animateTime animations:^{
        _maskBackgroundView.alpha = 1;
    }];
    
    /**
     *  alertView 除去button之外的View
     */
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(0, 0, alertViewWidth, 130);
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = title;
    titleLabel.font = [UIFont boldSystemFontOfSize:kAlertViewTitleFontSize];
    titleLabel.textColor = [UIColor colorWithRGBValue:kAlertViewTitleTextColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [titleLabel sizeToFit];
    titleLabel.height = 25;
    titleLabel.x = 25;
    titleLabel.width = alertViewWidth - 50;
    titleLabel.middleY = 23.5 + titleLabel.height/2;
    [view addSubview:titleLabel];
    
    /**
     *  输入框
     */
    
    UIView *textFieldView = [[UIView alloc] initWithFrame:CGRectMake(25, 58.5, alertViewWidth - 50, 46)];
    textFieldView.layer.cornerRadius = 4.f;
    textFieldView.backgroundColor = [UIColor colorWithRGBValue:kAlertInputTextFeildBackgroundColor];
    
    _inputTextField = [[UITextField alloc] initWithFrame:CGRectMake(15, 0, textFieldView.width - 20, textFieldView.height)];
    _inputTextField.delegate = self;
    _inputTextField.keyboardType = UIKeyboardTypeDefault;
    _inputTextField.returnKeyType = UIReturnKeyDone;
    _inputTextField.font = [UIFont systemFontOfSize:18];
    _inputTextField.backgroundColor = [UIColor colorWithRGBValue:kAlertInputTextFeildBackgroundColor];
    _inputTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:placeholderText
                                                                            attributes:@{NSForegroundColorAttributeName: [UIColor colorWithRGBValue:kPlaceholderTextColor], NSFontAttributeName:[UIFont systemFontOfSize:18]}];
    _inputTextField.textColor = [UIColor colorWithRGBValue:kPlaceholderTextColor];
    _inputTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [textFieldView addSubview:_inputTextField];
    [view addSubview:textFieldView];
    
    /**
     *  操作区背景
     */
    _operateView = [[UIView alloc] init];
    _operateView.center = CGPointMake(SCREEN_WIDTH/2., SCREEN_HEIGHT/2.);
    _operateView.bounds = CGRectMake(0, 0, alertViewWidth, view.height + buttonHeight);
    _operateView.backgroundColor = self.alertBackgroundColor;
    _operateView.layer.cornerRadius = 4;
    _operateView.clipsToBounds = YES;
    [_operateView addSubview:view];
    [_maskBackgroundView addSubview:_operateView];
    [self shakeToShow:_operateView];
    
    /**
     *  按钮
     */
    NSUInteger numberOfBtns = [buttonTitles count];
    for (int i = 0; i < numberOfBtns; i ++) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        CGFloat width = (alertViewWidth)/numberOfBtns;
        button.x = width * i;
        button.y = view.height;
        button.height = buttonHeight;
        button.width = width;
        [button {{args.CategoryPrefix}}_addHorizontalTopLineWithLeftMargin:0 rightMargin:0];
        if ( i != numberOfBtns -1) {
            [button {{args.CategoryPrefix}}_addVerticalTailLineWithTopMargin:0 bottomMargin:0];
        }
        [button setTitleColor:self.buttonTitleColor forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithRGBValue:kDefaultButtonHighlightColor] forState:UIControlStateHighlighted];
        
        [button setTitle:buttonTitles[i] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:kAlertViewButtonTitleFontSize];
        button.tag = i;
        [button addTarget:self action:@selector(inputButton:) forControlEvents:UIControlEventTouchUpInside];
        [_operateView addSubview:button];
    }
    
    /**
     *  button点击回调
     */
    self.inputblock = block;
}

#pragma mark - 移除视图
- (void)removeAlertView
{
    if ([_inputTextField isFirstResponder]) {
        [_inputTextField resignFirstResponder];
    }
    [UIView animateWithDuration:animateTime animations:^{
        _maskBackgroundView.alpha = 0;
    } completion:^(BOOL finished) {
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
        if (_notifiKeyboardHide) {
            [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
        }
        [self.maskBackgroundView removeFromSuperview];
        self.maskBackgroundView = nil;
        self.operateView = nil;
    }];
}

#pragma mark - 弹性震颤动画
- (void)shakeToShow:(UIView *)aView
{
    CAKeyframeAnimation * popAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    popAnimation.duration = animateTime;
    popAnimation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.01f, 0.01f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.05f, 1.05f, 1.0f)],
                            //                            [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9f, 0.9f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DIdentity]];
    popAnimation.keyTimes = @[@0.0f, @0.5f, /*@0.75f,*/ @0.8f];
    popAnimation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                     //                                    [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [aView.layer addAnimation:popAnimation forKey:nil];
}

#pragma mark - 监听键盘弹起，操作框动画
///键盘弹起，页面动画，监听
- (void)keyboardWillShow:(NSNotification *)notification
{
    // 键盘的frame
    CGRect keyboardRect = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat keyboardHeight = keyboardRect.size.height;
    
    CGFloat keyboardOriginY = SCREEN_HEIGHT - keyboardHeight;
    CGFloat operateMaxY = SCREEN_HEIGHT/2. + _operateView.bounds.size.height/2. + 16;
    
    if (operateMaxY >= keyboardOriginY) {
        [UIView animateWithDuration:0.25 animations:^{
            CGRect rect = _operateView.frame;
            rect.origin.y = keyboardOriginY - rect.size.height - 16;
            _operateView.frame = rect;
        } completion:^(BOOL finished) {
            
        }];
        _notifiKeyboardHide = YES;
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(keyboardWillHide:)
                                                     name:UIKeyboardWillHideNotification
                                                   object:nil];
    }
    else {
        _notifiKeyboardHide = NO;
    }
}
///键盘收起，页面动画，监听
- (void)keyboardWillHide:(NSNotification *)notification
{
    [UIView animateWithDuration:0.25 animations:^{
        CGRect rect = _operateView.frame;
        rect.origin.y = (SCREEN_HEIGHT - rect.size.height)/2.;
        _operateView.frame = rect;
    } completion:^(BOOL finished) {
        
    }];
}

#pragma mark - 输入框代理
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}


#pragma mark --- button action ---

- (void)clickButton:(UIButton *)button{
    if(self.clickblock){
        self.clickblock(button.tag);
        self.clickblock = nil;
    }
    [self removeAlertView];
}

- (void)inputButton:(UIButton *)button{
    if(self.inputblock){
        self.inputblock(button.tag, self.inputTextField.text);
        self.inputblock = nil;
    }
    [self removeAlertView];
}

@end
