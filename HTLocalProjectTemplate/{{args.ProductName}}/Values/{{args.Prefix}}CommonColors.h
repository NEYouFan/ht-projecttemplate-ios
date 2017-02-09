//
//  {{args.Prefix}}CommonColors.h
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

/* ********************* 默认背景色(通常由视觉统一规范规定)相关, 可根据所需自由添加 *************************/

/// 默认颜色，基本每个 App 都会以一个颜色为主题
extern const int kDefaultColor;
/// 1 像素线的颜色
extern const int kDefaultLineColor;
/// 按钮的背景色
extern const int kDefaultButtonColor;
/// 按钮高亮时的背景色
extern const int kDefaultButtonHighlightColor;
/// 默认背景色，如 controller 的 view 背景色
extern const int kDefaultBackgroundColor;

/* ********************* 默认字体颜色(通常由视觉统一规范规定)相关，可根据所需自由添加 ************************/

/// 默认字体颜色
extern const int kDefaultTextColor;
/// 浅色字体颜色
extern const int kLightTextColor;
/// 输入框的提示字体颜色
extern const int kPlaceholderTextColor;

/* ********************* 导航栏样式，可根据所需自由添加 ************************/

/// 导航栏背景色
extern const int kNaviBackgroundColor;
/// 导航栏字体颜色
extern const int kNaviForegroundColor;

/* ********************* tabbar样式，可根据所需自由添加 ************************/

extern const int kTabBarBadgebackgroundColor;

/* ********************* 下拉刷新，加载更多相关的颜色 *************************/

/// 下拉刷新、加载更多视图的背景色
extern const int kRefreshBackgroundColor;

/* ************** 加载出错、网络错误、数据为空，正在加载相关的颜色 ***************/

/// 加载出错、正在加载、网络错误、数据为空页面的默认背景色。
extern const int kLoadingBackgroundColor;



