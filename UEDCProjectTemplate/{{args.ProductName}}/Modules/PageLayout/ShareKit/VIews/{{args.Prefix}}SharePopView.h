//
//  {{args.Prefix}}SharePopView.h
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 2017/5/16.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface {{args.Prefix}}SharePopView : UIView

@property(nonatomic, copy)NSArray *contents;

+ (instancetype)sharedInstance;

- (void)show;

- (void)dismiss;


@end
