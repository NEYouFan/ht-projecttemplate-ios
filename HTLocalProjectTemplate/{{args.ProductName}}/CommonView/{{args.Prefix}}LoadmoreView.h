//
//  {{args.Prefix}}LoadmoreView.h
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 09/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "HTBottomRightRefreshView.h"

/**
 分页加载更多数据时列表底部展示的 View。
 
 当列表页中数据较多时，通常采取分页加载的方式，即每次浏览到列表页底部时会进行加载更多。
 
 @note 默认实现中没有提供动画，可根据视觉需求自定义展示效果
 */
@interface {{args.Prefix}}LoadmoreView : HTBottomRightRefreshView

@end
