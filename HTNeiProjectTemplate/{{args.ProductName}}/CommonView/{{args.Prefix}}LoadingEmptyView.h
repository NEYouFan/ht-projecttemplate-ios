//
//  {{args.Prefix}}LoadingEmptyView.h
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 08/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>

@class {{args.Prefix}}LoadingEmptyView;

/**
 如果 {{args.Prefix}}.LoadingEmptyView 有重新加载功能，可以为该 View 设置 delegate
 
 @note 虽然本工程中 LoadingEmptyView 与 LoadingErrorView 基本一致，但是 LoadingEmptyView 和 LoadingErrorView 是两种不同的业务逻辑情景，同时保留 LoadingEmptyView 和 LoadingErrorView 更加具有通用性。
 */
@protocol {{args.Prefix}}LoadingEmptyDelegate <NSObject>

@optional
- (void)loadingEmptyReload:({{args.Prefix}}LoadingEmptyView *)view;

@end

/**
 没有数据时展示的 View。
 
 一般列表页面需要网络加载数据，当网络请求返回数据为空时，通常需要展示 "当前没有数据" 的提示。
 
 @note 可根据视觉需求自定义展示效果
 */
@interface {{args.Prefix}}LoadingEmptyView : UIView

/// 提示语，例如：“暂时没有数据”
@property (nonatomic, copy) NSString *indication;

@property (nonatomic, weak) id<{{args.Prefix}}LoadingEmptyDelegate> delegate;

@end
