//
//  {{args.Prefix}}LoginInputViewModel.h
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 15/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 登录页面输入用户名和密码的输入框View的 viewModel
 
 @note 如果产品对输入框有更多的需求，可自己在该类中添加适当属性来适应输入框的变化。
 */
@interface {{args.Prefix}}LoginInputViewModel : NSObject

/**
 输入框起始处的 icon
 */
@property (nonatomic, copy) UIImage *iconImage;

/**
 输入框的背景提示文字
 */
@property (nonatomic, copy) NSString *placeholder;

/**
 新建一个输入框

 @param imageName 输入框起始处 icon
 @param placeholder 输入框的背景提示文字
 @return 用于登录页面、注册页面及找回密码页面的输入框
 */
- (instancetype)initWithImageName:(NSString *)imageName placeholder:(NSString *)placeholder;

@end
