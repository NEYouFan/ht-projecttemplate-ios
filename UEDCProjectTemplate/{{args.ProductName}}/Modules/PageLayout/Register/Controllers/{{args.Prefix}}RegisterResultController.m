//
//  {{args.Prefix}}RegisterResultController.m
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 26/05/2017.
//  Copyright © 2017 Netease. All rights reserved.
//

#import "{{args.Prefix}}RegisterResultController.h"
#import "{{args.Prefix}}LoginInputView.h"
#import "HTControllerRouter.h"
#import "{{args.Prefix}}KeyboardSequence.h"
#import "{{args.Prefix}}BaseViewController+{{args.Prefix}}CustomNavigationBar.h"
#import "UIView+{{args.Prefix}}Toast.h"
#import "UIView+Frame.h"
#import "{{args.Prefix}}CommonStyleViews.h"
#import <NELoginSDK/NELoginSDK.h>
#import "UIView+HTToast.h"

static const CGFloat kDescTopMargin = 66;
static const CGFloat kVerifyCodeDescMargin = 10;
static const CGFloat kNextStepVerifyCodeMargin = 25;
static const CGFloat kInputViewHeight = 42;
static const CGFloat kInputViewSideMargin = 30;
static const CGFloat kNextStepButtonHeight = 42;
static const CGFloat kDescFontSize = 13;
static const CGFloat kResendButtonWidth = 90;
static const CGFloat kResendButtonHeight = 30;
static const CGFloat kResendButtonRightMarin = 36;

@interface {{args.Prefix}}RegisterResultController () <HTRouteTargetProtocol,
                                            HTContainerViewControllerProtocol,
                                            UITextViewDelegate,
                                            UITextFieldDelegate>
/// 多个输入框的键盘管理
@property (nonatomic, strong) {{args.Prefix}}KeyboardSequence *keyboardSequenceManager;
/// 容器
@property (nonatomic, strong) UIView *containerView;
/// 验证码输入框
@property (nonatomic, strong) {{args.Prefix}}LoginInputView *verifyCodeInputView;
/// 下一步按钮
@property (nonatomic, strong) UIButton *nextStepButton;
@property (nonatomic, strong) UIButton *resendButton;
@property (nonatomic, strong) UILabel *descLabel;

@property (nonatomic, copy)   NSString *phoneNumber;
@property (nonatomic, copy)   NSString *passWord;

@end

@implementation {{args.Prefix}}RegisterResultController
@synthesize containerController;

#pragma mark - Router

+ (HTControllerRouterConfig*)configureRouter {
    HT_EXPORT();
    HTControllerRouterConfig *config = [[HTControllerRouterConfig alloc] initWithUrlPath:[self urlPath]];
    return config;
}

+ (NSString*)urlPath {
    return @"{{args.Prefix}}://registerResult";
}

- (void)receiveRoute:(HTControllerRouteParam*)param {
    if ([param.params isKindOfClass:[NSDictionary class]]) {
        _phoneNumber = [param.params valueForKey:@"phoneNumber"];
        _passWord = [param.params valueForKey:@"passWord"];
    }
}


#pragma mark - Life cycle.

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadSubViews];
    self.view.backgroundColor = [UIColor colorWithRGBValue:kDefaultBackgroundColor];
    [self {{args.CategoryPrefix}}_applyTransparentNavigationBarDarkStatus];
    [self {{args.CategoryPrefix}}_addNavigationLeftBackItem];
    self.title = @"注册";
    [self configKeyboard];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    _containerView.frame = self.view.bounds;
    
    [_descLabel sizeToFit];
    _descLabel.y = kDescTopMargin;
    _descLabel.x = kInputViewSideMargin;
    
    _verifyCodeInputView.width = _containerView.width - kInputViewSideMargin * 2;
    _verifyCodeInputView.height = kInputViewHeight;
    _verifyCodeInputView.x = kInputViewSideMargin;
    _verifyCodeInputView.y = _descLabel.bottom + kVerifyCodeDescMargin;
    
    _nextStepButton.width = _verifyCodeInputView.width;
    _nextStepButton.height = kNextStepButtonHeight;
    _nextStepButton.x = _verifyCodeInputView.x;
    _nextStepButton.y = _verifyCodeInputView.bottom + kNextStepVerifyCodeMargin;
    
    _resendButton.size = CGSizeMake(kResendButtonWidth, kResendButtonHeight);
    _resendButton.tail = _containerView.width - kResendButtonRightMarin;
    _resendButton.middleY = _verifyCodeInputView.middleY;
}


#pragma mark - Load views.

- (void)loadSubViews {
    _containerView = [[UIView alloc] init];
    _containerView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_containerView];
    
    _descLabel = [[UILabel alloc] init];
    _descLabel.textColor = [UIColor colorWithRGBValue:kLightTextColor];
    _descLabel.font = [UIFont systemFontOfSize:kDescFontSize];
    _descLabel.text = @"这里是说明文字";
    
    _nextStepButton = [{{args.Prefix}}CommonStyleViews loginStyleButtonWithTitle:@"下一步"];
    [_nextStepButton addTarget:self action:@selector(nextStep) forControlEvents:UIControlEventTouchUpInside];
    [_containerView addSubview:_nextStepButton];
    
    // 验证码输入框
    _verifyCodeInputView = [[{{args.Prefix}}LoginInputView alloc] initWithPlaceholder:@"输入收到的短信验证码"];
    _verifyCodeInputView.inputTextField.delegate = self;
    [_containerView addSubview:_verifyCodeInputView];
    
    _resendButton = [{{args.Prefix}}CommonStyleViews loadingReloadButtonWithTitle:@"发送验证码"];
    [_resendButton setTitleColor:[UIColor colorWithRGBValue:kFisrtClassTitleTextColor] forState:UIControlStateNormal];
    [_resendButton addTarget:self action:@selector(resendVerifyCode) forControlEvents:UIControlEventTouchUpInside];
    [_containerView addSubview:_resendButton];
}


#pragma mark - Actions.

- (void)resendVerifyCode {
    @{{args.Prefix}}Weak(self);
    [LoginEngine registrationCodeWithPhoneNumber:self.phoneNumber completionBlock:^(BOOL isSuccess, NSError *aError) {
        if (isSuccess) {
            [weakSelf.view makeToast:@"验证码发送成功" duration:0.5f position:HTToastPositionCenter];
            [weakSelf setTimer];
        }
        else {
            [weakSelf.view makeToast:@"验证码发送失败" duration:0.5f position:HTToastPositionCenter];
            [weakSelf.resendButton setTitle:@"重新发送" forState:UIControlStateNormal];
            [weakSelf.resendButton setTitleColor:[UIColor colorWithRGBValue:kFisrtClassTitleTextColor] forState:UIControlStateNormal];
            weakSelf.resendButton.userInteractionEnabled = YES;
        }
    }];
}

- (void)nextStep {
    @{{args.Prefix}}Weak(self);
    if (![self isValidVerifyCode:_verifyCodeInputView.text]){
        [self.view {{args.CategoryPrefix}}_showToastWithMessage:@"请输入正确格式的验证码"];
        return;
    }

    [LoginEngine registerMobileAccountWithPhoneNumber:self.phoneNumber registrationCode:_verifyCodeInputView.text password:self.passWord completionBlock:^(BOOL isSuccess, NSString *token, NSString *mainAccount, NSString *mobileAccount, NSError *aError) {
        if (isSuccess) {
            [weakSelf.view makeToast:@"注册成功" duration:0.5f position:HTToastPositionCenter];
        } else {
            if (aError.code == 413)
                [weakSelf.view makeToast:@"验证码错误" duration:0.5f position:HTToastPositionCenter];
            else if (aError.code == 604)
                [weakSelf.view makeToast:@"手机号已注册" duration:0.5f position:HTToastPositionCenter];
            else
                [weakSelf.view makeToast:@"注册失败" duration:0.5f position:HTToastPositionCenter];
        }
    }];
}

- (BOOL)isValidVerifyCode:(NSString *)verifyCode {
    NSString *verifyCodeRegex = @"^[0-9]{6}";
    NSPredicate *verifyCodeRegexPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", verifyCodeRegex];
    if ([verifyCodeRegexPredicate evaluateWithObject:verifyCode]) {
        return YES;
    }
    return NO;
}


#pragma mark - Config keyboard.

- (void)configKeyboard {
    _keyboardSequenceManager = [[{{args.Prefix}}KeyboardSequence alloc] init];
    _keyboardSequenceManager.delegate = self;
    [_keyboardSequenceManager addTextFieldView:_verifyCodeInputView.inputTextField returnKeyType:UIReturnKeyGo];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == _verifyCodeInputView.inputTextField){
        [self nextStep];
    }
    
    return YES;
}

- (void)setTimer {
    __block NSInteger time = 59; //倒计时时间
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    
    dispatch_source_set_event_handler(_timer, ^{
        if(time <= 0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置按钮的样式
                [self.resendButton setTitle:@"重新发送" forState:UIControlStateNormal];
                [self.resendButton setTitleColor:[UIColor colorWithRGBValue:kFisrtClassTitleTextColor] forState:UIControlStateNormal];
                self.resendButton.userInteractionEnabled = YES;
            });
            
        }else{
            int seconds = time % 60;
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //设置按钮显示读秒效果
                [self.resendButton setTitle:[NSString stringWithFormat:@"重新发送(%.2d)", seconds] forState:UIControlStateNormal];
                [self.resendButton setTitleColor:[UIColor colorWithRGBValue:kDefaultTextColor] forState:UIControlStateNormal];
                self.resendButton.userInteractionEnabled = NO;
            });
            time--;
        }
    });
    dispatch_resume(_timer);
}

@end
