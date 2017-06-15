//
//  {{args.Prefix}}SetGesturePasswordViewController.m
//
//  Created by {{args.Author}} on 2017/5/26.
//    Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}SetGesturePasswordViewController.h"
#import "HTControllerRouter.h"
#import "HTNavigationPanProtocol.h"
#import "{{args.Prefix}}BaseViewController+{{args.Prefix}}CustomNavigationBar.h"
#import "UIView+Frame.h"
#import "{{args.Prefix}}Circle.h"
#import "{{args.Prefix}}CircleViewConst.h"
#import "{{args.Prefix}}CircleView.h"
#import "{{args.Prefix}}CircleInfoView.h"
#import "{{args.Prefix}}LockLabel.h"

@interface {{args.Prefix}}SetGesturePasswordViewController () <HTRouteTargetProtocol,
                                                HTContainerViewControllerProtocol,
                                                HTNavigationBackPanGestureProtocol,
                                                CircleViewDelegate>
/**
 *  忘记密码按钮
 */
@property (nonatomic, strong) UIButton *forgetPwdBtn;

/**
 *  提示Label
 */
@property (nonatomic, strong) {{args.Prefix}}LockLabel *msgLabel;

/**
 *  解锁界面
 */
@property (nonatomic, strong) {{args.Prefix}}CircleView *lockView;

/**
 *  infoView
 */
@property (nonatomic, strong) {{args.Prefix}}CircleInfoView *infoView;

@end


@implementation {{args.Prefix}}SetGesturePasswordViewController

@synthesize containerController;

#pragma mark - Router

+ (HTControllerRouterConfig*)configureRouter {
    HT_EXPORT();
    HTControllerRouterConfig *config = [[HTControllerRouterConfig alloc] initWithUrlPath:[self urlPath]];
    return config;
}

+ (NSString*)urlPath {
    return @"{{args.Prefix}}://setGesturePassword";
}

- (void)receiveRoute:(HTControllerRouteParam*)param {
}


#pragma mark --- Life Cycle ---

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置手势密码";
    [self loadSubviews];
    [self {{args.CategoryPrefix}}_applyDefaultNavigationBarStyle];
    [self {{args.CategoryPrefix}}_addNavigationLeftBackItem];
    // 进来先清空存的第一个密码
    [{{args.Prefix}}CircleViewConst saveGesture:nil Key:gestureOneSaveKey];
    // Do any additional setup after loading the view.
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    // 若要修改tableview／refreshview／loadmoreview的frame，在这里修改
}

#pragma mark --- loadSubViews ---

- (void)loadSubviews{
    self.view.backgroundColor = [UIColor colorWithRGBValue:kDefaultBackgroundColor];

    {{args.Prefix}}CircleInfoView *infoView = [[{{args.Prefix}}CircleInfoView alloc] init];
    infoView.frame = CGRectMake(0, 0, CircleRadius * 2 * 0.6, CircleRadius * 2 * 0.6);
    infoView.center = CGPointMake(SCREEN_WIDTH/2, CGRectGetMinY(self.msgLabel.frame) - CGRectGetHeight(infoView.frame)/2 - 10);
    self.infoView = infoView;
    [self.view addSubview:infoView];
    infoView.y = 54;
    
    {{args.Prefix}}LockLabel *msgLabel = [[{{args.Prefix}}LockLabel alloc] init];
    msgLabel.frame = CGRectMake(0, 0, SCREEN_WIDTH, 14);
    msgLabel.center = CGPointMake(SCREEN_WIDTH/2, CGRectGetMaxY(infoView.frame) + 28);
    self.msgLabel = msgLabel;
    [self.view addSubview:msgLabel];
    [self.msgLabel showNormalMsg:gestureTextBeforeSet];
    
    {{args.Prefix}}CircleView *lockView = [[{{args.Prefix}}CircleView alloc] init];
    lockView.arrow = NO;
    lockView.delegate = self;
    self.lockView = lockView;
    [self.lockView setType:CircleViewTypeSetting];
    lockView.y = self.msgLabel.bottom + 40;
    [self.view addSubview:lockView];
    
    UIButton *forgetBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    forgetBtn.height = 30;
    forgetBtn.width = 100;
    forgetBtn.bottom = SCREEN_HEIGHT - kNavigationHeight - 25;
    forgetBtn.middleX = SCREEN_WIDTH/2;
    [forgetBtn setTitle:@"忘记手势密码" forState:UIControlStateNormal];
    [forgetBtn setTitleColor:[UIColor colorWithRGBValue:0x666666] forState:UIControlStateNormal];
    [forgetBtn.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [forgetBtn addTarget:self action:@selector(clickForgetBtn) forControlEvents:UIControlEventTouchUpInside];
    self.forgetPwdBtn = forgetBtn;
    [self.view addSubview:self.forgetPwdBtn];
}

#pragma mark - circleView - delegate - setting
- (void)circleView:({{args.Prefix}}CircleView *)view type:(CircleViewType)type connectCirclesLessThanNeedWithGesture:(NSString *)gesture
{
    NSString *gestureOne = [{{args.Prefix}}CircleViewConst getGestureWithKey:gestureOneSaveKey];
    
    // 看是否存在第一个密码
    if ([gestureOne length]) {
        [self.msgLabel showWarnMsgAndShake:gestureTextDrawAgainError];
    } else {
        NSLog(@"密码长度不合法%@", gesture);
        [self.msgLabel showWarnMsgAndShake:gestureTextConnectLess];
    }
}

- (void)circleView:({{args.Prefix}}CircleView *)view type:(CircleViewType)type didCompleteSetFirstGesture:(NSString *)gesture
{
    NSLog(@"获得第一个手势密码%@", gesture);
    [self.msgLabel showWarnMsg:gestureTextDrawAgain];
    
    // infoView展示对应选中的圆
    [self infoViewSelectedSubviewsSameAsCircleView:view];
}

- (void)circleView:({{args.Prefix}}CircleView *)view type:(CircleViewType)type didCompleteSetSecondGesture:(NSString *)gesture result:(BOOL)equal
{
    NSLog(@"获得第二个手势密码%@",gesture);
    
    if (equal) {
        
        NSLog(@"两次手势匹配！可以进行本地化保存了");
        
        [self.msgLabel showWarnMsg:gestureTextSetSuccess];
        [{{args.Prefix}}CircleViewConst saveGesture:gesture Key:gestureFinalSaveKey];
        [self.navigationController popToRootViewControllerAnimated:YES];
        
    } else {
        NSLog(@"两次手势不匹配！");
        
        [self.msgLabel showWarnMsgAndShake:gestureTextDrawAgainError];
    }
}

#pragma mark - circleView - delegate - login or verify gesture
- (void)circleView:({{args.Prefix}}CircleView *)view type:(CircleViewType)type didCompleteLoginGesture:(NSString *)gesture result:(BOOL)equal
{
    // 此时的type有两种情况 Login or verify
    if (type == CircleViewTypeLogin) {
        
        if (equal) {
            NSLog(@"登陆成功！");
            [self.navigationController popToRootViewControllerAnimated:YES];
        } else {
            NSLog(@"密码错误！");
            [self.msgLabel showWarnMsgAndShake:gestureTextGestureVerifyError];
        }
    } else if (type == CircleViewTypeVerify) {
        
        if (equal) {
            NSLog(@"验证成功，跳转到设置手势界面");
            
        } else {
            NSLog(@"原手势密码输入错误！");
            
        }
    }
}

#pragma mark - infoView展示方法
#pragma mark - 让infoView对应按钮选中
- (void)infoViewSelectedSubviewsSameAsCircleView:({{args.Prefix}}CircleView *)circleView
{
    for ({{args.Prefix}}Circle *circle in circleView.subviews) {
        
        if (circle.state == CircleStateSelected || circle.state == CircleStateLastOneSelected) {
            
            for ({{args.Prefix}}Circle *infoCircle in self.infoView.subviews) {
                if (infoCircle.tag == circle.tag) {
                    [infoCircle setState:CircleStateSelected];
                }
            }
        }
    }
}

#pragma mark - 让infoView对应按钮取消选中
- (void)infoViewDeselectedSubviews
{
    [self.infoView.subviews enumerateObjectsUsingBlock:^({{args.Prefix}}Circle *obj, NSUInteger idx, BOOL *stop) {
        [obj setState:CircleStateNormal];
    }];
}


#pragma mark --- button actions ---

- (void)clickForgetBtn{
    NSLog(@"点击了忘记密码按钮");
}

#pragma mark -- HTNavigationBackPanGestureProtocol --

- (BOOL)navigationControllerBackPanGestureRecognizerShouldBegin:(UIPanGestureRecognizer*)gesture{
    return NO;
}

@end

