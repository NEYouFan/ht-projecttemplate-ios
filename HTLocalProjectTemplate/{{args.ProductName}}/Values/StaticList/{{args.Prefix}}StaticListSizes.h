//
//  {{args.Prefix}}StaticListSizes.h
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 14/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface {{args.Prefix}}StaticListSizes : NSObject

/// 静态列表 cell 的 contentLabel 左测距离 cell 左边距的距离
+ (CGFloat)contentLeftMargin;

/// 静态列表 cell actionButton 的大小
+ (CGSize)actionButtonSize;

/// 静态列表 cell actionButton 右侧距离 cell 右边距的距离
+ (CGFloat)actionButtonRightMargin;

/// 标题的字体样式
+ (UIFont *)titleLabelFont;

/// 内容的字体样式
+ (UIFont *)contentLabelFont;

@end
