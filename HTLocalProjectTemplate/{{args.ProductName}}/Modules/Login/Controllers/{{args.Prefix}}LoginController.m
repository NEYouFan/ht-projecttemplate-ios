//
//  {{args.Prefix}}LoginController.m
//  {{args.ProductName}}
//
//  Created by {{args.Author}} on 15/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "{{args.Prefix}}LoginController.h"
#import "RKMappingResult+{{args.Prefix}}NetworkResultMapping.h"
#import "UIView+Frame.h"
#import "UIView+{{args.Prefix}}Toast.h"
#import "{{args.Prefix}}BaseViewController+{{args.Prefix}}CustomNavigationBar.h"
#import "{{args.Prefix}}KeyboardSequence.h"
#import "{{args.Prefix}}LoginInputView.h"
#import "{{args.Prefix}}UserDataManager.h"
#import "UIView+{{args.Prefix}}Loading.h"
#import "NSObject+{{args.Prefix}}BaseRequest.h"
#import "{{args.Prefix}}CommonStyleViews.h"
#import "HTControllerRouter.h"

static NSString *const kSuccessBlockKey = @"successBlock";
static NSString *const kCancelBlockKey = @"cancelBlock";
static NSString *const kToastMessage = @"toastMessage";

/// 用户名输入框距离屏幕顶部的距离
static const CGFloat kUserNameInputViewTopMargin = 100;
/// 输入框左右距离屏幕边缘的距离
static const CGFloat kInputViewSideMargin = 20;
/// 输入框的高度
static const CGFloat kInputViewHeight = 30;
/// 登录按钮的高度
static const CGFloat kLoginButtonHeight = 20;
/// 密码输入框顶部与用户名输入框底部的距离
static const CGFloat kPasswordUserNameGap = 20;
/// 登录按钮顶部距离密码输入框底部的距离
static const CGFloat kLoginPasswordGap = 20;
/// 忘记密码按钮顶部与登录按钮底部的距离
static const CGFloat kForgetLoginGap = 10;
/// 注册按钮顶部与登录按钮底部的距离
static const CGFloat kRegisterLoginGap = 10;

@interface {{args.Prefix}}LoginController () <HTRouteTargetProtocol,
                                              HTContainerViewControllerProtocol,
                                              UITextFieldDelegate,
                                              UITextViewDelegate>

/// 所有 view 的容器
@property (nonatomic, strong) UIView *containerView;
/// 背景图
@property (nonatomic, strong) UIImageView *backgroundView;
/// 用户名输入框
@property (nonatomic, strong) {{args.Prefix}}LoginInputView *userNameInputView;
/// 密码输入框
@property (nonatomic, strong) {{args.Prefix}}LoginInputView *passwordInputView;
/// 登录按钮
@property (nonatomic, strong) UIButton *loginButton;
/// 忘记密码按钮
@property (nonatomic, strong) UIButton *forgetPasswordButton;
/// 注册按钮
@property (nonatomic, strong) UIButton *registerButton;
/// 关闭登录页面按钮
@property (nonatomic, strong) UIButton *closeButton;
/// 多个输入框的键盘管理
@property (nonatomic, strong) {{args.Prefix}}KeyboardSequence *keyboardSequenceManager;
/// 展示登录页面时的 toast 提示信息
@property (nonatomic, copy) NSString *toastMessage;
/// 登录成功后执行的操作
@property (nonatomic, copy) void (^successBlock)();
/// 取消登陆后执行的操作
@property (nonatomic, copy) void (^cancelBlock)();

@end

@implementation {{args.Prefix}}LoginController
@synthesize containerController;

#pragma mark - Router
// HTUniversalRouter 的使用请参考文档说明

+ (HTControllerRouterConfig*)configureRouter {
    HT_EXPORT();
    HTControllerRouterConfig *config = [[HTControllerRouterConfig alloc] initWithUrlPath:[self urlPath]];
    return config;
}

+ (NSString*)urlPath {
    return @"{{args.ProductName}}://login";
}

- (void)receiveRoute:(HTControllerRouteParam*)param {
    _successBlock = [param.params objectForKey:kSuccessBlockKey];
    _cancelBlock = [param.params objectForKey:kCancelBlockKey];
    _toastMessage = [param.params objectForKey:kToastMessage];
}


#pragma mark - Life cycle.

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadSubViews];
    self.view.backgroundColor = [UIColor colorWithRGBValue:kDefaultBackgroundColor];
    [self {{args.CategoryPrefix}}_applyTransparentNavigationBarDarkStatus];
    _closeButton = [self {{args.CategoryPrefix}}_addNavigationRightCloseItem];
    [_closeButton addTarget:self action:@selector(closeLogin:) forControlEvents:UIControlEventTouchUpInside];
    [self configKeyboard];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if (_toastMessage) {
        [self.view {{args.CategoryPrefix}}_showToastWithMessage:_toastMessage];
    }
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    _containerView.frame = self.view.bounds;
    _backgroundView.frame = _containerView.bounds;
    
    _userNameInputView.width = _containerView.width - kInputViewSideMargin * 2;
    _userNameInputView.height = kInputViewHeight;
    _userNameInputView.x = kInputViewSideMargin;
    _userNameInputView.y = kUserNameInputViewTopMargin;
    
    _passwordInputView.width = _userNameInputView.width;
    _passwordInputView.height = _userNameInputView.height;
    _passwordInputView.x = _userNameInputView.x;
    _passwordInputView.y = _userNameInputView.bottom + kPasswordUserNameGap;
    
    _loginButton.width = _userNameInputView.width;
    _loginButton.height = kLoginButtonHeight;
    _loginButton.x = _userNameInputView.x;
    _loginButton.y = _passwordInputView.bottom + kLoginPasswordGap;
    
    [_forgetPasswordButton sizeToFit];
    _forgetPasswordButton.x = _loginButton.x;
    _forgetPasswordButton.y = _loginButton.bottom + kForgetLoginGap;
    
    [_registerButton sizeToFit];
    _registerButton.tail = _loginButton.tail;
    _registerButton.y = _loginButton.bottom + kRegisterLoginGap;
}


#pragma mark - Load views.

- (void)loadSubViews {
    _containerView = [[UIView alloc] init];
    [self.view addSubview:_containerView];
    
    // 添加背景图片
    _backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login_background"]];
    // 可以针对尺寸不匹配标准尺寸的图片进行设置 contentMode
    _backgroundView.contentMode = UIViewContentModeTop;
    [_containerView addSubview:_backgroundView];

    // 这里复用 loadingReloadButton 的样式，实际产品中请根据视觉要求设置 button 样式
    _loginButton = [{{args.Prefix}}CommonStyleViews loadingReloadButton];
    [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [_loginButton addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [_containerView addSubview:_loginButton];
    
    // 忘记密码按钮
    _forgetPasswordButton = [{{args.Prefix}}CommonStyleViews loadingReloadButton];
    [_forgetPasswordButton setTitle:@"忘记密码" forState:UIControlStateNormal];
//    [_forgetPasswordButton addTarget:self action:@selector(forgetPassword:) forControlEvents:UIControlEventTouchUpInside];
    [_containerView addSubview:_forgetPasswordButton];
    
    // 注册按钮
    _registerButton = [{{args.Prefix}}CommonStyleViews loadingReloadButton];
    [_registerButton setTitle:@"注册" forState:UIControlStateNormal];
//    [_registerButton addTarget:self action:@selector(registerUser:) forControlEvents:UIControlEventTouchUpInside];
    [_containerView addSubview:_registerButton];
    
    // 用户名输入框
    _userNameInputView = [[{{args.Prefix}}LoginInputView alloc] initWithImageName:@"login_user_name" placeholder:@"手机号码"];
    // 可以设置 self 为 UITextField 的 delegate，用于处理回调。例如：根据用户名的输入实时进行智能补全时，需要在代理中做一些处理，本例中不提供自动补全功能(使用者请根据交互视觉需求自己实现)
    _userNameInputView.inputTextField.delegate = self;
    [_containerView addSubview:_userNameInputView];
    
    // 密码输入框
    _passwordInputView = [[{{args.Prefix}}LoginInputView alloc] initWithImageName:@"login_password" placeholder:@"密码"];
    _passwordInputView.inputTextField.secureTextEntry = YES;
    [_containerView addSubview:_passwordInputView];
}


#pragma mark - Public methods.

+ (void)showLoginControllerWithToastMessage:(NSString *)message successBlock:(void (^)(void))successBlock cancelBlock:(void (^)(void))cancelBlock {
    __weak __block UIViewController *loginController;
    HTControllerRouteParam *param = [[HTControllerRouteParam alloc] init];
    param.url = [self urlPath];
    param.launchMode = HTControllerLaunchModePresentNavigation;
    
    NSMutableDictionary *paramDic = [[NSMutableDictionary alloc] init];
    [paramDic setObject:^(){
        [loginController dismissViewControllerAnimated:YES
                                            completion:^{
                                                if (successBlock) {
                                                    successBlock();
                                                }
                                            }];
    } forKey:kSuccessBlockKey];
    
    [paramDic setObject:message forKey:kToastMessage];
    
    if (nil != cancelBlock) {
        [paramDic setObject:cancelBlock forKey:kCancelBlockKey];
    }
    
    param.params = [paramDic copy];
    param.fromViewController = APPDELEGATE().rootNavigationController;
    loginController = [[HTControllerRouter sharedRouter] route:param];
}


#pragma mark - UITextFieldDelegate.

// 根据需求自定义实现


#pragma mark - Actions.

- (void)login {
    // 点击登录按钮后，可以检查用户名输入框和密码输入框输入的文本是否合法，例如：用户名要求是合法手机号，密码要求6-16位字母和数字，等等。这里只给出使用正则检查的示例代码，对正则不熟悉的需要巩固下基础知识。
    if (![self isValidPhoneNumber:_userNameInputView.text]){
        [self.view {{args.CategoryPrefix}}_showToastWithMessage:@"请输入正确的手机号码"];
        return;
    }
    
    if (![self isValidPassword:_passwordInputView.text]) {
        [self.view {{args.CategoryPrefix}}_showToastWithMessage:@"密码为6-16为英文或数字"];
        return;
    }
    
    @{{args.Prefix}}Weak(self);
    [self.view {{args.CategoryPrefix}}_showLoadingWithIndication:@"正在登录" backgroundColor:[UIColor clearColor]];
    
    // 发送登录的请求
    [self baseFlowRequestWithBlock:^HTBaseRequest *{
//        {{args.Prefix}}LoginRequest *request = [[{{args.Prefix}}LoginRequest alloc] init];
//        request.account = _userNameInputView.text;
//        request.password = _passwordInputView.text; // 请使用https post方法，保障密码安全；或者对密码加密；
//        [weakSelf cancelRequestWhenControllerDealloc:request];
//        return request;
        return nil;
    } success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        // 获取成功响应的数据，一般包含用户名、token等信息，将这些信息更新到 {{args.Prefix}}UserDataManager 中
//        {{args.Prefix}}LoginResultModel *result = mappingResult.resultInfo;
//        [{{args.Prefix}}UserDataManager sharedInstance].userName = result.name;
//        [{{args.Prefix}}UserDataManager sharedInstance].phoneNumber = weakSelf.userNameInputView.text;
//        [{{args.Prefix}}UserDataManager sharedInstance].token = result.ak;
//        [[{{args.Prefix}}UserDataManager sharedInstance] setAlreadyLogin:YES];
//        [weakSelf.view {{args.CategoryPrefix}}_hideLoading];
//        [weakself.delegate loginsuccess:self];
//        if (weakself.successblock) {
//            weakself.successblock();
//        }
//        [weakself.view {{args.categoryprefix}}_hideloading];
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        [weakSelf.view {{args.CategoryPrefix}}_hideLoading];
        [weakSelf.view {{args.CategoryPrefix}}_showToastWithMessage:@"用户名或密码错误"];
        // 登录失败，建议清除用户信息
        [[{{args.Prefix}}UserDataManager sharedInstance] clearUserInfo];
    }];
    
    // 上面给出了实际写业务代码时的示例。下面是本工程为了展示页面，创建模拟数据，并执行了 request 成功的逻辑。注意下面的代码只是示例用，实际应用开发的代码中请填写上面的代码，将下面的这些代码删除。
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [NSThread sleepForTimeInterval:2];
        dispatch_async(dispatch_get_main_queue(), ^{
            [{{args.Prefix}}UserDataManager sharedInstance].userName = @"HTTemplate";
            [{{args.Prefix}}UserDataManager sharedInstance].phoneNumber = weakSelf.userNameInputView.text;
            [{{args.Prefix}}UserDataManager sharedInstance].token = @"token";
            [[{{args.Prefix}}UserDataManager sharedInstance] setAlreadyLogin:YES];
            
            [weakSelf.view {{args.CategoryPrefix}}_hideLoading];
            [weakSelf.delegate loginSuccess:self];
            if (weakSelf.successBlock) {
                weakSelf.successBlock();
            }
            [weakSelf.view {{args.CategoryPrefix}}_hideLoading];
            [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
        });
    });
}

- (BOOL)isValidPhoneNumber:(NSString*)phoneNumber {
    NSString * MOBILE = @"\\d{11}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    if ([regextestmobile evaluateWithObject:phoneNumber]) {
        return YES;
    }
    return NO;
}

- (BOOL)isValidPassword:(NSString *)password {
    NSString *passwordRegex = @"^[0-9a-zA-Z]{6,16}";
    NSPredicate *passwordRegexPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", passwordRegex];
    if ([passwordRegexPredicate evaluateWithObject:password]) {
        return YES;
    }
    return NO;
}

- (void)closeLogin:(id)sender {
    if ([_delegate respondsToSelector:@selector(loginFailed:)]) {
        [_delegate loginCanceled:self];
    }
    if (_cancelBlock) {
        _cancelBlock();
    }
    
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - Config keyboard.

- (void)configKeyboard {
    _keyboardSequenceManager = [[{{args.Prefix}}KeyboardSequence alloc] init];
    _keyboardSequenceManager.delegate = self;
    [_keyboardSequenceManager addTextFieldView:_userNameInputView.inputTextField];
    [_keyboardSequenceManager addTextFieldView:_passwordInputView.inputTextField returnKeyType:UIReturnKeyGo];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == _passwordInputView.inputTextField){
        [self login];
    }
    
    return YES;
}

@end
