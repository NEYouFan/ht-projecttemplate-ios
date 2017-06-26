//
//  ___VARIABLE_Prefix:identifier___PopView.h
//  ___VARIABLE_Prefix:identifier___
//
//  Created by 陶泽宇 on 2017/5/16.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ___VARIABLE_Prefix:identifier___PopView : UIView

@property (nonatomic, strong) UIView *contentView;

- (instancetype)initWithContentView:(UIView *)contentView;

- (void)popup;

- (void)dismiss;

@end
