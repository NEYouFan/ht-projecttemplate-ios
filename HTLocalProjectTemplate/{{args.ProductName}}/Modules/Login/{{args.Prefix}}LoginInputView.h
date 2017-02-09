//
//  {{args.Prefix}}LoginInputView.h
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 15/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 登录页面、注册页面、找回密码页面使用到的输入框
 */
@interface {{args.Prefix}}LoginInputView : UIView

/// 带有 placeholder 且只支持单行输入的文本输入框
@property (nonatomic, strong) UITextField *inputTextField;
/// inputTextField 的文本内容
@property (nonatomic, copy) NSString *text;
/// 输入框起始处的 icon
@property (nonatomic, copy) NSString *iconImageName;
/// 输入框的背景提示文字
@property (nonatomic, copy) NSString *placeholder;

/**
 新建一个输入框
 
 @param imageName 输入框起始处 icon
 @param placeholder 输入框的背景提示文字
 @return 用于登录页面、注册页面及找回密码页面的输入框
 */
- (instancetype)initWithImageName:(NSString *)imageName placeholder:(NSString *)placeholder;

@end
