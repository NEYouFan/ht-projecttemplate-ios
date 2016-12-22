//
//  UIView+{{args.Prefix}}Line.h
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 06/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 提供一些为 UIView 添加各个位置 1 pixel 线的便利方法。本类中所有方法中添加的线的颜色均为 {{args.Prefix}}ThemeColors 中定义的 lineColor，本 Category 方法会返回添加到 UIView 的线，如有自定义线颜色的需求，可获取返回值后进行自定义。
 */
@interface UIView ({{args.Prefix}}Line)

/// 获取一条线
+ (instancetype){{args.CategoryPrefix}}_line;

/**
 为该 View 添加一条位于中间位置的 1 pixel 竖线

 @param topMargin 竖线的起始处距离该 View 顶部的距离
 @param bottomMargin 竖线的尾端距离该 View 底部的距离
 @return 添加到该 View 的 1 pixel 的线；
 */
- (UIView *){{args.CategoryPrefix}}_addVerticalMiddleLineWithTopMargin:(CGFloat)topMargin bottomMargin:(CGFloat)bottomMargin;

/**
 为该 View 添加一条位于最左侧位置的 1 pixel 竖线

 @param topMargin 竖线的起始处距离该 View 顶部的距离
 @param bottomMargin 竖线的尾端距离该 View 底部的距离
 @return 添加到该 View 的 1 pixel 的线；
 */
- (UIView *){{args.CategoryPrefix}}_addVerticalHeadLineWithTopMargin:(CGFloat)topMargin bottomMargin:(CGFloat)bottomMargin;

/**
 为该 View 添加一条位于最右侧位置的 1 pixel 竖线

 @param topMargin 竖线的起始处距离该 View 顶部的距离
 @param bottomMargin 竖线的尾端距离该 View 底部的距离
 @return 添加到该 View 的 1 pixel 的线；
 */
- (UIView *){{args.CategoryPrefix}}_addVerticalTailLineWithTopMargin:(CGFloat)topMargin bottomMargin:(CGFloat)bottomMargin;

/**
 为该 View 添加一条位于中间位置的 1 pixel 横线

 @param leftMargin 横线的起始处距离该 View 左侧的距离
 @param rightMargin 横线的尾端距离该 View 右侧的距离
 @return 添加到该 View 的 1 pixel 的线；
 */
- (UIView *){{args.CategoryPrefix}}_addHorizontalMiddleLineWithLeftMargin:(CGFloat)leftMargin rightMargin:(CGFloat)rightMargin;

/**
 为该 View 添加一条位于顶部的 1 pixel 横线

 @param leftMargin 横线的起始处距离该 View 左侧的距离
 @param rightMargin 横线的尾端距离该 View 右侧的距离
 @return 添加到该 View 的 1 pixel 的线；
 */
- (UIView *){{args.CategoryPrefix}}_addHorizontalTopLineWithLeftMargin:(CGFloat)leftMargin rightMargin:(CGFloat)rightMargin;

/**
 为该 View 添加一条位于底部的 1 pixel 横线

 @param leftMargin 横线的起始处距离该 View 左侧的距离
 @param rightMargin 横线的尾端距离该 View 右侧的距离
 @return 添加到该 View 的 1 pixel 的线；
 */
- (UIView *){{args.CategoryPrefix}}_addHorizontalBottomLineWithLeftMargin:(CGFloat)leftMargin rightMargin:(CGFloat)rightMargin;

/**
 为该 View 添加一个子 view
 
 @param leftMargin 子 view 左侧距离该 View 左侧的距离
 @param rightMargin 子 view 右侧距离该 View 右侧的距离
 @param topMargin 子 view 上部距离该 view 上部的距离
 @param bottomMargin 子 view 下部距离该 view 下部的距离
 @return 新添加的子 view
 */
- (UIView *){{args.CategoryPrefix}}_addViewWithLeftMargin:(CGFloat)leftMargin rightMargin:(CGFloat)rightMargin topMargin:(CGFloat)topMargin bottomMargin:(CGFloat)bottomMargin;

/**
 删除中间位置的横线
 */
- (void){{args.CategoryPrefix}}_removeHorizontalMiddleLine;

/**
 删除顶部位置的横线
 */
- (void){{args.CategoryPrefix}}_removeHorizontalTopLine;

/**
 删除底部位置的横线
 */
- (void){{args.CategoryPrefix}}_removeHorizontalBottomLine;

/**
 删除中间位置的竖线
 */
- (void){{args.CategoryPrefix}}_removeVerticalMiddleLine;

/**
 删除左侧位置的竖线
 */
- (void){{args.CategoryPrefix}}_removeVerticalHeadLine;

/**
 删除右侧位置的竖线
 */
- (void){{args.CategoryPrefix}}_removeVerticalTailLine;

@end
