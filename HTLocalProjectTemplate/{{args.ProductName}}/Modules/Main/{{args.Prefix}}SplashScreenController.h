//
//  {{args.Prefix}}SplashScreenController.h
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 12/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "{{args.Prefix}}BaseViewController.h"

@class {{args.Prefix}}SplashScreenController;

@protocol {{args.Prefix}}SplashScreenDelegate <NSObject>

@required
- (void)splashScreenDidDisappear:({{args.Prefix}}SplashScreenController *)splashScreenController;

@end

/**
 应用启动时的闪屏页面，一般用于展示广告，本示例中只是简单的展示启动页面，并在1s后消失，使用者可修改该类，实现产品定制的需求。
 */
@interface {{args.Prefix}}SplashScreenController : {{args.Prefix}}BaseViewController

@property (nonatomic, weak) id<{{args.Prefix}}SplashScreenDelegate> delegate;

@end
