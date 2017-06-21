//
//  {{args.Prefix}}BaseViewController+{{args.Prefix}}CustomNavigationBar.h
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 05/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "{{args.Prefix}}BaseViewController.h"

/**
 为 UIViewController 配置导航栏样式提供一些便利方法
 */
@interface {{args.Prefix}}BaseViewController ({{args.Prefix}}CustomNavigationBar)

/**
 默认导航栏样式
 
 @note 需要根据视觉要求，自定义本方法实现中的样式定制
 */
- (void){{args.CategoryPrefix}}_applyDefaultNavigationBarStyle;

/**
 透明导航栏样式，白色状态栏
 
 @note 需要根据视觉要求，自定义本方法实现中的样式定制
 */
- (void){{args.CategoryPrefix}}_applyTransparentNavigationBarWhiteStatus;

/**
 透明导航栏，黑色状态栏
 
 @note 需要根据视觉要求，自定义本方法实现中的样式定制
 */
- (void){{args.CategoryPrefix}}_applyTransparentNavigationBarDarkStatus;

/**
 添加左侧返回键
 
 @return 添加的 button，可以在此返回的 button 上定制样式和添加事件
 
 @note 需要根据视觉要求，自定义本方法实现中的样式定制
 */
- (UIButton *){{args.CategoryPrefix}}_addNavigationLeftBackItem;

/**
 添加导航栏左侧按钮，不为该 button 添加任何点击行为与视觉
 
 @return 添加的 button，可以在此返回的 button 上定制样式和添加事件
 
 @note 需要根据视觉要求，自定义本方法实现中的样式定制
 */
- (UIButton *){{args.CategoryPrefix}}_addNavigationLeftItem;

/**
 添加导航栏右侧关闭按钮，只定制了样式，没有添加行为
 
 @return 添加的 button，可以在此返回的 button 上定制样式和添加事件
 
 @note 需要根据视觉要求，自定义本方法实现中的样式定制
 */
- (UIButton *){{args.CategoryPrefix}}_addNavigationRightCloseItem;

/**
 添加导航栏右侧设置按钮，只定制了样式，没有添加行为
 
 @return 添加的 button，可以在此返回的 button 上定制样式和添加事件
 
 @note 需要根据视觉要求，自定义本方法实现中的样式定制
 */
- (UIButton *){{args.CategoryPrefix}}_addNavigationRightSettingItem;

/**
 添加导航栏右侧联系我们按钮，只定制了样式，没有添加行为
 
 @return 添加的 button，可以在此返回的 button 上定制样式和添加事件
 
 @note 需要根据视觉要求，自定义本方法实现中的样式定制
 */
- (UIButton *){{args.CategoryPrefix}}_addNavigationRightContactItem;

/**

/**
 添加导航栏右侧设置按钮，只定制了样式，没有添加行为
 
 @prama title  右侧button内部text文字
 
 @return 添加的 button，可以在此返回的 button 上定制样式和添加事件
 
 @note 需要根据视觉要求，自定义本方法实现中的样式定制
 */
- (UIButton *){{args.CategoryPrefix}}_addNavigationRightItemWithTitle:(NSString *)title;


/**
 添加导航栏右侧按钮， 不为该 button 添加任何点击行为与视觉
 
 @return 添加的 button，可以在此返回的 button 上定制样式和添加事件
 
 @note 需要根据视觉要求，自定义本方法实现中的样式定制
 */
- (UIButton *){{args.CategoryPrefix}}_addNavigationRightItem;



/**
 添加导航栏为搜索框 + 返回按钮的样式

 @return searchBar
 */
- (UISearchBar *){{args.CategoryPrefix}}_addNavigationSearchItem;



@end
