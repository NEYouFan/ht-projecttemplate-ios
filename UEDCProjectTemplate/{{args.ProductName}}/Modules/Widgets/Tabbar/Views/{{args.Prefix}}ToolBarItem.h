//
//  {{args.Prefix}}ToolBarItem.h
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 2017/5/10.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HTSegmentsView.h"

@interface {{args.Prefix}}ToolBarItem : HTSegmentsCellView

/**
 创建一个 tab 视图
 
 @param icon tab 的图标
 @param selectedIcon 当选中 tab 时的，tab 展示的图标
 @return 新建的 tab 视图
 */
- (instancetype)initWithIcon:(NSString*)icon selectedIcon:(NSString*)selectedIcon;


@end
