//
//  {{args.Prefix}}BaseViewController.h
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 12/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HTBaseRequest;

/**
 工程中 controller 的基类，可以完成一些所有 controller 都需要的设置项以及清理工作。
 例如，模板中给出的 baseController 处理了 controller 的背景色设置，状态栏样式的恢复,以及 controller 释放时，与此 controller 有关的网络请求的取消。
 */
@interface {{args.Prefix}}BaseViewController : UIViewController

/// 用于状态栏样式的设置，如果需要修改状态栏样式，直接修改本属性即可。
@property (nonatomic, assign) {{args.Prefix}}StatusBarStyle statusBarStyle;

/// 将 request 放入自动清理池中，当 controller 释放时，request 会被自动 cancel。
- (void)cancelRequestWhenControllerDealloc:(HTBaseRequest *)request;

/// 手动一次 cancle controller 当前自动清理池中的所有 request
- (void)clearRequests;

- (UIStatusBarStyle)convertStatusBarStyle:({{args.Prefix}}StatusBarStyle)style;

@end
