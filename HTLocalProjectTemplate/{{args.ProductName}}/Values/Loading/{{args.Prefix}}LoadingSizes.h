//
//  {{args.Prefix}}LoadingSizes.h
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 07/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 管理与 Loading 有关的字体样式，以及排版布局参数。
 
 @note 这里给出的参数只是与模板中默认提供的示例有关的参数，模板的使用者可根据视觉以及代码实现进行删除、添加和修改。
 */
@interface {{args.Prefix}}LoadingSizes : NSObject

/* ********************* 与下拉刷新，加载更多相关的字体和布局参数 *************************/

/**
 下拉刷新视图的高度

 @return 下拉刷新视图的高度
 */
+ (CGFloat)refreshViewHeight;

/**
 加载更多视图的高度

 @return 加载更多视图的高度
 */
+ (CGFloat)loadmoreViewHeight;


/* ************** 与加载出错、网络错误、数据为空，正在加载相关的字体和布局参数 ***************/

/**
 加载为空、加载出错页面的重新加载按钮的大小

 @return 重新加载按钮的大小
 */
+ (CGSize)loadingReloadButtonSize;

/**
 加载为空、加载出错页面中文字提示与重新加载按钮之间的距离

 @return 加载为空、加载出错页面中文字提示与重新加载按钮之间的距离
 */
+ (CGFloat)loadingIndicationReloadGap;

/**
 正在加载、下拉刷新视图中的 icon 与提示语之间的距离

 @return  正在加载、下拉刷新视图中的 icon 与提示语之间的距离
 */
+ (CGFloat)loadingIconIndicationGap;

@end
