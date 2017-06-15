//
//  NEQRCodeContainerViewController.h
//  NELoginSDK
//
//  Created by liuchang on 16/5/25.
//  Copyright © 2016年 NetEase. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, NEQRScanCode) {
    NEQRScanCodeInvalidPic      = 0,    // 无效的图片
    NEQRScanCodeInvalidToken    = 400,  // Token 无效
    NEQRScanCodeInvalidParam    = 401,  // URL语法错误或参数值非法
    NEQRScanCodeNotSupport      = 407,  // 产品不支持二维码
    NEQRScanCodeStatusError     = 408,  // 二维码状态错误
    NEQRScanCodeLockedAccount   = 422,  // 账号被锁定
    NEQRScanCodeExpiredAccount  = 423,  // VIP或188账号服务已到期
    NEQRScanCodeExpiredVIP      = 424,  // 靓号服务已到期
    NEQRScanCodeUnlogin         = 450,  // 未登录
    NEQRScanCodeExpiredCode     = 500,  // 二维码过期
    NEQRScanCodeServering       = 503,  // 系统正在维护
};

@protocol NEQRCodeDelegate <NSObject>
@optional
/**
 *  扫描二维码失败，error 码见 NEQRScanCode
 *
 *  @param error
 */
- (void)NEQRCodeFailedWithError:(NSError *)error;

/**
 *  成功扫描到一个二维码
 */
- (void)NEQRCodeSuccessWithValue:(NSString *)stringValue;

/**
 *  多帐号时，用户选择一个帐号的回调
 *
 *  @param account <#account description#>
 */
- (void)NEQRCodeDidSelectedAccount:(NSString *)account;

/**
 *  用户点击确认按钮并成功返回
 */
- (void)NEQRCodeConfirmSuccess;

/**
 *  用户点击返回按钮
 */
- (void)NEQRCodeBackPressed;
@end

@interface NEQRCodeContainerViewController : UIViewController
@property (nonatomic, weak) id<NEQRCodeDelegate> delegate;
- (instancetype)init;

/**
 *  使用多账号登录
 *
 *  @param accounts     用户账号 -> token 的字典
 *  @param errorMessage 出现 NEQRScanCode 中的错误时的提示语，比如：@{@(NEQRScanCodeInvalidToken): @"invalid token"}
 *
 *  @return return value description
 */
- (instancetype)initWithAccounts:(NSArray<NSDictionary<NSString *, NSString *> *> *)accounts
                    errorMessage:(NSDictionary<NSNumber *, NSString *> *)errorMessage;
@end
