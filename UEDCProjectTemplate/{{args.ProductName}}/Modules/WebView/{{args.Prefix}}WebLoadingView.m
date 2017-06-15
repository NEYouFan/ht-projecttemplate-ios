//
//  {{args.Prefix}}WebLoadingView.m
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 2017/3/13.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}WebLoadingView.h"

@interface {{args.Prefix}}WebLoadingView ()

@property(nonatomic, strong)CALayer *loadingLayer;
@property(nonatomic, assign)CGFloat progress;

@end

@implementation {{args.Prefix}}WebLoadingView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        _loadingLayer = [CALayer layer];
        _loadingLayer.backgroundColor = [UIColor greenColor].CGColor;
        [self.layer addSublayer:_loadingLayer];
        self.clipsToBounds = NO;
        
    }
    return self;
}

- (void)setProgress:(float)progress animated:(BOOL)animated
{
    if (progress < 0) {
        progress = 0;
    }
    if (progress >= 1.0) {
        progress = 1.0;
    }
    _progress = progress;
    CGFloat width = _progress * CGRectGetWidth(self.frame);
    
    BOOL originDisableActions = [CATransaction disableActions];
    if (progress == 0){
        [CATransaction setDisableActions:YES];
    }
    
    _loadingLayer.frame = CGRectMake(0, 0, width, CGRectGetHeight(self.frame));
    
    if (progress == 0){
        [CATransaction setDisableActions:originDisableActions];
    }
    //进度满后，延时0.5s进度条消失
    if (progress == 1.0) {
        [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(reset) userInfo:nil repeats:NO];
    }
}

- (void)reset
{
    [self setProgress:0 animated:YES];
}

@end
