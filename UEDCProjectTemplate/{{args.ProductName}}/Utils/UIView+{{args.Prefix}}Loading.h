//
//  UIView+{{args.Prefix}}Loading.h
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 09/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "{{args.Prefix}}LoadingErrorView.h"
#import "{{args.Prefix}}LoadingEmptyView.h"

typedef void (^{{args.Prefix}}RetryLoadingBlock)();
typedef void (^{{args.Prefix}}CompleteBlock)();

/**
 用于显示正在加载、加载出错、当前没有数据此类的页面，如果需要更多的定制样式或行为，可修改本类中的方法实现产品需求
 */
@interface UIView ({{args.Prefix}}Loading) <{{args.Prefix}}LoadingErrorDelegate,
                                            {{args.Prefix}}LoadingEmptyDelegate>

/* ******************************* Loading ******************************************/

/**
 将 {{args.Prefix}}LoadingView 添加在本View上，来显示 loading 状态，默认背景色为白色。
 */
- (void){{args.CategoryPrefix}}_showLoading;

/**
 将 {{args.Prefix}}LoadingView 添加在本View上，来显示 loading 状态

 @param backgroundColor {{args.Prefix}}LoadingView 的背景色
 */
- (void){{args.CategoryPrefix}}_showLoadingWithBackgroundColor:(UIColor *)backgroundColor;

/**
 将 {{args.Prefix}}LoadingView 添加在本View上，来显示 loading 状态

 @param indication {{args.Prefix}}LoadingView 的提示语
 */
- (void){{args.CategoryPrefix}}_showLoadingWithIndication:(NSString *)indication;

/**
 将 {{args.Prefix}}LoadingView 添加在本View上，来显示 loading 状态

 @param indication {{args.Prefix}}LoadingView 的提示语
 @param backgroundColor {{args.Prefix}}LoadingView 的背景色
 */
- (void){{args.CategoryPrefix}}_showLoadingWithIndication:(NSString *)indication backgroundColor:(UIColor *)backgroundColor;

/**
 将 {{args.Prefix}}LoadingView 从本 View 中移除
 */
- (void){{args.CategoryPrefix}}_hideLoading;

/**
 将 {{args.Prefix}}LoadingView 从本 View 中移除

 @param complete 移除 LoadingView 完成后，需要执行的任务
 */
- (void){{args.CategoryPrefix}}_hideLoading:({{args.Prefix}}CompleteBlock)complete;


/* ******************************* LoadingEmpty ******************************************/

/**
 将 {{args.Prefix}}LoadingEmptyView 添加在本View上，显示 loading empty 状态，默认背景色为白色
 
 @param retry 点击 {{args.Prefix}}LoadingEmptyView 中的重试时需要执行的的操作
 */
- (void){{args.CategoryPrefix}}_showLoadingEmpty:({{args.Prefix}}RetryLoadingBlock)retry;

/**
 将 {{args.Prefix}}LoadingEmptyView 添加在本View上，显示 loading empty 状态

 @param backgroundColor {{args.Prefix}}LoadingEmptyView 的背景色
 @param retry 点击 {{args.Prefix}}LoadingEmptyView 中的重试时需要执行的的操作
 */
- (void){{args.CategoryPrefix}}_showLoadingEmptyWithBackgroundColor:(UIColor *)backgroundColor retryBlock:({{args.Prefix}}RetryLoadingBlock)retry;;

/**
 将 {{args.Prefix}}LoadingEmptyView 从本 View 中移除
 */
- (void){{args.CategoryPrefix}}_hideLoadingEmpty;

/**
 {{args.Prefix}}LoadingEmptyView 从本 View 中移除

 @param complete 移除 LoadingEmptyView 完成后，需要执行的任务
 */
- (void){{args.CategoryPrefix}}_hideLoadingEmpty:({{args.Prefix}}CompleteBlock)complete;


/* ******************************* LoadingError ******************************************/

/**
 将 {{args.Prefix}}LoadingErrorView 添加在本View上，显示 loading error 状态，默认背景色为白色

 @param retry 点击 {{args.Prefix}}LoadingErrorView 中的重试时需要执行的的操作
 */
- (void){{args.CategoryPrefix}}_showLoadingError:({{args.Prefix}}RetryLoadingBlock)retry;

/**
 将 {{args.Prefix}}LoadingErrorView 添加在本View上，显示 loading error 状态

 @param backgroundColor {{args.Prefix}}LoadingErrorView 的背景色
 @param retry 点击 {{args.Prefix}}LoadingErrorView 中的重试时需要执行的的操作
 */
- (void){{args.CategoryPrefix}}_showLoadingErrorWithBackgroundColor:(UIColor *)backgroundColor retryBlock:({{args.Prefix}}RetryLoadingBlock)retry;

/**
 将 {{args.Prefix}}LoadingErrorView 从本 View 中移除
 */
- (void){{args.CategoryPrefix}}_hideLoadingError;

/**
 {{args.Prefix}}LoadingErrorView 从本 View 中移除

 @param complete 移除 LoadingErrorView 完成后，需要执行的任务
 */
- (void){{args.CategoryPrefix}}_hideLoadingError:({{args.Prefix}}CompleteBlock)complete;

@end
