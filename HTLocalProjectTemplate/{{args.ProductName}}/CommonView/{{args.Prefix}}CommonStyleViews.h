//
//  {{args.Prefix}}CommonStyleViews.h
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 08/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 管理 App 通用的一些视图样式，例如很多页面的 label 字体颜色、大小、对齐方式相同，可以通过该类直接生成，无需多次定制样式。
 通过本类生成视图后，也可以再次修改。
 
 @note 在此添加创建视图的方法时，需谨慎思考待创建视图的样式是否具有通用性。
 */
@interface {{args.Prefix}}CommonStyleViews : NSObject

/**
 创建一个数据为空、加载出错页面中的重新加载按钮。

 @return 重新加载按钮
 */
+ (UIButton *)loadingReloadButton;

@end
