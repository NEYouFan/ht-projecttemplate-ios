//
//  {{args.Prefix}}LoginSizes.h
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 07/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 管理与登录页面有关的字体样式，以及排版布局参数。
 
 @note 这里给出的参数只是与模板中默认提供的示例有关的参数，模板的使用者可根据视觉以及代码实现进行删除、添加和修改。
 */
@interface {{args.Prefix}}LoginSizes : NSObject

/// 用户名、密码输入框的起始图标与文本输入框之间的间隔，参考登录页面即可理解。
+ (CGFloat)iconTextFieldGap;

/// 用户名输入框距离屏幕顶部的距离
+ (CGFloat)userNameInputViewTopMargin;

/// 输入框左右距离屏幕边缘的距离
+ (CGFloat)inputViewSideMargin;

/// 输入框的高度
+ (CGFloat)inputViewHeight;

/// 登录按钮的高度
+ (CGFloat)loginButtonHeight;

/// 忘记密码按钮的高度
+ (CGFloat)forgetPasswordButtonHeight;

/// 密码输入框顶部与用户名输入框底部的距离
+ (CGFloat)passwordUserNameGap;

/// 登录按钮顶部距离密码输入框底部的距离
+ (CGFloat)loginPasswordGap;

/// 忘记密码按钮顶部与登录按钮底部的距离
+ (CGFloat)forgetLoginGap;

/// 注册按钮顶部与登录按钮底部的距离
+ (CGFloat)registerLoginGap;

@end
