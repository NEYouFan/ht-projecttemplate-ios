//
//  {{args.Prefix}}ButtonCornerSectionView.h
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 2017/4/21.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>

@class  {{args.Prefix}}ButtonCornerModel;

@interface {{args.Prefix}}ButtonCornerSectionView : UIView

- ({{args.Prefix}}ButtonCornerSectionView *)initWithTitle:(NSString *)title
                                        Models:(NSArray <{{args.Prefix}}ButtonCornerModel *> *)models;

@end
