//
//  {{args.Prefix}}ToastViewController.m
//
//  Created by {{args.Author}} on 2017/5/8.
//    Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}ToastViewController.h"
#import "HTControllerRouter.h"
#import "HTNavigationPanProtocol.h"
#import "{{args.Prefix}}BaseViewController+{{args.Prefix}}CustomNavigationBar.h"
#import "{{args.Prefix}}CommonSizes.h"
#import "{{args.Prefix}}CommonColors.h"
#import "UIView+Frame.h"
#import "UIView+{{args.Prefix}}Toast.h"

@interface {{args.Prefix}}ToastViewController () <HTRouteTargetProtocol,
                                                HTContainerViewControllerProtocol,
                                                HTNavigationBackPanGestureProtocol>

@end

@implementation {{args.Prefix}}ToastViewController

@synthesize containerController;

#pragma mark - Router

+ (HTControllerRouterConfig*)configureRouter {
    HT_EXPORT();
    HTControllerRouterConfig *config = [[HTControllerRouterConfig alloc] initWithUrlPath:[self urlPath]];
    return config;
}

+ (NSString*)urlPath {
    return @"{{args.Prefix}}://toast";
}

- (void)receiveRoute:(HTControllerRouteParam*)param {
}


#pragma mark --- Life Cycle ---

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Toast";
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
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.width = 140;
    button.height = 46;
    button.center = CGPointMake(SCREEN_WIDTH/2., (SCREEN_HEIGHT - kNavigationHeight)/2.);
    button.backgroundColor = [UIColor whiteColor];
    button.layer.cornerRadius = 2.f;
    button.layer.masksToBounds = YES;
    button.layer.borderWidth = 1.f;
    button.layer.borderColor = [UIColor colorWithRGBValue:kTextBorderColor].CGColor;
    [button addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Toast" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithRGBValue:kContentTextColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
}

#pragma --- button action ---

- (void)clickButton{
    [self.view {{args.CategoryPrefix}}_showToastWithMessage:@"提示信息内容" size:CGSizeMake(140, 56)];
}


@end

