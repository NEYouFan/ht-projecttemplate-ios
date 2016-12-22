//
//  {{args.Prefix}}LoadingColors.h
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 07/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 管理与 Loading 有关的视觉颜色。例如下拉刷新、加载出错等功能的页面中所需的颜色。
 
 @note 这里给出的参数只是与模板中默认提供的示例有关的参数，模板的使用者可根据视觉以及代码实现进行删除、添加和修改。
 */
@interface {{args.Prefix}}LoadingColors : NSObject

/* ********************* 下拉刷新，加载更多相关的颜色 *************************/

/**
 下拉刷新、加载更多视图的背景色

 @return 背景色
 */
+ (UIColor *)refreshBackgroundColor;


/* ************** 加载出错、网络错误、数据为空，正在加载相关的颜色 ***************/

/**
 加载出错、正在加载、网络错误、数据为空页面的默认背景色。

 @return 背景色
 */
+ (UIColor *)loadingBackgroundColor;

@end
