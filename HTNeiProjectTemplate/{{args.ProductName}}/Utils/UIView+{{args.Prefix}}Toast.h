//
//  UIView+{{args.Prefix}}Toast.h
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 06/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 显示 toast 提示的方法集合，所有显示 toast 的方法(如有些 toast 有自定义样式等)应该在这个文件中添加，方便管理。
 
 这里给出的方法用于简单的在 UIView 的中间位置显示一条消息提示。
 */
@interface UIView ({{args.Prefix}}Toast)

/**
 在 UIView 的中间位置显示一条消息提示
 */
- (void){{args.CategoryPrefix}}_showToastWithMessage:(NSString *)message;

@end
