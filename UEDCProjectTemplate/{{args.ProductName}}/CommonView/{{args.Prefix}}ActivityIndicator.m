//
//  {{args.Prefix}}ActivityIndicator.m
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 2017/3/14.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}ActivityIndicator.h"
#import "UIView+Frame.h"

@implementation {{args.Prefix}}ActivityIndicator

#pragma mark - Life cycle.

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _activitorImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"refresh_loading_new"]];
        [_activitorImageView sizeToFit];
        [self addSubview:_activitorImageView];
    }
    return self;
}


#pragma mark - Layout.

- (void)layoutSubviews {
    [super layoutSubviews];
    _activitorImageView.frame = self.bounds;
}

- (CGSize)sizeThatFits:(CGSize)size {
    return _activitorImageView.size;
}


#pragma mark - Public methods.

- (void)startAnimating {
    [_activitorImageView.layer removeAnimationForKey:@"Rotation"];
    _activitorImageView.transform = CGAffineTransformIdentity;
    CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.fromValue = [NSNumber numberWithFloat:0.0f];
    animation.toValue = [NSNumber numberWithFloat: 2 * M_PI];
    animation.repeatCount = INFINITY;
    animation.duration = 0.7;
    animation.removedOnCompletion = NO;
    [_activitorImageView.layer addAnimation:animation forKey:@"Rotation"];
}

- (void)stopAnimating {
    CGFloat curRotate = [[_activitorImageView.layer.presentationLayer valueForKeyPath:@"transform.rotation.z"] floatValue];
    [_activitorImageView.layer removeAllAnimations];
    CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.fromValue = [NSNumber numberWithFloat:curRotate];
    animation.toValue = [NSNumber numberWithFloat: curRotate];
    animation.removedOnCompletion = YES;
    [_activitorImageView.layer addAnimation:animation forKey:@"Rotation"];
}


@end
