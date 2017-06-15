//
//  {{args.Prefix}}TextSizeView.h
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 2017/4/20.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>

@class {{args.Prefix}}TextSizeViewModel;

@interface {{args.Prefix}}TextSizeView : UIView

- (instancetype)initWithFrame:(CGRect)frame
                        model:({{args.Prefix}}TextSizeViewModel *)model;

@end
