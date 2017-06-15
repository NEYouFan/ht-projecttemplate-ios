//
//  {{args.Prefix}}ProgressView.m
//  {{args.Prefix}}
//
//  Created by NetEase on 2017/4/28.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}ProgressView.h"

@implementation {{args.Prefix}}ProgressView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self commonInit];
    }
    return self;
}

-(void)commonInit{
    self.backgroundColor = [UIColor clearColor];
}

-(void)drawRect:(CGRect)rect{
    CGFloat width = rect.size.width;
    CGFloat height = rect.size.height;
    
    UIBezierPath * outerPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, width, height) cornerRadius:self.cornerRadius];
    [[UIColor colorWithRGBValue:kProgressOuterColor] setFill];
    [outerPath fill];
    
    
    UIBezierPath * innerPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, width * self.progress , height) cornerRadius:self.cornerRadius];
    [[UIColor colorWithRGBValue:kProgressInnerColor] setFill];
    [innerPath fill];
    
}

-(void)setProgress:(CGFloat)progress{
    if (progress>1 || progress<0) {
        _progress = 0;
    }else{
        _progress = progress;
    }
    // 重绘，系统会先创建与view相关联的上下文，然后再调用drawRect
    [self setNeedsDisplay];
}
@end
