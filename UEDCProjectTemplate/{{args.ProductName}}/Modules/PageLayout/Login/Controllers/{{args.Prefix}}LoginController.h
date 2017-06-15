//
//  {{args.Prefix}}LoginController.h
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 15/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "{{args.Prefix}}BaseViewController.h"

@class {{args.Prefix}}LoginController;

/**
 处理登录页面登录成功/失败的回调
 */
@protocol {{args.Prefix}}LoginDelegate <NSObject>

@required
- (void)loginSuccess:({{args.Prefix}}LoginController *)controller;

@optional
- (void)loginFailed:({{args.Prefix}}LoginController *)controller;
- (void)loginCanceled:({{args.Prefix}}LoginController *)controller;

@end

/**
 登录页面
 */
@interface {{args.Prefix}}LoginController : {{args.Prefix}}BaseViewController

@property (nonatomic, assign) id<{{args.Prefix}}LoginDelegate> delegate;

/**
 无论当前处于什么页面，调用该方法可以 present 出登录页面。例如，token过期后，需要弹出登录页面重新登录。

 @param message 显示登录页面后弹出的提示。用于提示用户为何弹出了登陆页面。
 @param successBlock 登录成功后需要执行的操作。例如登录成功后，拿到了新的token，刷新一下当前列表页面。
 @param cancelBlock 取消登录后需要执行的操作。例如登陆页有关闭按钮将登陆页关闭，点击关闭按钮应该执行 cancelBlock。
 
 @note 该方法可根据实际需求修改，例如，将弹出 toast 提示修改为模态窗口等。
 */
+ (void)showLoginControllerWithToastMessage:(NSString *)message successBlock:(void (^)(void))successBlock cancelBlock:(void (^)(void))cancelBlock;

@end
