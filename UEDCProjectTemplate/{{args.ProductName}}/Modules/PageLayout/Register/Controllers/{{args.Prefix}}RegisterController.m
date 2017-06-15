//
//  {{args.Prefix}}RegisterController.m
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 15/12/2016.
//  Copyright © 2016 Netease. All rights reserved.
//

#import "{{args.Prefix}}RegisterController.h"
#import "{{args.Prefix}}LoginInputView.h"
#import "HTControllerRouter.h"
#import "{{args.Prefix}}KeyboardSequence.h"
#import "{{args.Prefix}}BaseViewController+{{args.Prefix}}CustomNavigationBar.h"
#import "UIView+{{args.Prefix}}Toast.h"
#import "UIView+Frame.h"
#import "{{args.Prefix}}CommonStyleViews.h"

static const CGFloat kUserNameTopMargin = 95;
static const CGFloat kInputViewSideMargin = 30;
static const CGFloat kPasswordUserNameMargin = 25;
static const CGFloat kInputViewHeight = 42;
static const CGFloat kNextStepButtonHeight = 42;
static const CGFloat kNextStepPasswordMargin = 25;

@interface {{args.Prefix}}RegisterController () <HTRouteTargetProtocol,
                                      HTContainerViewControllerProtocol,
                                      UITextViewDelegate,
                                      UITextFieldDelegate>
/// 多个输入框的键盘管理
@property (nonatomic, strong) {{args.Prefix}}KeyboardSequence *keyboardSequenceManager;
/// 容器
@property (nonatomic, strong) UIView *containerView;
/// 用户名输入框
@property (nonatomic, strong) {{args.Prefix}}LoginInputView *userNameInputView;
/// 密码输入框
@property (nonatomic, strong) {{args.Prefix}}LoginInputView *passwordInputView;
/// 下一步按钮
@property (nonatomic, strong) UIButton *nextStepButton;

@end

@implementation {{args.Prefix}}RegisterController
@synthesize containerController;

#pragma mark - Router

+ (HTControllerRouterConfig*)configureRouter {
    HT_EXPORT();
    HTControllerRouterConfig *config = [[HTControllerRouterConfig alloc] initWithUrlPath:[self urlPath]];
    return config;
}

+ (NSString*)urlPath {
    return @"{{args.Prefix}}://register";
}

- (void)receiveRoute:(HTControllerRouteParam*)param {
    
}


#pragma mark - Life cycle.

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadSubViews];
    self.view.backgroundColor = [UIColor colorWithRGBValue:kDefaultBackgroundColor];
    [self {{args.CategoryPrefix}}_applyTransparentNavigationBarDarkStatus];
    self.title = @"注册";
    [self configKeyboard];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    _containerView.frame = self.view.bounds;
    
    _userNameInputView.width = _containerView.width - kInputViewSideMargin * 2;
    _userNameInputView.height = kInputViewHeight;
    _userNameInputView.x = kInputViewSideMargin;
    _userNameInputView.y = kUserNameTopMargin;
    
    _passwordInputView.width = _userNameInputView.width;
    _passwordInputView.height = _userNameInputView.height;
    _passwordInputView.x = _userNameInputView.x;
    _passwordInputView.y = _userNameInputView.bottom + kPasswordUserNameMargin;
    
    _nextStepButton.width = _userNameInputView.width;
    _nextStepButton.height = kNextStepButtonHeight;
    _nextStepButton.x = _userNameInputView.x;
    _nextStepButton.y = _passwordInputView.bottom + kNextStepPasswordMargin;
}


#pragma mark - Load views.

- (void)loadSubViews {
    _containerView = [[UIView alloc] init];
    _containerView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_containerView];
    
    _nextStepButton = [{{args.Prefix}}CommonStyleViews loginStyleButtonWithTitle:@"下一步"];
    [_nextStepButton addTarget:self action:@selector(nextStep) forControlEvents:UIControlEventTouchUpInside];
    [_containerView addSubview:_nextStepButton];
    
    // 用户名输入框
    _userNameInputView = [[{{args.Prefix}}LoginInputView alloc] initWithPlaceholder:@"输入手机号"];
    // 可以设置 self 为 UITextField 的 delegate，用于处理回调。例如：根据用户名的输入实时进行智能补全时，需要在代理中做一些处理，本例中不提供自动补全功能(使用者请根据交互视觉需求自己实现)
    _userNameInputView.inputTextField.delegate = self;
    [_containerView addSubview:_userNameInputView];
    
    // 密码输入框
    _passwordInputView = [[{{args.Prefix}}LoginInputView alloc] initWithPlaceholder:@"设置登录密码，不少于6位"];
    _passwordInputView.inputTextField.secureTextEntry = YES;
    [_containerView addSubview:_passwordInputView];
}


#pragma mark - Actions.

- (void)nextStep {
    // 点击下一步按钮后，可以检查用户名输入框和密码输入框输入的文本是否合法，例如：用户名要求是合法手机号，密码要求6-16位字母和数字，等等。这里只给出使用正则检查的示例代码，对正则不熟悉的需要巩固下基础知识。
    if (![self isValidPhoneNumber:_userNameInputView.text]){
        [self.view {{args.CategoryPrefix}}_showToastWithMessage:@"请输入正确的手机号码"];
        return;
    }
    
    if (![self isValidPassword:_passwordInputView.text]) {
        [self.view {{args.CategoryPrefix}}_showToastWithMessage:@"密码为6-16为英文或数字"];
        return;
    }
    
    HTControllerRouteParam *param = [[HTControllerRouteParam alloc] init];
    param.url = @"{{args.Prefix}}://registerResult";
    param.launchMode = HTControllerLaunchModePushNavigation;
    param.params = @{@"phoneNumber" : _userNameInputView.text,
                     @"passWord"    : _passwordInputView.text};
    
    [[HTControllerRouter sharedRouter] route:param];
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
        [self nextStep];
    }
    
    return YES;
}

@end
