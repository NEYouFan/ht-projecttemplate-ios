//
//  {{args.Prefix}}ActivityIndicator.h
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 2017/3/14.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface {{args.Prefix}}ActivityIndicator : UIView

@property (nonatomic, strong) UIImageView *activitorImageView;

- (void)startAnimating;

- (void)stopAnimating;

@end
