//
//  {{args.Prefix}}LoginInputView.h
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 15/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>

@class {{args.Prefix}}LoginInputViewModel;

/**
 登录页面、注册页面、找回密码页面使用到的输入框
 */
@interface {{args.Prefix}}LoginInputView : UIView

@property (nonatomic, strong) {{args.Prefix}}LoginInputViewModel *viewModel;

/// 带有 placeholder 且只支持单行输入的文本输入框
@property (nonatomic, strong) UITextField *inputTextField;
/// inputTextField 的文本内容
@property (nonatomic, copy) NSString *text;

@end
