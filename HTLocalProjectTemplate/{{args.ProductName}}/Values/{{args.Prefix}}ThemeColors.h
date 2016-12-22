//
//  {{args.Prefix}}ThemeColors.h
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 05/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 对全局业务无关的颜色进行管理，方便随时修改以及查找。
 也可以采用其他样式管理机制。
 
 @note 这里给出的参数只是与模板中默认提供的示例有关的参数，模板的使用者可根据视觉以及代码实现进行删除、添加和修改。
 */
@interface {{args.Prefix}}ThemeColors : NSObject

/* ********************* 主题背景色(通常由视觉统一规范规定)相关, 可根据所需自由添加 *************************/

/// 主题色，每个 App 都会有主题色(当然有些可换肤)
+ (UIColor *)themeColor;

/// 1 像素线的颜色
+ (UIColor *)themeLineColor;

/// 按钮的背景色
+ (UIColor *)themeButtonColor;

/// 按钮高亮时的背景色
+ (UIColor *)themeHighlightButtonColor;

/// 默认背景色，如 controller 的 view 背景色
+ (UIColor *)themeBackgroundColor;


/* ********************* 主题字体颜色(通常由视觉统一规范规定)相关，可根据所需自由添加 ************************/

/// 默认字体颜色
+ (UIColor *)defaultTextColor;

/// 输入框的提示字体颜色
+ (UIColor *)placeholderTextColor;

@end
