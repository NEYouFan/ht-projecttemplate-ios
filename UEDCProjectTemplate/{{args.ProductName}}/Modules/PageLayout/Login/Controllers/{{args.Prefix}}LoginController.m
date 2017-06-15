//
//  {{args.Prefix}}LoginController.m
//  {{args.Prefix}}
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
#import "UIView+{{args.Prefix}}Toast.h"
#import "UIView+HTToast.h"
#import <NELoginSDK/NELoginSDK.h>

static NSString *const kSuccessBlockKey = @"successBlock";
static NSString *const kCancelBlockKey = @"cancelBlock";
static NSString *const kToastMessage = @"toastMessage";

/// logo距离屏幕顶部的距离
static const CGFloat kLogoTopMargin = 95;
/// logo与用户名输入框的距离
static const CGFloat kLogoUserNameMargin = 95;
/// 输入框左右距离屏幕边缘的距离
static const CGFloat kInputViewSideMargin = 30;
/// 输入框的高度
static const CGFloat kInputViewHeight = 42;
/// 登录按钮的高度
static const CGFloat kLoginButtonHeight = 42;
/// 密码输入框顶部与用户名输入框底部的距离
static const CGFloat kPasswordUserNameGap = 25;
/// 登录按钮顶部距离密码输入框底部的距离
static const CGFloat kLoginPasswordGap = 45;
/// 忘记密码按钮顶部与密码输入框底部的距离
static const CGFloat kForgetPasswordGap = 4;
/// 忘记密码左边距
static const CGFloat kForgetLeftMargin = 45;
/// 点击输入框后，用户名输入框距离顶部的距离
static const CGFloat kUserNameTopMargin = 100;

static const CGFloat kAnimaionOffset = 215;

@interface {{args.Prefix}}LoginController () <HTRouteTargetProtocol,
                                   HTContainerViewControllerProtocol,
                                   UITextFieldDelegate,
                                   UITextViewDelegate>

/// 所有 view 的容器
@property (nonatomic, strong) UIView *containerView;
/// Logo图
@property (nonatomic, strong) UIImageView *logoImageView;
/// 用户名输入框
@property (nonatomic, strong) {{args.Prefix}}LoginInputView *userNameInputView;
/// 密码输入框
@property (nonatomic, strong) {{args.Prefix}}LoginInputView *passwordInputView;
/// 登录按钮
@property (nonatomic, strong) UIButton *loginButton;
/// 忘记密码按钮
@property (nonatomic, strong) UIButton *forgetPasswordButton;
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

+ (HTControllerRouterConfig*)configureRouter {
    HT_EXPORT();
    HTControllerRouterConfig *config = [[HTControllerRouterConfig alloc] initWithUrlPath:[self urlPath]];
    return config;
}

+ (NSString*)urlPath {
    return @"{{args.Prefix}}://login";
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
    [self configKeyboard];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardShow) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardHide) name:UIKeyboardDidHideNotification object:nil];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
    
    _logoImageView.size = CGSizeMake(120, 120);
    _logoImageView.middleX = _containerView.width / 2;
    _logoImageView.y = SCALE(kLogoTopMargin);
    
    _userNameInputView.width = _containerView.width - kInputViewSideMargin * 2;
    _userNameInputView.height = kInputViewHeight;
    _userNameInputView.x = kInputViewSideMargin;
    _userNameInputView.y = _logoImageView.bottom + SCALE(kLogoUserNameMargin);
    
    _passwordInputView.width = _userNameInputView.width;
    _passwordInputView.height = _userNameInputView.height;
    _passwordInputView.x = _userNameInputView.x;
    _passwordInputView.y = _userNameInputView.bottom + kPasswordUserNameGap;
    
    _loginButton.width = _userNameInputView.width;
    _loginButton.height = kLoginButtonHeight;
    _loginButton.x = _userNameInputView.x;
    _loginButton.y = _passwordInputView.bottom + kLoginPasswordGap;
    
    [_forgetPasswordButton sizeToFit];
    _forgetPasswordButton.x = kForgetLeftMargin;
    _forgetPasswordButton.y = _passwordInputView.bottom + kForgetPasswordGap;
}


#pragma mark - Load views.

- (void)loadSubViews {
    _containerView = [[UIView alloc] init];
    _containerView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_containerView];
    
    // 添加背景图片
    _logoImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login_logo"]];
    [_containerView addSubview:_logoImageView];

    _loginButton = [{{args.Prefix}}CommonStyleViews loginStyleButtonWithTitle:@"登录"];
    [_loginButton addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [_containerView addSubview:_loginButton];
    
    // 忘记密码按钮
    _forgetPasswordButton = [[UIButton alloc] init];
    [_forgetPasswordButton setTitle:@"忘记密码?" forState:UIControlStateNormal];
    [_forgetPasswordButton setTitleColor:[UIColor colorWithRGBValue:kLightTextColor] forState:UIControlStateNormal];
    _forgetPasswordButton.titleLabel.font = [UIFont systemFontOfSize:kThirdClassContentFontSize];
    _forgetPasswordButton.backgroundColor = [UIColor clearColor];
    
    [_containerView addSubview:_forgetPasswordButton];
    
    // 用户名输入框
    _userNameInputView = [[{{args.Prefix}}LoginInputView alloc] initWithPlaceholder:@"用户名"];
    // 可以设置 self 为 UITextField 的 delegate，用于处理回调。例如：根据用户名的输入实时进行智能补全时，需要在代理中做一些处理，本例中不提供自动补全功能(使用者请根据交互视觉需求自己实现)
    _userNameInputView.inputTextField.delegate = self;
    [_containerView addSubview:_userNameInputView];
    
    // 密码输入框
    _passwordInputView = [[{{args.Prefix}}LoginInputView alloc] initWithPlaceholder:@"密码"];
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


#pragma mark - Actions.

- (void)login {
     @{{args.Prefix}}Weak(self);
    // 点击登录按钮后，可以检查用户名输入框和密码输入框输入的文本是否合法，例如：用户名要求是合法手机号，密码要求6-16位字母和数字，等等。这里只给出使用正则检查的示例代码，对正则不熟悉的需要巩固下基础知识。
    if (!_userNameInputView.text || [_userNameInputView.text isEqualToString:@""]){
        [self.view {{args.CategoryPrefix}}_showToastWithMessage:@"请输入用户名"];
        return;
    }
    
    if (![self isValidPassword:_passwordInputView.text]) {
        [self.view {{args.CategoryPrefix}}_showToastWithMessage:@"密码为6-16为英文或数字"];
        return;
    }
    
    [self.view {{args.CategoryPrefix}}_makeToastActivityWithMessage:@"登录中..."];
    
    [LoginEngine loginWithUsername:_userNameInputView.text
password:_passwordInputView.text isMD5:NO completionBlock:^(BOOL isSuccess, NSError *aError) {
    [weakSelf.view {{args.CategoryPrefix}}_hideToastActivity];
    if (isSuccess) {
        [weakSelf.view makeToast:@"登录成功" duration:0.5 position:HTToastPositionCenter];
        // 发送登录的请求, 登录成功后保存用户数据，如用户名、性别等信息，例如下面示例代码：
        [{{args.Prefix}}UserDataManager sharedInstance].userName = _userNameInputView.text;
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.5 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
            [weakSelf ht_back];
            
            //退出登录
            [LoginEngine logoutWithCompletionBlock:^(BOOL isSuccess, NSError *aError) {
                [[{{args.Prefix}}UserDataManager sharedInstance] clearUserInfo];//清空当前存储的用户信息
            }];
        });
    } else {
        [weakSelf.view makeToast:@"登录失败" duration:0.5 position:HTToastPositionCenter];
    }
}];
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

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.logoImageView.y = SCALE(kLogoTopMargin) - kAnimaionOffset;
        self.userNameInputView.y = _logoImageView.bottom + SCALE(kLogoUserNameMargin);
        self.passwordInputView.y = _userNameInputView.bottom + kPasswordUserNameGap;
        self.loginButton.y = _passwordInputView.bottom + kLoginPasswordGap;
        self.forgetPasswordButton.y = _passwordInputView.bottom + kForgetPasswordGap;
        self.logoImageView.alpha = 0;
    } completion:^(BOOL finished) {
    }];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.logoImageView.y = SCALE(kLogoTopMargin);
        self.userNameInputView.y = _logoImageView.bottom + SCALE(kLogoUserNameMargin);
        self.passwordInputView.y = _userNameInputView.bottom + kPasswordUserNameGap;
        self.loginButton.y = _passwordInputView.bottom + kLoginPasswordGap;
        self.forgetPasswordButton.y = _passwordInputView.bottom + kForgetPasswordGap;
        self.logoImageView.alpha = 1;
    } completion:^(BOOL finished) {
    }];
}

- (void)keyboardShow {
    
}

- (void)keyboardHide {

}

@end
