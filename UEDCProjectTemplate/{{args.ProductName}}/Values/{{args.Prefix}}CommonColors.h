//
//  {{args.Prefix}}CommonColors.h
//  {{args.Prefix}}
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
/// 默认背景色，如 controller 的 view 背景色
extern const int kDefaultBackgroundColor;
/// 默认Cell被选中情况的背景色
extern const int kDefaultCellSelectedColor;
/// 默认的输入框背景色
extern const int kDefaultInputViewBackgroundColor;
/// 默认ActionSheet背景色
extern const int kDefaultActionColor;
/// UISwitch选中时的背景色
extern const int kSwitchOnTintColor;


/* ********************* 默认字体颜色(通常由视觉统一规范规定)相关，可根据所需自由添加 ************************/

/// 默认字体颜色
extern const int kDefaultTextColor;
/// 浅色字体颜色
extern const int kLightTextColor;
/// 输入框的提示字体颜色
extern const int kPlaceholderTextColor;
/// 黑底白色字体的颜色
extern const int kWhitheTextColor;
/// 一级标题字体颜色
extern const int kFisrtClassTitleTextColor;
/// 二级标题字体颜色
extern const int kSecondClassTitleTextColor;
/// 正文字体颜色
extern const int kContentTextColor;
/// 注释字体颜色
extern const int kCommitTextColor;
/// 链接字体颜色
extern const int kLinkTextColor;
/// 警告字体颜色
extern const int kWarningTextColor;
/// 进步器的文本颜色
extern const int kStepperTextColor;

/* ********************* button样式，可根据所需自由添加 ***********************/

/// 按钮的背景色
extern const int kDefaultButtonColor;
extern const int kDefaultButtonBackgroundColor;
/// 按钮高亮时的背景色
extern const int kDefaultButtonHighlightColor;
/// 白色按钮的颜色
extern const int kWhiteButtonColor;
/// Switch按钮的颜色
extern const int kDefaultSwitchHighlightColor;
/// Slider按钮的颜色
extern const int kDefaultSliderKMaxColor;

/* ********************* border样式，可根据所需自由添加 ***********************/
/// 文本框边框颜色
extern const int kTextBorderColor;
/// 进步器边框颜色
extern const int kStepperBorderColor;

/* ********************* progress样式，可根据所需自由添加 ***********************/
/// 进度条背景颜色
extern const int kProgressOuterColor;
//／ 进度条颜色
extern const int kProgressInnerColor;
/// Web进度条颜色
extern const int kwebProgressInnerColor;

/* ********************* 导航栏样式，可根据所需自由添加 ************************/

/// 导航栏背景色
extern const int kNaviBackgroundColor;
/// 导航栏字体颜色
extern const int kNaviForegroundColor;
/// 导航栏字体点击后高亮的颜色
extern const int kNaviForegroundHighlightedColor;
/// 透明导航栏字体颜色
extern const int kNaviTransparentForgroundColor;


/* ********************* tabbar样式，可根据所需自由添加 ************************/

extern const int kTabBarBadgebackgroundColor;
extern const int kTabBarbackgroundColor;

/* ********************* alertView样式，可根据所需自由添加 **********************/

extern const int kAlertViewTitleTextColor;
extern const int KAlertViewContentColor;
extern const int kAlertViewButtonTextColor;
extern const int kAlertInputTextFeildBackgroundColor;

/* ********************* 下拉刷新，加载更多相关的颜色 *************************/

/// 下拉刷新、加载更多视图的背景色
extern const int kRefreshBackgroundColor;

/* ********************* pageControllerView相关的颜色 *************************/

/// pageControllerView字体色
extern const int kpageControllerTextColor;
/// pageControllerView字体选中色
extern const int kpageControllerSelectedTextColor;
/// pageControllerView背景色
extern const int kpageControllerBackgroundColor;
/// pageControllerView选中区域背景色
extern const int kpageControllerSelectedBackgroundColor;
/// pageControllerView 下划线颜色
extern const int kpageControllerSublineColor;
/// 导航栏字体色
extern const int kNaviSegmentsTextColor;
/// 导航栏选中字体色
extern const int kNaviSegmentsSelectedTextColor;

/* ********************* 通知样式相关的颜色 *************************/

/// 条幅式通知背景色
extern const int kNotificationScrollBackgroundColor;
/// 条幅式通知字体颜色
extern const int kNotificationScrollTextColor;


/* ************** 加载出错、网络错误、数据为空，正在加载相关的颜色 ***************/

/// 加载出错、正在加载、网络错误、数据为空页面的默认背景色。
extern const int kLoadingBackgroundColor;
extern const int kLoadingEmptyTextColor;



