//
//  {{args.Prefix}}LoadingErrorView.h
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 08/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>

@class {{args.Prefix}}LoadingErrorView;

/**
 如果 {{args.Prefix}}.LoadingErrorView 有重新加载功能，可以为该 View 设置 delegate
 */
@protocol {{args.Prefix}}LoadingErrorDelegate <NSObject>

@optional
- (void)loadingErrorReload:({{args.Prefix}}LoadingErrorView *)view;

@end

/**
 加载数据出错时展示的 View。
 
 一般列表页面需要网络加载数据，当网络请求返回错误或者服务器返回业务错误时，通常需要提示给用户。
 
 @note 可根据视觉需求自定义展示效果
 */
@interface {{args.Prefix}}LoadingErrorView : UIView

/// 提示语，例如：“加载失败”
@property (nonatomic, copy) NSString *indication;

@property (nonatomic, weak) id<{{args.Prefix}}LoadingErrorDelegate> delegate;

@end
