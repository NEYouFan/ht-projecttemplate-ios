//
//  {{args.Prefix}}TextColorView.h
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 2017/4/20.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>

@class {{args.Prefix}}TextColorViewModel;

@interface {{args.Prefix}}TextColorView : UIView

- (instancetype)initWithFrame:(CGRect)frame
                        model:({{args.Prefix}}TextColorViewModel *)model;

@end
