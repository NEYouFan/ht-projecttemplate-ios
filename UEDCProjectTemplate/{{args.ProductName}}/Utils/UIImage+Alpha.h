//
//  UIImage+Alpha.h
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 2017/5/2.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIImage (Alpha)

/**
 改变UIImage的alpha值，生成一个新的Image

 @param alpha 目标alpha
 @return 生成的新的UIImage
 */
- (UIImage *)imageByApplyingAlpha:(CGFloat) alpha;

@end
