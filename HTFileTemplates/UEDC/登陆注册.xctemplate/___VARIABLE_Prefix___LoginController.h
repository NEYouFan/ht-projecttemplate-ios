//
//  ___VARIABLE_Prefix:identifier___LoginController.h
//  ___VARIABLE_Prefix:identifier___
//
//  Created by tao on 15/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "___VARIABLE_Prefix:identifier___BaseViewController.h"

@class ___VARIABLE_Prefix:identifier___LoginController;

/**
 处理登录页面登录成功/失败的回调
 */
@protocol ___VARIABLE_Prefix:identifier___LoginDelegate <NSObject>

@required
- (void)loginSuccess:(___VARIABLE_Prefix:identifier___LoginController *)controller;

@optional
- (void)loginFailed:(___VARIABLE_Prefix:identifier___LoginController *)controller;
- (void)loginCanceled:(___VARIABLE_Prefix:identifier___LoginController *)controller;

@end

/**
 登录页面
 */
@interface ___VARIABLE_Prefix:identifier___LoginController : ___VARIABLE_Prefix:identifier___BaseViewController

@property (nonatomic, assign) id<___VARIABLE_Prefix:identifier___LoginDelegate> delegate;

/**
 无论当前处于什么页面，调用该方法可以 present 出登录页面。例如，token过期后，需要弹出登录页面重新登录。

 @param message 显示登录页面后弹出的提示。用于提示用户为何弹出了登陆页面。
 @param successBlock 登录成功后需要执行的操作。例如登录成功后，拿到了新的token，刷新一下当前列表页面。
 @param cancelBlock 取消登录后需要执行的操作。例如登陆页有关闭按钮将登陆页关闭，点击关闭按钮应该执行 cancelBlock。
 
 @note 该方法可根据实际需求修改，例如，将弹出 toast 提示修改为模态窗口等。
 */
+ (void)showLoginControllerWithToastMessage:(NSString *)message successBlock:(void (^)(void))successBlock cancelBlock:(void (^)(void))cancelBlock;

@end
