//
//  ___VARIABLE_Prefix:identifier___VerifyGusturePasswordViewController.m
//
//  Created by 陶泽宇 on 2017/5/27.
//    Copyright © 2017年 Netease. All rights reserved.
//

#import "___VARIABLE_Prefix:identifier___VerifyGusturePasswordViewController.h"
#import "HTControllerRouter.h"
#import "HTNavigationPanProtocol.h"
#import "___VARIABLE_Prefix:identifier___BaseViewController+___VARIABLE_Prefix:identifier___CustomNavigationBar.h"
#import "___VARIABLE_Prefix:identifier___CommonSizes.h"
#import "___VARIABLE_Prefix:identifier___CommonColors.h"
#import "UIView+Frame.h"
#import "___VARIABLE_Prefix:identifier___LockLabel.h"
#import "___VARIABLE_Prefix:identifier___Circle.h"
#import "___VARIABLE_Prefix:identifier___CircleView.h"
#import "___VARIABLE_Prefix:identifier___CircleViewConst.h"

@interface ___VARIABLE_Prefix:identifier___VerifyGusturePasswordViewController () <HTRouteTargetProtocol,
                                                        HTContainerViewControllerProtocol,
                                                        HTNavigationBackPanGestureProtocol,
                                                        CircleViewDelegate>

@property (nonatomic, strong) ___VARIABLE_Prefix:identifier___CircleView *lockView;
@property (nonatomic, strong) ___VARIABLE_Prefix:identifier___LockLabel *msgLabel;

@end

@implementation ___VARIABLE_Prefix:identifier___VerifyGusturePasswordViewController

@synthesize containerController;

#pragma mark - Router

+ (HTControllerRouterConfig*)configureRouter {
    HT_EXPORT();
    HTControllerRouterConfig *config = [[HTControllerRouterConfig alloc] initWithUrlPath:[self urlPath]];
    return config;
}

+ (NSString*)urlPath {
    return @"___VARIABLE_Prefix:identifier___://VerifyGusturePassword";
}

- (void)receiveRoute:(HTControllerRouteParam*)param {
}


#pragma mark --- Life Cycle ---

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"验证手势密码";
    [self loadSubviews];
    [self ___VARIABLE_CategoryPrefix:identifier____applyDefaultNavigationBarStyle];
    [self ___VARIABLE_CategoryPrefix:identifier____addNavigationLeftBackItem];
    self.view.backgroundColor = [UIColor colorWithRGBValue:kDefaultBackgroundColor];
    // Do any additional setup after loading the view.
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    // 若要修改tableview／refreshview／loadmoreview的frame，在这里修改
}

#pragma mark --- loadSubViews ---

- (void)loadSubviews{
    ___VARIABLE_Prefix:identifier___LockLabel *msgLabel = [[___VARIABLE_Prefix:identifier___LockLabel alloc] init];
    msgLabel.frame = CGRectMake(0, 0, SCREEN_WIDTH, 14);
    msgLabel.center = CGPointMake(SCREEN_WIDTH/2, 90);
    self.msgLabel = msgLabel;
    [self.view addSubview:msgLabel];
    [self.msgLabel showNormalMsg:gestureTextOldGesture];

    
    ___VARIABLE_Prefix:identifier___CircleView *lockView = [[___VARIABLE_Prefix:identifier___CircleView alloc] init];
    lockView.arrow = NO;
    lockView.delegate = self;
    self.lockView = lockView;
    [self.lockView setType:CircleViewTypeVerify];
    lockView.y = self.msgLabel.bottom + 40;
    [self.view addSubview:lockView];
}


#pragma mark - login or verify gesture
- (void)circleView:(___VARIABLE_Prefix:identifier___CircleView *)view type:(CircleViewType)type didCompleteLoginGesture:(NSString *)gesture result:(BOOL)equal
{
    if (type == CircleViewTypeVerify) {
        
        if (equal) {
            NSLog(@"验证成功");
            [self ht_back];
            
        } else {
            NSLog(@"密码错误！");
            [self.msgLabel showWarnMsgAndShake:gestureTextGestureVerifyError];
        }
    }
}

#pragma mark -- HTNavigationBackPanGestureProtocol --

- (BOOL)navigationControllerBackPanGestureRecognizerShouldBegin:(UIPanGestureRecognizer*)gesture{
    return NO;
}


@end

