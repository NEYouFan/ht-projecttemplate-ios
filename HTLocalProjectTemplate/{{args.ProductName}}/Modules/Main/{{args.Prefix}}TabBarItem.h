//
//  {{args.Prefix}}TabBarItem.h
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 12/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "{{args.Prefix}}TabBarController.h"
#import "HTSegmentsView.h"

/**
 TabBar 中每一个 tab 视图，请根据产品自身需求自定义视图的内容和布局。
 */
@interface {{args.Prefix}}TabBarItem : HTSegmentsCellView

/**
 创建一个 tab 视图

 @param title tab 的文字
 @param icon tab 的图标
 @param selectedIcon 当选中 tab 时的，tab 展示的图标
 @return 新建的 tab 视图
 */
- (instancetype)initWithTitle:(NSString*)title icon:(NSString*)icon selectedIcon:(NSString*)selectedIcon;

/**
 展示 tab 中的红点

 @param badgeType 红点的类型
 @param text 红点中的文字
 */
- (void)showBadge:({{args.Prefix}}BadgeType)badgeType text:(NSString*)text;

/**
 隐藏 tab 中的红点
 */
- (void)hideBadge;

@end
