//
//  {{args.Prefix}}GesturePasswordDemoViewController.m
//
//  Created by {{args.Author}} on 2017/5/26.
//    Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}GesturePasswordDemoViewController.h"
#import "HTControllerRouter.h"
#import "HTNavigationPanProtocol.h"
#import "UIViewController+HTRouter.h"
#import "{{args.Prefix}}BaseViewController+{{args.Prefix}}CustomNavigationBar.h"
#import "{{args.Prefix}}CommonSizes.h"
#import "{{args.Prefix}}CommonColors.h"
#import "UIView+Frame.h"

@interface {{args.Prefix}}GesturePasswordDemoViewController () <HTRouteTargetProtocol,
                                                HTContainerViewControllerProtocol,
                                                HTNavigationBackPanGestureProtocol>

@end

@implementation {{args.Prefix}}GesturePasswordDemoViewController

@synthesize containerController;

#pragma mark - Router

+ (HTControllerRouterConfig*)configureRouter {
    HT_EXPORT();
    HTControllerRouterConfig *config = [[HTControllerRouterConfig alloc] initWithUrlPath:[self urlPath]];
    return config;
}

+ (NSString*)urlPath {
    return @"{{args.Prefix}}://gesturePassword";
}

- (void)receiveRoute:(HTControllerRouteParam*)param {
}


#pragma mark --- Life Cycle ---

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"手势密码";
    [self loadSubviews];
    [self {{args.CategoryPrefix}}_applyDefaultNavigationBarStyle];
    [self {{args.CategoryPrefix}}_addNavigationLeftBackItem];
    // Do any additional setup after loading the view.
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    // 若要修改tableview／refreshview／loadmoreview的frame，在这里修改
}

#pragma mark --- loadSubViews ---

- (void)loadSubviews{
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.width = SCREEN_WIDTH - 60;
    button1.height = 42;
    button1.center = CGPointMake(SCREEN_WIDTH/2., (SCREEN_HEIGHT - kNavigationHeight)/2 - 100);
    button1.backgroundColor = [UIColor whiteColor];
    button1.layer.borderWidth = 0.5f;
    button1.layer.borderColor = [UIColor colorWithRGBValue:kTextBorderColor].CGColor;
    [button1 addTarget:self action:@selector(setPassword) forControlEvents:UIControlEventTouchUpInside];
    [button1 setTitle:@"设置手势密码" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor colorWithRGBValue:kButtonTextColor] forState:UIControlStateNormal];
    button1.titleLabel.font = [UIFont systemFontOfSize:kDefaultTitleFontSize];
    [self.view addSubview:button1];
    
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.width = SCREEN_WIDTH - 60;
    button2.height = 42;
    button2.center = CGPointMake(SCREEN_WIDTH/2., (SCREEN_HEIGHT - kNavigationHeight)/2 + 100);
    button2.backgroundColor = [UIColor whiteColor];
    button2.layer.borderWidth = 0.5f;
    button2.layer.borderColor = [UIColor colorWithRGBValue:kTextBorderColor].CGColor;
    [button2 addTarget:self action:@selector(verifyPassword) forControlEvents:UIControlEventTouchUpInside];
    [button2 setTitle:@"验证手势密码" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor colorWithRGBValue:kButtonTextColor] forState:UIControlStateNormal];
    button2.titleLabel.font = [UIFont systemFontOfSize:kDefaultTitleFontSize];
    [self.view addSubview:button2];
}


#pragma mark ---- button actions ----

- (void)setPassword{
    [self pushViewControllerWithURL:@"{{args.Prefix}}://setGesturePassword"];
}

- (void)verifyPassword{
    [self pushViewControllerWithURL:@"{{args.Prefix}}://VerifyGusturePassword"];
}

@end

