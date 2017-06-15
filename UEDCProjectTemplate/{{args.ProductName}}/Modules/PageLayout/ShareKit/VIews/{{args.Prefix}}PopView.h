//
//  {{args.Prefix}}PopView.h
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 2017/5/16.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface {{args.Prefix}}PopView : UIView

@property (nonatomic, strong) UIView *contentView;

- (instancetype)initWithContentView:(UIView *)contentView;

- (void)popup;

- (void)dismiss;

@end
