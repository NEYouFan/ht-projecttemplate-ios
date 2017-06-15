//
//  NELoginDataDefine.h
//  LoginSDK
//
//  Created by hubo on 14-11-4.
//  Copyright (c) 2014年 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 *  回调中出现的 NSError 的 domain。
 */
extern NSString * const kUrsResponseErrorDomain;

/**
 *  当 HTTP 响应码不为 200 时，会回调 600 网络错误，此时 error 的 userInfo 中 NSUnderlyingErrorKey 对应一个 error，
 *  这个 error 的 domain 为 kUrsHTTPServiceErrorDomain，code 为具体的 HTTP response code
 */
extern NSString * const kUrsHTTPServiceErrorDomain;

/**
 *  登陆错误码定义 
 *  D: 出现在联调时的错误，出现此错误时，开发应当立即解决。
 *  R: 用户使用时，可能出现的错误。
 */
typedef NS_ENUM(NSInteger, NELoginErrorCode) {
    NELoginErrorNone                = 0,        // 请求成功
    
    NELoginErrorTicketInvalid       = 400,      // 共享登陆，ticket无效。R
    NELoginErrorUrlErr              = 401,      // 请求参数错误，确认product id是否审核通过、或者参数值非法。D
    NELoginErrorDeviceInvalid       = 402,      // 设备非法，共享登录不可用，邮箱登录可用。R
    NELoginErrorAppInvalid          = 403,      // 产品非法。D
    NELoginErrorVerCodeNeedUp       = 411,      // 用户需要上行短信，才能获取验证码。R
    NELoginErrorVerCodeErrMax       = 412,      // 短信验证错误次数超过限制。R
    NELoginErrorVerCodeErr          = 413,      // 验证码错误。R
    NELoginErrorNoUser              = 420,      // 没有该用户。R
    NELoginErrorAccountLocked       = 422,      // 账号被锁定。R
    NELoginErrorIdInvalid           = 427,      // 初始化id无效。D
    NELoginErrorSignErr             = 444,      // 签名错误，确认传入的urs公钥是否正确、私钥是否正确、Security.framework是否导入。D
    NELoginErrorLogout              = 450,      // 本地 token 为nil，已登出。D
    NELoginErrorPasswordErr         = 460,      // 密码错误。R
    NELoginErrorSDKNoCompatibility  = 499,      // 接口版本不兼容，SDK需要升级，产品不会遇到。D
    
    NELoginErrorNoServer            = 500,      // 服务器错误。R
    NELoginErrorServerIng           = 503,      // 服务器正在维护。R
    
    NELoginErrorNoNetwork           = 600,      // 没有网络。R
    NELoginErrorAccountFreeze       = 602,      // 帐号被冻结
    NELoginErrorShareNotAppLogined  = 603,      // 共享登陆，当前设备没有共享登陆的产品。R
    
    NELoginErrorUnexpectedData      = 896,      // 未知异常，比如返回的数据格式不对（篡改等）。R
    NELoginErrorParameterErr        = 897,      // 接口传入参数错误，如传入的参数为空。D
    NELoginErrorShareTicketErr      = 898,      // 共享登陆，webview返回ticket为空。R
    NELoginErrorNotInitialized      = 899,      // SDK 没有初始化。D
};


/**
 *  登录类型
 */
typedef NS_ENUM(NSInteger, LoginType) {
    LoginTypeUnLogin                = 0,    // 未登陆
    LoginTypeURS                    = 10,   // urs登录
    LoginTypeShare                  = 20,   // 共享登陆
    LoginTypeMobile                 = 30,   // 手机号登录
    
    // 之后使用 NBLoginSDK 之后，才有可能出现下面三方的登录类型
    LoginTypeQQ                     = 21,   // QQ 登录
    LoginTypeWeibo                  = 22,   // 新浪微博
    LoginTypeWeiChat                = 23,   // 微信登录
    LoginTypeAlipay                 = 24,   // 支付宝登录
};

/**
 *  单个已经登陆app详情
 */
@interface NELoginedAPPInfo : NSObject<NSCoding>
@property (nonatomic, copy) NSString *ticket;          // 登陆app ticket
@property (nonatomic, copy) NSString *product;         // 产品id
@property (nonatomic, copy) NSString *productName;     // 产品名
@property (nonatomic, copy) NSString *username;        // 已登陆用户名
@property (nonatomic, copy) NSString *userIcon;        // 用户图像
@property (nonatomic, copy) NSString *scheme;          // 产品scheme
@property (nonatomic, copy) NSString *logo;            // 产品logo
- (instancetype)initWithDictionary:(NSDictionary *)aDictionary;
@end

/**
 *  回调block定义
 */
typedef void(^NELoginTicketCompletionBlock)(NSArray<NELoginedAPPInfo *> *aTicketList);         // 已经登陆app信息列表，NELoginedAPPInfo类型数组
typedef void(^NELoginFailureBlock)(NSError *aError);                       // 对应error code详见NELoginErrorCode定义
typedef void(^NELoginVerifyTokenBlock)(BOOL isValid);                      // YES:Token有效，NO:Token无效
typedef void(^NELoginCompletionBlock)(BOOL isSuccess, NSError *aError);     // isSuccess: YES 表示操作成功，NO 表示操作失败，aError对应登陆失败的错误码，对应 error code 详见文档定义
