//
//  ___VARIABLE_Prefix:identifier___LoginInputView.h
//  ___VARIABLE_Prefix:identifier___
//
//  Created by tao on 15/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 登录页面、注册页面、找回密码页面使用到的输入框
 */
@interface ___VARIABLE_Prefix:identifier___LoginInputView : UIView

/// 带有 placeholder 且只支持单行输入的文本输入框
@property (nonatomic, strong) UITextField *inputTextField;
/// inputTextField 的文本内容
@property (nonatomic, copy) NSString *text;
/// 输入框的背景提示文字
@property (nonatomic, copy) NSString *placeholder;

/**
 新建一个输入框
 
 @param placeholder 输入框的背景提示文字
 @return 用于登录页面、注册页面及找回密码页面的输入框
 */
- (instancetype)initWithPlaceholder:(NSString *)placeholder;

@end
