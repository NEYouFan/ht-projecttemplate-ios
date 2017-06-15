//
//  {{args.Prefix}}LoadingView.h
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 08/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 加载数据时展示的 View。
 
 一般列表页面需要网络加载数据，在加载数据的过程中，由于页面中还没有数据，所以一般会显示一个带有动画的 loading 视图
 
 @note 可根据视觉需求自定义展示效果
 */
@interface {{args.Prefix}}LoadingView : UIView

/// 提示语，例如：“正在加载”
@property (nonatomic, copy) NSString *indication;

/**
 如果有 loading 动画，调用此方法开始 loading 动画
 */
- (void)startLoadingAnimation;

/**
 结束 loading 动画
 */
- (void)stopLoadingAnimation;

@end
