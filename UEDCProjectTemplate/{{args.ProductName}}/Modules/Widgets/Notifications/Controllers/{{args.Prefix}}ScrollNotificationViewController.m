//
//  {{args.Prefix}}ScrollNotificationViewController.m
//
//  Created by {{args.Author}} on 2017/5/8.
//    Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}ScrollNotificationViewController.h"
#import "HTControllerRouter.h"
#import "HTNavigationPanProtocol.h"
#import "{{args.Prefix}}BaseViewController+{{args.Prefix}}CustomNavigationBar.h"
#import "{{args.Prefix}}CommonSizes.h"
#import "{{args.Prefix}}CommonColors.h"
#import "UIView+Frame.h"

@interface {{args.Prefix}}ScrollNotificationViewController () <HTRouteTargetProtocol,
                                                HTContainerViewControllerProtocol,
                                                HTNavigationBackPanGestureProtocol>

@end

@implementation {{args.Prefix}}ScrollNotificationViewController

@synthesize containerController;

#pragma mark - Router

+ (HTControllerRouterConfig*)configureRouter {
    HT_EXPORT();
    HTControllerRouterConfig *config = [[HTControllerRouterConfig alloc] initWithUrlPath:[self urlPath]];
    return config;
}

+ (NSString*)urlPath {
    return @"{{args.Prefix}}://ScrollNotification";
}

- (void)receiveRoute:(HTControllerRouteParam*)param {
}


#pragma mark --- Life Cycle ---

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"条幅式通知";
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
    UIView *notiView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 30)];
    notiView.backgroundColor = [UIColor colorWithRGBValue:kNotificationScrollBackgroundColor];
    [self.view addSubview:notiView];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"提示信息内容";
    titleLabel.font = [UIFont systemFontOfSize:kNotificationSrcollTextFontSize];
    titleLabel.textColor = [UIColor colorWithRGBValue:kNotificationScrollTextColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [titleLabel sizeToFit];
    titleLabel.center = CGPointMake(SCREEN_WIDTH/2, notiView.height/2);
    [notiView addSubview:titleLabel];
    
}


@end

