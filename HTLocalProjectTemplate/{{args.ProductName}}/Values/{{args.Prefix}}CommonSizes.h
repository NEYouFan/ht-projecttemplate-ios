//
//  {{args.Prefix}}CommonSizes.h
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 05/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 *************************************************************************
 对全局业务无关的字体和大小进行管理，方便随时修改以及查找。
 也可以采用其他样式管理机制。
 
 @note 这里给出的参数只是与模板中默认提供的示例有关的参数，模板的使用者可根据视觉以及代码实现进行删除、添加和修改。
 *************************************************************************
 */

/* ***************** 系统默认的一些配置，常用于计算布局使用。可根据所需自由添加 ***********/

/// 屏幕宽度
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
/// 屏幕高度
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
/// 屏幕大小
#define SCREEN_SIZE [UIScreen mainScreen].bounds.size
/// 导航栏高度(包含状态栏)
extern const CGFloat kNavigationHeight;
/// Tabbar 的高度
extern const CGFloat kTabHeight;
/// 导航栏高度（不包括状态栏）
extern const CGFloat kNavigationBarHeight;
/// 状态栏高度
extern const CGFloat kStatusBarHeight;

/* ************* 主题字体大小(通常由视觉统一规范规定)相关, 可根据所需自由添加 ***************/

/// 视觉统一规范中，默认的字体大小
extern const CGFloat kDefaultFontSize;
/// 标题的字体大小
extern const CGFloat kDefaultTitleFontSize;
/// 输入框的提示字体大小
extern const CGFloat kPlaceholderFontSize;

/* ************************ 全局性的边距等配置，可根据所需自由添加 ************************/

/// 1 pixel 线的宽度
#define LINE_WIDTH (1.0 / [UIScreen mainScreen].scale)
/// 视觉统一规范中，一些 icon、label 等视图与父容器的左边距
extern const CGFloat kLeftMargin;
/// 视觉统一规范中，一些 icon、label 等视图与父容器的右边距
extern const CGFloat kRightMargin;
/// 用于分页加载逻辑，初始加载的页面编号(服务器有时以 0 开始，有时以 1 开始，开发者需根据服务器需求修改该值)
extern const CGFloat kInitialPageNumber;
/// 用于分页加载逻辑，每次加载的 item 数量，可依据需求修改该值
extern const CGFloat kLoadmorePageSize;
/// 圆角大小
extern const CGFloat kCornerRadiusSize;
/// 有些 cell 之间有一些间隔，当不使用 section 时，可以使用在两个 cell 之间添加一个用于展示间隔的 cell
extern const CGFloat kTableViewCellGap;

/* ********************** 导航栏字体及布局等参数，可根据所需自由添加 ************************/

/// 导航栏字体样式
extern const CGFloat kNaviTitleFontSize;

/* ********************** tabBar 字体及布局等参数，可根据所需自由添加 ************************/

/// tabBar 字体样式
extern const CGFloat kTabBarTitleFontSize;
/// tab 文字 label 的边距
extern const CGFloat kTabTitleLabelSideEdge;
/// tab 文字 label 顶部与 icon 底部的距离
extern const CGFloat kTabTitleIconGap;
/// tab 图标顶部与 tab 视图顶部的距离
extern const CGFloat kTabIconTopMargin;
/// tab 视图的圆红点角标大小
extern const CGFloat kDotBadgeHeight;
extern const CGFloat kDotBadgeWidth;
/// tab 视图的圆红点角标顶部与 tab 视图顶部的距离
extern const CGFloat kDotBadgeTopMargin;
/// tab 视图的圆点角标右侧与 tab 视图右侧的距离
extern const CGFloat kDotBadgeRightMargin;
/// tab 视图的文字角标大小
extern const CGFloat kBadgeHeight;
extern const CGFloat kBadgeWidth;
/// tab 视图的文字角标右侧与 tab 视图右侧的距离
extern const CGFloat kBadgeRightMargin;
/// tab 视图的文字角标顶部与 tab 视图顶部的距离
extern const CGFloat kBadgeTopMargin;
/// tab 文字角标的字体大小
extern const CGFloat kBadgeTextFontSize;

/* ********************* 与下拉刷新，加载更多相关的字体和布局参数 *************************/

/// 下拉刷新视图的高度
extern const CGFloat kRefreshViewHeight;
/// 加载更多视图的高度
extern const CGFloat kLoadmoreViewHeight;

/* ************** 与加载出错、网络错误、数据为空，正在加载相关的字体和布局参数 ***************/

/// 加载为空、加载出错页面的重新加载按钮的大小
extern const CGFloat kLoadingReloadButtonWidth;
extern const CGFloat kLoadingReloadButtonHeight;
/// 加载为空、加载出错页面中文字提示与重新加载按钮之间的距离
extern const CGFloat kLoadingIndicationReloadGap;
/// 正在加载、下拉刷新视图中的 icon 与提示语之间的距离
extern const CGFloat kLoadingIconIndicationGap;





