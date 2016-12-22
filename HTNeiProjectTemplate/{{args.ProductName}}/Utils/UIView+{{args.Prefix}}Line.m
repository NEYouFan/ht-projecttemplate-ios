//
//  UIView+{{args.Prefix}}Line.m
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 06/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "UIView+{{args.Prefix}}Line.h"
#import "Masonry.h"
#import <objc/runtime.h>

static char const *kHorizontalMiddleLineKey;
static char const *kHorizontalTopLineKey;
static char const *kHorizontalBottomLineKey;

static char const *kVerticalMiddleLineKey;
static char const *kVerticalHeadLineKey;
static char const *kVerticalTailLineKey;

@implementation UIView ({{args.Prefix}}Line)

#pragma mark - Class methods.

+ (instancetype){{args.CategoryPrefix}}_line {
    UIView *line = [[UIView alloc] init];
    line.frame = CGRectMake(0, 0, [{{args.Prefix}}ThemeSizes lineWidth], [{{args.Prefix}}ThemeSizes lineWidth]);
    line.backgroundColor = [{{args.Prefix}}ThemeColors themeLineColor];
    return line;
}


#pragma mark - Vertical line.

- (UIView *){{args.CategoryPrefix}}_addVerticalMiddleLineWithTopMargin:(CGFloat)topMargin bottomMargin:(CGFloat)bottomMargin {
    UIView *line = [self {{args.CategoryPrefix}}_getCellLineByKey:&kVerticalMiddleLineKey];
    [line removeFromSuperview];
    [self addSubview:line];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self).with.offset(topMargin);
        make.height.equalTo(self.mas_height).with.offset(-bottomMargin-topMargin);
        make.width.equalTo(@([{{args.Prefix}}ThemeSizes lineWidth]));
    }];
    
    return line;
}

- (UIView *){{args.CategoryPrefix}}_addVerticalHeadLineWithTopMargin:(CGFloat)topMargin bottomMargin:(CGFloat)bottomMargin {
    UIView *line = [self {{args.CategoryPrefix}}_getCellLineByKey:&kVerticalHeadLineKey];
    [line removeFromSuperview];
    [self addSubview:line];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(self).with.offset(topMargin);
        make.height.equalTo(self.mas_height).with.offset(-bottomMargin-topMargin);
        make.width.equalTo(@([{{args.Prefix}}ThemeSizes lineWidth]));
    }];
    
    return line;
}

- (UIView *){{args.CategoryPrefix}}_addVerticalTailLineWithTopMargin:(CGFloat)topMargin bottomMargin:(CGFloat)bottomMargin {
    UIView *line = [self {{args.CategoryPrefix}}_getCellLineByKey:&kVerticalTailLineKey];
    [line removeFromSuperview];
    [self addSubview:line];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self);
        make.top.equalTo(self).with.offset(topMargin);
        make.height.equalTo(self.mas_height).with.offset(-bottomMargin-topMargin);
        make.width.equalTo(@([{{args.Prefix}}ThemeSizes lineWidth]));
    }];
    
    return line;
}

- (void){{args.CategoryPrefix}}_removeVerticalMiddleLine {
    UIView *line = [self {{args.CategoryPrefix}}_getCellLineByKey:&kVerticalMiddleLineKey];
    [line removeFromSuperview];
}

- (void){{args.CategoryPrefix}}_removeVerticalHeadLine {
    UIView *line = [self {{args.CategoryPrefix}}_getCellLineByKey:&kVerticalHeadLineKey];
    [line removeFromSuperview];
}

- (void){{args.CategoryPrefix}}_removeVerticalTailLine {
    UIView *line = [self {{args.CategoryPrefix}}_getCellLineByKey:&kVerticalTailLineKey];
    [line removeFromSuperview];
}


#pragma mark - Horizontal line.

- (UIView *){{args.CategoryPrefix}}_addHorizontalMiddleLineWithLeftMargin:(CGFloat)leftMargin rightMargin:(CGFloat)rightMargin {
    UIView *line = [self {{args.CategoryPrefix}}_getCellLineByKey:&kHorizontalMiddleLineKey];
    [line removeFromSuperview];
    [self addSubview:line];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self).with.offset(leftMargin);
        make.right.equalTo(self).with.offset(-rightMargin);
        make.height.equalTo(@([{{args.Prefix}}ThemeSizes lineWidth]));
    }];
    
    return line;
}

- (UIView *){{args.CategoryPrefix}}_addHorizontalTopLineWithLeftMargin:(CGFloat)leftMargin rightMargin:(CGFloat)rightMargin {
    UIView *line = [self {{args.CategoryPrefix}}_getCellLineByKey:&kHorizontalTopLineKey];
    [line removeFromSuperview];
    [self addSubview:line];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.equalTo(self).with.offset(leftMargin);
        make.width.equalTo(self.mas_width).with.offset(-leftMargin-rightMargin);
        make.height.equalTo(@([{{args.Prefix}}ThemeSizes lineWidth]));
    }];
    
    return line;
}

- (UIView *){{args.CategoryPrefix}}_addHorizontalBottomLineWithLeftMargin:(CGFloat)leftMargin rightMargin:(CGFloat)rightMargin {
    UIView *line = [self {{args.CategoryPrefix}}_getCellLineByKey:&kHorizontalBottomLineKey];
    [line removeFromSuperview];
    [self addSubview:line];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self);
        make.left.equalTo(self).with.offset(leftMargin);
        make.width.equalTo(self.mas_width).with.offset(-leftMargin-rightMargin);
        make.height.equalTo(@([{{args.Prefix}}ThemeSizes lineWidth]));
    }];
    
    return line;
}

- (void){{args.CategoryPrefix}}_removeHorizontalMiddleLine {
    UIView *line = [self {{args.CategoryPrefix}}_getCellLineByKey:&kHorizontalMiddleLineKey];
    [line removeFromSuperview];
}

- (void){{args.CategoryPrefix}}_removeHorizontalTopLine {
    UIView *line = [self {{args.CategoryPrefix}}_getCellLineByKey:&kHorizontalTopLineKey];
    [line removeFromSuperview];
}

- (void){{args.CategoryPrefix}}_removeHorizontalBottomLine {
    UIView *line = [self {{args.CategoryPrefix}}_getCellLineByKey:&kHorizontalBottomLineKey];
    [line removeFromSuperview];
}

#pragma mark - Add custom view.

- (UIView *){{args.CategoryPrefix}}_addViewWithLeftMargin:(CGFloat)leftMargin rightMargin:(CGFloat)rightMargin topMargin:(CGFloat)topMargin bottomMargin:(CGFloat)bottomMargin {
    UIView *view = [[UIView alloc] init];
    [self addSubview:view];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).with.offset(topMargin);
        make.bottom.equalTo(self.mas_bottom).with.offset(-bottomMargin);
        make.left.equalTo(self.mas_left).with.offset(leftMargin);
        make.right.equalTo(self.mas_right).with.offset(-rightMargin);
    }];
    
    return view;
}


#pragma mark - Private methods.

/// 通过 objcruntime 的 associate object 方法获取 1 pixel view.
- (UIView *){{args.CategoryPrefix}}_getCellLineByKey:(void *)key {
    UIView *line = objc_getAssociatedObject(self, key);
    if (!line) {
        line = [UIView {{args.CategoryPrefix}}_line];
        objc_setAssociatedObject(self, key, line, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return line;
}

@end
