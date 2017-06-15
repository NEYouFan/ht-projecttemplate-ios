//
//  NELoginEngine.h
//  LoginSDK
//
//  Created by Axis on 14-9-28.
//  Copyright (c) 2014年 netease. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "NELoginDataDefine.h"

/*UI调用此类*/
#define LoginEngine ([NELoginEngine sharedInstance])
#define NEURS_DEPRECATED(...) __attribute__((deprecated(__VA_ARGS__)))
@class UIViewController;

NS_ASSUME_NONNULL_BEGIN

/**
 *  手机帐号需要用到的 loginException，
 *  kUrsLoginExceptionStatus 表示需要返回异常登录状态；
 *  kUrsLoginExceptionStatusFlag 表示需要返回异常并且带回是否盗号标记；
 */
extern NSString * const kUrsLoginExceptionStatus;
extern NSString * const kUrsLoginExceptionStatusFlag;

/**
 *  在使用 NELoginEngine 之前，必须调用 
 *  -initWithProductId:ursPublicKey:productPrivateKeyP12Psd:completionBlock: 方法（除非之前使用过 http 接口，
 *  已经获取到 id 和 key，此时可以使用 -updateLoginStateWithId:key:token:completionBlock: 方法初始化 SDK）。
 *  
 *  在 SDK 之后的使用过程中，几乎所有的接口都会检查是否初始化，产品不必自己判断。当没有初始化就调用其它接口时，会回调错误。
 */
@interface NELoginEngine : NSObject
+ (instancetype)sharedInstance;
@property (nonatomic, assign) BOOL debugMode; // 是否开启 DebugMode，默认为 NO。开启后，一些 SDK 使用方面的错误会在终端中打印。
#pragma mark - SDK version
/**
 *  SDK 主版本号
 *
 *  @return 主版本号
 */
- (NSString *)loginSDKVersion;

/**
 *  小版本号
 *
 *  @return 小版本号
 */
- (NSString *)loginSDKInternalVersion;

#pragma mark - 日志相关
/**
 *  关闭日志系统（不存储也不上传）
 *  关于日志系统：
 *  SDK 会本地进行日志存储、定时上传至 URS 服务器。以此来获取一些用户操作的信息，及时捕获问题，以便日后排查；需要耗费一定流量。
 *  日志级别从高到低为：error、info、debug。如果开启 info 级别，error 信息也会保存并上传；如果开启 debug 级别，error 信息和 info 信息也会保存并上传。
 *
 *  默认为 error 级别。
 
 *  如果不希望 SDK 保存用户信息，使用 forbidLog 禁用日志系统
 */
- (void)forbidLog;

/**
 *  日志是否被关闭
 *
 *  @return 如果日志被关闭，返回 YES；否则返回 NO。
 */
- (BOOL)isLogForbidden;

/**
 *  开启 error 级别日志。
 */
- (void)startErrorLog;

/**
 *  是否开启了 error 级别的日志
 *
 *  @return 如果当前日志级别为 error，返回 YES；否则返回 NO。
 */
- (BOOL)isErrorLogStarted;

/**
 *  开启 info 级别日志
 */
- (void)startInfoLog;
/**
 *  是否开启了 info 级别的日志
 *
 *  @return 如果当前日志级别为 info，返回 YES；否则返回 NO。
 */
- (BOOL)isInfoLogStarted;

/**
 *  开启 debug 级别日志
 */
- (void)startDebugLog NEURS_DEPRECATED("实际代码中并没有 debug 级别的日志，只有 error 和 info 级别");

#pragma mark - 初始化 SDK
/**
 *  初始化 SDK。进行 SDK 的其它操作前，一定要调用此方法初始化 SDK
 *
 *  @param aProductId      产品 id，由 URS 分配
 *  @param aPublicKey      URS 公钥，由 URS 分配
 *  @param aP12KeyPassword 产品 p12 格式私钥，由 URS 分配的 pem 格式私钥转换后的 p12 格式私钥密码
 */
- (void)initWithProductId:(NSString *)aProductId
             ursPublicKey:(NSString *)aPublicKey
  productPrivateKeyP12Psd:(NSString *)aP12KeyPassword
NEURS_DEPRECATED("已废弃，使用 -initWithProductId:ursPublicKey:productPrivateKeyP12Psd:completionBlock");

/**
 初始化 SDK。进行 SDK 的其它操作前，一定要调用此方法初始化 SDK

 @param aProductId 产品 id，由 URS 分配
 @param aPublicKey URS 公钥，由 URS 分配
 @param aP12KeyPassword 产品 p12 格式私钥，由 URS 分配的 pem 格式私钥转换后的 p12 格式私钥密码
 @param completionBlock 回调。当 App 安装后，第一次初始化成功后，会回调成功；之后用相同参数初始化，不会再次发送网络请求，直接回调成功。
 
 可能返回的错误码：
 返回值 | 返回值说明
 401 | URL语法错误、证书错误，解密pinfo失败、明文pinfo为空串或长度小于4位、错误params、params值为空字符串、无效的ctt、product不在SDK初始化接入产品列表内、product和productVersion在初始化黑名单列表内、非法设备
 402 | 初始化操作超过超过次数限制
 444 | 签名错误
 499 | SDK版本号错误
 500 | 服务器端错误
 503 | 系统繁忙
 其他错误码 | 其他错误
 */
- (void)initWithProductId:(NSString *)aProductId
             ursPublicKey:(NSString *)aPublicKey
  productPrivateKeyP12Psd:(NSString *)aP12KeyPassword
          completionBlock:(NELoginCompletionBlock _Nullable)completionBlock;

#pragma mark - 初始化后的信息
/**
 *  是否初始化成功
 *
 *  @return 已经初始化，返回 YES，否则返回 NO
 */
- (BOOL)isInitialized;
/**
 *  产品的 product id
 *
 *  @return product id
 */
- (NSString *)loginProductId;

/**
 *  初始化后的 init id
 *
 *  @return init id
 */
- (NSString *)loginInitId;

/**
 *  初始化后的 encrypted Key
 *
 *  @return encrypted Key
 */
- (NSString *)loginKey;

#pragma mark - 邮箱账号登录相关
/**
 *  URS登陆。登陆成功后，产品可以根据currentToken方法获取当前登陆token与产品服务器做进一步登陆相关操作，如根据token获取用户账号相关信息。
 *
 *  @param aType            登陆类型，当前支持登陆类型：LoginTypeURS
 *  @param aUsername        用户名
 *  @param aPassword        密码
 *  @param isMD5            密码是否经过 MD5 加密
 *  @param aCompletionBlock 回调
 */
- (void)loginWithType:(LoginType)aType
             username:(NSString *)aUsername
             password:(NSString *)aPassword
                isMD5:(BOOL)isMD5
      completionBlock:(NELoginCompletionBlock)aCompletionBlock
NEURS_DEPRECATED("已废弃，使用 -loginWithUsername:password:isMD5:completionBlock");

/**
 URS 邮箱登陆。登陆成功后，产品可以根据currentToken方法获取当前登陆token与产品服务器做进一步登陆相关操作，如根据token获取用户账号相关信息。

 @param username 用户邮箱
 @param password 密码
 @param isMD5 传入的密码是否经过 MD5
 @param completionBlock completionBlock description
 
 可能返回的错误码：
 返回值 | 返回值说明
 401	| URL语法错误或参数值非法
 412	| 10分钟内，同一个帐号和地址，使用不同的密码，连续失败6次，后续登录限制10分钟。次数限制，第二天凌晨5点后清除。
 420	| 用户不存在
 422	| 帐号锁定
 423	| VIP或188 帐号被冻结
 460  | 密码错误
 500	| 服务器错误
 503	| 服务器正在维护
 其他错误码 | 其他错误
 */
- (void)loginWithUsername:(NSString *)username
                 password:(NSString *)password
                    isMD5:(BOOL)isMD5
          completionBlock:(NELoginCompletionBlock)completionBlock;

#pragma mark - 退出登录
/**
 退出登陆。退出登陆成功后，产品可以与产品服务器做进一步退出登录相关操作。

 @param aCompletionBlock aCompletionBlock description
 
 返回值 | 返回值说明
 401 | 请求参数错误
 500 | 服务器异常
 其他错误码 | 其他错误
 */
- (void)logoutWithCompletionBlock:(NELoginCompletionBlock)aCompletionBlock;

#pragma mark - 验证token
/**
 验证当前登录token是否有效

 @param completionBlock completionBlock description
 @param failureBlock failureBlock description
 
 当 completionBlock 回调 YES 时，说明 token 有效；当 completionBlock 回调 NO 时，说明 token 已经失效。当网络失败时，会回调 failureBlock。
 
 > 注意：当 token 失效时，SDK 首先清空内部持久化的登录数据，包括 token、loginAccount、loginType、mainAccount 等，然后再回调 completionBlock NO。
 >
 > 普通的网络请求失败等等会进入失败回调。当由于没有网络而回调失败时，说明此时无法验证持久化的 token 是否有效。
 
 可能返回的错误码：
 没有暴露特定的返回码。
 */
- (void)verifyTokenWithCompletionBlock:(NELoginVerifyTokenBlock)completionBlock
                          failureBlock:(NELoginFailureBlock)failureBlock;

#pragma mark - 登录成功后相关信息接口
/**
 *  当前是否登陆
 *
 *  @return 当前是否登陆
 */
- (BOOL)isLogined;

/**
 *  当前登陆类型
 *
 *  @return 登陆类型
 */
- (LoginType)currentLoginType;

/**
 *  当前登陆账户,即用户输入的账户。
 *  1.URS登陆账号为用户输入，主账号未urs服务器返回
 *  2.共享登陆返回的登陆账户和主账户一样
 *
 *  @return 用户输入的账户
 */
- (NSString *)currentLoginAccount;

/**
 *  当前登陆主账号
 *
 *  @return 当前登陆主账号
 */
- (NSString *)currentLoginMainAccount;

/**
 *  当前登陆 token
 *
 *  @return token
 */
- (NSString *)currentToken;

/**
 *  uniqueId
 *
 *  @return uniqueId
 */
- (NSString *)uniqueId;

/**
 *  keyChain group Id
 *
 *  @return keyChain group Id
 */
- (NSString *)uniqueIDCf;

#pragma mark - 手机号注册相关功能
/*
 注册功能分两步：
 1. 获取注册验证码 - registrationCodeWithPhoneNumber:completionBlock，该手机号会收到一条短信验证码；
 2. 输入密码和上一步的验证码进行注册；
 */

/**
 获取注册验证码。
 注意，服务器下发短信条数有限制，当短时间内获取次数超过限制，则不能继续下发，并提示 411 错误；此时 aError 的 userInfo 如下：
 {
    code = zczh;
    msg = "need up sms";
    number = 106981630163331;
    result = 411;
 }
 如果此时需要服务器继续下发验证码，需要用户向服务器发送短信。字典中 number 表示手机号码，code 表示短信内容。向该手机号码发送一条包含此内容的短信，则会收到一条额外的短信验证码。
 @param phoneNumber 需要注册的手机号
 @param completionBlock isSuccess 表示接口调用成功，NO 表示失败

 可能返回的错误码：
 返回值 | 返回值说明
 201 | ok, 短信下发成功
 401 | params invalid, 参数错误; product not allowed, 产品号不允许; mobile is null or error, 手机号码错误
 411 | need up sms	 国内手机号获取验证码次数过多，需要上行短信。此时 aError 的 userInfo 是一个字典。
 412 | sms code fail over times, 手机号验证码失败次数超过阀值 (1小时清除)
 413 | sms code fail over times, 国际手机号获取验证码次数过多（默认为5次，第二天凌晨5点清除）
 427 | appid invalid	id不合法
 500 | server error, 服务器异常
 604 | user exist, 手机帐号已存在
 635 | mobile has in Inspection period, 帐号进入考察期，不能注册
 */
- (void)registrationCodeWithPhoneNumber:(NSString *)phoneNumber
                        completionBlock:(NELoginCompletionBlock)completionBlock;


/**
 手机账号注册并登录。使用 - registrationCodeWithPhoneNumber:completionBlock 获取的验证码和用户输入的密码进行注册。

 @param phoneNumber 用户手机号，需要和上一步的一样
 @param code 注册验证码
 @param password 用户输入的密码。明文，由 6~16位 ASCII 码十进制 33-126 字符组成
 @param completionBlock isSuccess 为 YES 表示注册成功，NO 表示失败
 当注册成功后，参数中的 token 为账号 token，mainAccount 为账号主账号，mobileAccount 为账号的移动别名，即手机账号，；
 当注册失败后，token、mainAccount 和 mobileAccount 皆为 nil，同时 aError 给出错误信息。
 
 注意，注册成功后，SDK 会把注册后的信息直接写到 SDK 中（token、mainAccount 和 account），相当于已处在登录状态。但由于不是真正的登录，所以此时 [LoginEngine leak]、[LoginEngine verifyTime] 、[LoginEngine securityEmail] 这四个函数不能返回正确的值。如果想获取正确的值，可以调用一次 [LoginEngine verifyTokenWithCompletionBlock:failureBlock:] 方法，此方法成功后会将服务器返回的数据存储，上面三个接口就可以获取到正确的值了。

 
 可能返回的错误码：
 返回值 | 返回值说明
 201 | ok, 注册成功
 401 | params invalid, 参数错误; product not allowed, 产品号不允许; mobile is null or error, 手机号码格式错误; smscode is null or empty, 短信验证码为空; password is null or empty, 密码为空; password does not match the rule, 密码规则不正确，或太过简单;
 412 | sms code fail over times, 验证码验证错误次数过多
 413 | sms code invalid, 验证码错误
 427 |	appid invalid, id不合法
 500 | server error, 服务器异常
 604 | user exist, 手机帐号已存在
 635 | mobile has in Inspection period, 帐号进入考察期，不能注册
 */
- (void)registerMobileAccountWithPhoneNumber:(NSString *)phoneNumber
                            registrationCode:(NSString *)code
                                    password:(NSString *)password
                             completionBlock:(void (^)(BOOL isSuccess, NSString * __nullable token, NSString * __nullable mainAccount, NSString * __nullable mobileAccount, NSError * __nullable aError))completionBlock;


#pragma mark - 手机号登录相关功能
/**
 通过手机号，获取验证码。调用此方法，则会收到一条短信验证码。
 一个手机每天可以获取的验证码次数是有限的，当超过次数限制时，会返回 error code 为 411 的错误，
 需要用户向指定手机发送指定短信，即可再次收到验证码。出现 411 错误时，error 中的 userInfo 如下：
 {
     code = zhdl;
     msg = "need up sms";
     number = 106981630163331;
     result = 411;
 }
 引导用户向 number 中的手机号发送 code 中的内容即可。

 @param phoneNumber 用户手机号
 @param referer 如果传此参数，接口将进行referer判断，对于不在白名单内的referer，将限制登录。对应返回值 433;如不传，则不做限制。
 @param completionBlock completionBlock description
 
 可能返回的错误码：
 返回值 | 返回值说明
 401 | 参数缺少或格式错误
 411 | 当国内手机号码在一定时间内发送超过5次需要发送解锁码后才能继续获取验证码
 412 | 验证码验证失败次数超过阀值阀值:20次 （1小时清除）
 413 | 下发验证码超过了次数限制。国际号5次
 414 | 次数限制：您的IP登录错误次数过多，请稍候再试 注：目前配置IP错误次数10分钟达到1000次锁定10分钟
 415 | 次数限制：您今天登录错误次数已经太多,请明天再试(同一user)，(验证码和密码登入总和)100次
 416 | 次数限制：您的IP今天登录过于频繁，请稍后再试 注：目前配置距离此IP上次成功登录在100毫秒之内
 417 | 您的IP今天登录次数过多，请明天再试 注：目前配置IP今天成功录陆次数超过60000次
 418 | 您今天登录次数过多,请明天再试 注：目前配置用户今天成功登录次数超过300次
 419 | 您的登录操作过于频繁 注：目前配置距离此用户上次成功登录在100毫秒之内
 422 | 帐号被锁定
 427 | 传入的app ID非法（需要对此返回值进行处理：如出现此返回值，需要重新进行客户端的初始化操作）
 433 | Referer 受限
 601 | 非手机帐号
 602 | 用户已冻结
 500 | 处理失败或服务器端错误。
 其他错误码 | 其他错误
 */
- (void)verificationCodeWithPhoneNumber:(NSString *)phoneNumber
                                referer:(NSString * _Nullable)referer
                        completionBlock:(NELoginCompletionBlock)completionBlock;

/**
 通过手机号以及收到的验证码登录

 @param phoneNumber 用户手机号
 @param verificationCode 刚刚收到的验证码
 @param loginException 是否返回异常登录状态。传 kUrsLoginExceptionStatus 表示需要返回，kUrsLoginExceptionStatusFlag 表示需要返回异常并且带回是否盗号标记。如果传入 nil，默认是 kUrsLoginExceptionStatus
 @param needLeakInfo 是否返回泄漏标记
 @param completionBlock completionBlock description
 
 如果传递 loginException，则可能返回的值为：
 
 loginException | 描述
 ---- | ----
 10  | 本次登录是正常登录
 0   | 本次登录是异地登录
 1   | 本次登录是异常登录：用户登录次数过多
 2   | 本次登录是异常登录：被恶意登录过
 01  | 异常登录：异地且用户登录次数过多
 02  | 异常登录：异地且被恶意登录过
 
 可能返回的错误码：
 返回值 | 返回值说明
 401 | 参数缺少或格式错误,产品受限制
 412 | 验证码失败次数超过阀值。阀值：20次 （1小时清除）
 413 | 验证码不正确
 415 | 次数限制：您今天登录错误次数已经太多,请明天再试(同一user)，(验证码和密码登入总和)100次 移动端登入失败分两种情况： 1.验证码错误，帐号不存在：不记登入失败次数 2.验证码错误，帐号存在： 登入失败增1
 420 | 创建用户失败，返回用户不存在
 422 | 帐号已被锁定
 602 | 用户已冻结
 427 | 传入的app ID非法（需要对此返回值进行处理：如出现此返回值，需要重新进行客户端的初始化操作）
 500 | 处理失败或服务器端错误或缓存，数据库查询异常
 其他错误码 | 其他错误
 */
- (void)loginWithPhoneNumber:(NSString *)phoneNumber
            verificationCode:(NSString *)verificationCode
              loginException:(NSString * _Nullable)loginException
                needLeakInfo:(BOOL)needLeakInfo
             completionBlock:(NELoginCompletionBlock)completionBlock;

/**
 通过手机号和密码登录

 @param phoneNumber 用户手机号
 @param password 用户密码
 @param isMD5 用户密码是否经过 MD5
 @param loginException 是否返回异常登录状态。传 kUrsLoginExceptionStatus 表示需要返回，kUrsLoginExceptionStatusFlag 表示需要返回异常并且带回是否盗号标记。如果传入 nil，默认是 kUrsLoginExceptionStatus
 @param needLeakInfo 是否返回泄漏标记
 @param referer 如果传此参数，接口将进行referer判断，对于不在白名单内的referer，将限制登录。对应返回值 433;如不传，则不做限制。
 @param completionBlock completionBlock description
 
 可能返回的错误码：
 返回值 | 返回值说明
 401 | 参数缺少或格式错误或产品接口限制
 412 | 访问不存在用户超过限制 不存在用户阀值: 限制生效1分钟内限制30次（5分钟内自动清除） 密码登入不限制验证码验证失败次数
 413 | 密码不正确
 414 | 次数限制：您的IP登录错误次数过多，请稍候再试 注：目前配置IP错误次数10分钟达到1000次锁定10分钟
 415 | 次数限制：您今天登录错误次数已经太多,请明天再试(验证码和密码登入总和)100次
 416 | 次数限制：您的IP今天登录过于频繁，请稍后再试 注：目前配置距离此IP上次成功登录在100毫秒之内
 417 | 您的IP今天登录次数过多，请明天再试 注：目前配置IP今天成功录陆次数超过60000次
 418 | 您今天登录次数过多,请明天再试 注：目前配置用户今天成功登录次数超过300次
 419 | 您的登录操作过于频繁，请稍候再试 注：目前配置距离此用户上次成功登录在100毫秒之内
 420 | 用户不存在
 422 | 帐号已被锁定
 427 | 传入的app ID非法（需要对此返回值进行处理：如出现此返回值，需要重新进行客户端的初始化操作）
 433 | Referer 受限
 601 | 帐号非移动帐号
 602 | 帐号已冻结
 609 | 强制用户验证码登入
 635 | 账号已进入考察期，不能登陆
 500 | 处理失败或服务器端错误。
 其他错误码 | 其他错误

 */
- (void)loginWithPhoneNumber:(NSString *)phoneNumber
                    password:(NSString *)password
               isMD5Password:(BOOL)isMD5
              loginException:(NSString *_Nullable)loginException
                needLeakInfo:(BOOL)needLeakInfo
                     referer:(NSString *_Nullable)referer
             completionBlock:(NELoginCompletionBlock)completionBlock;

#pragma mark - 手机号登录相关信息
/**
 *  返回异常状态信息
 *
 *  @return 异常状态信息
 */
- (NSString *)loginException;

/**
 *  返回账号是否泄露
 *
 *  @return 账号是否泄露
 */
- (BOOL)leak;

/**
 *  返回上次登录时间
 *
 *  @return 上次登录时间
 */
- (NSString *)verifyTime;

/**
 *  返回是否有密保邮箱
 *
 *  @return 是否有密保邮箱
 */
- (BOOL)securityEmail;

/**
 *  返回是否设置过密码
 *
 *  @return 是否设置过密码
 */
- (BOOL)hasPassword;

#pragma mark - Ticket 相关
/**
 使用当前登录的 token 置换 ticket。有效时间 5 mins

 @param successBlock successBlock，回调中的参数为使用当前 token 置换后的 ticket
 @param failureBlock failureBlock description
 */
- (void)ticketWithSuccess:(void (^)(NSString *ticket))successBlock
             failureBlock:(NELoginFailureBlock)failureBlock;

/**
 使用当前登录 SDK 的帐号登录网页

 @param loginURLString 需要登录的网页 URL，必传。需要 URL Encode 后传入。
 @param errorPageURLString 错误页面。需要 URL Encode 后传入。
 @param extraDomains 还需要设置的其他跨域cookie的域，多个域之间以,分隔，如：@"163.com,126.com"
 @param successBlock successBlock，返回根据参数以及置换的 ticket 拼接而成的 URLString，可以直接登录
 @param failureBlock failureBlock description
 
 这个异步接口首先发送网络请求，使用当前登录帐号的 token 去置换 ticket（所以一定要在登录状态下调用此接口）；之后根据传入的参数，拼接成一个自动登录的 URL 传入 successBlock 中，产品直接使用 autoLoginURL 去打开 web 页面，即可实现自动登录。
 
 可能返回的错误码：
 返回值 | 返回值说明
 400 | token 失效
 401 | URL语法错误或参数值非法，或TICKET过期
 420 | 用户名不存在
 422 | 帐号被锁定，请您解锁后再登录!
 500 | 系统繁忙，请您稍后再试！
 503 | 服务器正在维护
 其他错误码 | 其他错误
 */
- (void)ticketAutoLoginPage:(NSString *)loginURLString
                  errorPage:(NSString * _Nullable)errorPageURLString
               extraDomains:(NSString * _Nullable)extraDomains
                    success:(void (^)(NSString *autoLoginURL))successBlock
               failureBlock:(NELoginFailureBlock)failureBlock;

#pragma mark - Ticket 开放接口
/**
 使用给定的 token 置换 ticket。有效时间 5 mins

 @param token token
 @param successBlock 回调中的参数为使用当前 token 置换后的 ticket
 @param failureBlock failureBlock description
 */
- (void)ticketWithToken:(NSString *)token
                success:(void (^)(NSString *ticket))successBlock
           failureBlock:(NELoginFailureBlock)failureBlock;


/**
 使用当前登录 SDK 的帐号登录网页

 @param token 特定的 token
 @param loginURLString 需要登录的网页 URL，必传
 @param errorPageURLString 错误页面
 @param extraDomains 还需要设置的其他跨域cookie的域，多个域之间以,分隔，如：@"163.com,126.com"
 @param successBlock successBlock，返回根据参数以及置换的 ticket 拼接而成的 URLString，可以直接登录
 @param failureBlock failureBlock description
 
 这个异步接口首先发送网络请求，使用传入的 token 去置换 ticket；之后根据传入的参数，拼接成一个自动登录的 URL 传入 successBlock 中，产品直接使用 autoLoginURL 去打开 web 页面，即可实现自动登录。
 
 可能返回的错误码：
 返回值 | 返回值说明
 400 | token 失效
 401 | URL语法错误或参数值非法，或TICKET过期
 420 | 用户名不存在
 422 | 帐号被锁定，请您解锁后再登录!
 500 | 系统繁忙，请您稍后再试！
 503 | 服务器正在维护
 其他错误码 | 其他错误
 */
- (void)ticketAutoLoginWithToken:(NSString *)token
                            page:(NSString *)loginURLString
                       errorPage:(NSString * _Nullable)errorPageURLString
                    extraDomains:(NSString * _Nullable)extraDomains
                         success:(void (^)(NSString *autoLoginURL))successBlock
                    failureBlock:(NELoginFailureBlock)failureBlock;

#pragma mark - 共享登陆统一UI接口
/**
 *  共享登陆统一UI接口
 *
 *  @param aContext         上下文环境
 *  @param aCompletionBlock 共享登陆完成回调
 */
- (void)showShareViewControllerInContext:(__kindof UIViewController *)aContext
                         completionBlock:(NELoginCompletionBlock)aCompletionBlock;

#pragma mark - 共享登录
/**
 请求当前 device 上已经登录成功的 app ticket 列表.同一个产品下只取最近一次登录的用户

 @param completionBlock completionBlock description
 @param failureBlock failureBlock description
 
 可能返回的错误码：
 返回值 | 返回值说明
 401 | 参数错误 ctt错误
 402 | 非法yd-meta id不是sdk格式 高频扫描限制 非法uniqueID或uniqueID_cf
 403 | 产品未开启共享登录功能
 427 | 无效id
 444 | 签名错误
 499 | 不可信的yd-version
 500 | 服务器错误
 503 | 系统繁忙
 其他错误码 | 其他错误
 */
- (void)requestTicketListWithCompletionBlock:(NELoginTicketCompletionBlock)completionBlock
                                failureBlock:(NELoginFailureBlock)failureBlock;

/**
 *  共享登陆
 *
 *  @param aType            登陆类型，当前支持登陆类型：LoginTypeShare
 *  @param aTicket          已经登录app ticket，由requestTicketListWithCompletionBlock接口请求返回
 *  @param aCompletionBlock 回调
 */
- (void)loginWithType:(LoginType)aType
               ticket:(NSString *)aTicket
      completionBlock:(NELoginCompletionBlock)aCompletionBlock
NEURS_DEPRECATED("已废弃，使用 -shareLoginWithTicket:completionBlock:");


/**
 使用 ticket 进行共享登录

 @param ticket 已经登录app ticket，由requestTicketListWithCompletionBlock接口请求返回
 @param completionBlock completionBlock description
 
 可能返回的错误码：
 返回值 | 返回值说明
 400 | 无效的 ticket 用户上次修改信息时间晚于token创建时间
 401 | 参数错误  ctt错误
 402 | 非法yd-meta id不是sdk格式
 420 | 帐号不存在
 422 | 帐号被锁定
 427 | 无效id
 444 | 签名错误
 499 | 不可信的yd-version
 500 | 服务器错误
 503 | 系统繁忙
 其他错误码 | 其他错误
 */
- (void)shareLoginWithTicket:(NSString *)ticket
             completionBlock:(NELoginCompletionBlock)completionBlock;



#pragma mark - 二维码登录相关
/**
 二维码扫描成功后，调用此接口，通知服务器手机已经扫描到信息

 @param UUID 二维码图片中的 UUID
 @param product 二维码图片中的 product
 @param completionBlock completionBlock description
 
 通知服务器已经扫码成功，此时，浏览器网页一般会显示「扫码成功」的提示。
 
 可能返回的错误码：
 返回值 | 返回值说明
 400 | token 失效
 401 | 参数错误  ctt错误
 404 | uuid过期
 407 | 此产品的二维码不容许当前客户端扫描
 408 | 二维码状态错误，二维码状态不是初始化状态、也不是扫描成功状态，但是请求操作类型为二维码登录操作
 409 | 作二维码状态错误，二维码不是扫描成功状态，但是请求操作类型为二维码登录确认操作
 422 | 帐号被锁定
 423 | VIP或188帐号服务已到期
 424 | 靓号服务已到期
 480 | 动态密码错误
 481 | 该密码已经被正确验证过或该token一段时间内验证次数过多
 482 | 将军令没有被启用
 500 | 服务器错误
 503 | 系统繁忙
 505 | 将军令认证系统其它错误
 其他错误码 | 其他错误
 */
- (void)scannedQRCodeUUID:(NSString *)UUID
                  product:(NSString *)product
          completionBlock:(NELoginCompletionBlock)completionBlock;

/**
 当用户确认登录时，调用此接口，验证本地 token 是否有效

 @param UUID 二维码图片中的 UUID
 @param product 二维码图片中的 product
 @param customToken 想要验证的 token。如果传 nil，默认使用本地 token
 @param completionBlock completionBlock description
 
 可能返回的错误码：同 - scannedQRCodeUUID 接口
 */
- (void)verifyTokenQRCodeUUID:(NSString *)UUID
                      product:(NSString *)product
                  customToken:(NSString * _Nullable)customToken
              completionBlock:(NELoginCompletionBlock)completionBlock;

/**
 当验证本地 token 有效后，调用此接口，通知服务器用户确认登录。

 @param UUID 二维码图片中的 UUID
 @param product 二维码图片中的 product
 @param customToken 想要验证的 token。如果传 nil，默认使用本地 token
 @param completionBlock completionBlock description
 
 可能返回的错误码：同 - scannedQRCodeUUID 接口
 */
- (void)confirmQRCodeUUID:(NSString *)UUID
                  product:(NSString *)product
              customToken:(NSString * _Nullable)customToken
          completionBlock:(NELoginCompletionBlock)completionBlock;

#pragma mark - 设置域名

/**
 当前 SDK 使用的域名，默认是 reg.163.com
 
 @return 当前域名
 */
- (NSString *)currentDomain;

/**
 设置 SDK 的域名。之后所有的网络请求都使用这个域名
 
 @param domain 新的域名。
 */
- (void)setDomain:(NSString *)domain;

#pragma mark - HTTPS
/**
 设置协议是否是 https
 
 @param isHttps YES 则使用 https，NO 则使用 http
 */
- (void)setHttps:(BOOL)isHttps;

/**
 当前是否是 https 协议
 
 @return 是 https 则返回 YES，是 http 则返回 NO
 */
- (BOOL)isHttps;

#pragma mark - 兼容
/**
 *  老的登录逻辑接入SDK后，更新当前的登录状态。用于旧登录接口与新登录接口的兼容，将旧登录接口的参数更新为新接口的参数，更新完后共享登录可以使用。
 *
 *  @param aInitId          初始化id，必传。更新成功后通过 - (NSString *)loginInitId接口获取新的id.
 *  @param aKey             初始化key，必传。更新成功后通过 - (NSString *)loginKey接口获取新的key.
 *  @param aToken           非必传，登录token。
 *  @param aCompletionBlock 回调
 */
- (void)updateLoginStateWithId:(NSString *)aInitId
                           key:(NSString *)aKey
                         token:(NSString *)aToken
               completionBlock:(NELoginCompletionBlock)aCompletionBlock;

#pragma mark - 取消当前请求
/**
 *  取消当前所有请求
 */
- (void)reset;
@end
NS_ASSUME_NONNULL_END
