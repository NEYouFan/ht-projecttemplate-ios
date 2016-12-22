//
//  {{args.Prefix}}ThemeSizes.h
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 05/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 对全局业务无关的字体和大小进行管理，方便随时修改以及查找。
 也可以采用其他样式管理机制。
 
 @note 这里给出的参数只是与模板中默认提供的示例有关的参数，模板的使用者可根据视觉以及代码实现进行删除、添加和修改。
 */
@interface {{args.Prefix}}ThemeSizes : NSObject

/* ***************** 系统默认的一些配置，常用于计算布局使用。可根据所需自由添加 ***********/

/// 屏幕高度
+ (CGFloat)screenHeight;

/// 屏幕宽度
+ (CGFloat)screenWidth;

/// 屏幕大小
+ (CGSize)screenSize;

/// 导航栏高度(包含状态栏)
+ (CGFloat)navigationHeight;

/// Tabbar 的高度
+ (CGFloat)tabHeight;


/* ************* 主题字体大小(通常由视觉统一规范规定)相关, 可根据所需自由添加 ***************/

/// 视觉统一规范中，默认的字体样式
+ (UIFont *)themeFont;

/// 输入框的提示字体样式
+ (UIFont *)placeholderFont;


/* ************************ 全局性的边距等配置，可根据所需自由添加 ************************/

/// 视觉统一规范中，一些 icon、label 等视图与父容器的左边距
+ (CGFloat)leftMargin;

/// 视觉统一规范中，一些 icon、label 等视图与父容器的右边距
+ (CGFloat)rightMargin;

/// 用于分页加载逻辑，初始加载的页面编号(服务器有时以 0 开始，有时以 1 开始，开发者需根据服务器需求修改该值)
+ (NSInteger)initialPageNumber;

/// 用于分页加载逻辑，每次加载的 item 数量，可依据需求修改该值
+ (NSInteger)loadmorePageSize;

/// 1 像素线的宽度/高度
+ (CGFloat)lineWidth;

/// 圆角大小
+ (CGFloat)cornerRadiusSize;

/**
 tableview 中，有些 cell 之间有一些间隔，当不适用 section 方案时，可以使用在两个 cell 之间添加一个用于展示间隔的 cell

 @return 间隔 cell 的高度
 */
+ (CGFloat)tableViewCellGap;

@end
