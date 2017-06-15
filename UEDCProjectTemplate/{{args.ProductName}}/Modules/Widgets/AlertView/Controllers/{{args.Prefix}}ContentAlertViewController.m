//
//  {{args.Prefix}}ContentAlertViewController.m
//
//  Created by {{args.Author}} on 2017/5/5.
//    Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}ContentAlertViewController.h"
#import "HTControllerRouter.h"
#import "HTNavigationPanProtocol.h"
#import "{{args.Prefix}}BaseViewController+{{args.Prefix}}CustomNavigationBar.h"
#import "{{args.Prefix}}CommonSizes.h"
#import "{{args.Prefix}}CommonColors.h"
#import "UIView+Frame.h"
#import "{{args.Prefix}}AlertView.h"

@interface {{args.Prefix}}ContentAlertViewController () <HTRouteTargetProtocol,
                                                HTContainerViewControllerProtocol,
                                                HTNavigationBackPanGestureProtocol>

@end

@implementation {{args.Prefix}}ContentAlertViewController

@synthesize containerController;

#pragma mark - Router

+ (HTControllerRouterConfig*)configureRouter {
    HT_EXPORT();
    HTControllerRouterConfig *config = [[HTControllerRouterConfig alloc] initWithUrlPath:[self urlPath]];
    return config;
}

+ (NSString*)urlPath {
    return @"{{args.Prefix}}://contentAlertView";
}

- (void)receiveRoute:(HTControllerRouteParam*)param {
}


#pragma mark --- Life Cycle ---

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"弹出式通知";
    [self configAlertView];
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
    button.width = SCREEN_WIDTH - 60;
    button.height = 46;
    button.center = CGPointMake(SCREEN_WIDTH/2., (SCREEN_HEIGHT - kNavigationHeight)/2.);
    button.backgroundColor = [UIColor whiteColor];
    button.layer.cornerRadius = 2.f;
    button.layer.masksToBounds = YES;
    button.layer.borderWidth = 1.f;
    button.layer.borderColor = [UIColor colorWithRGBValue:kTextBorderColor].CGColor;
    [button addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"弹出alertView" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithRGBValue:kContentTextColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
}

#pragma --- button action ---

- (void)clickButton{
    [[{{args.Prefix}}AlertView sharedInstance] alertWithContent:@"这里是通知内容这里是通知内容这里是通知内容这里是通知内容" buttonTitles:@[@"确定"] andBlock:^(NSUInteger buttonIndex) {
        NSLog(@"点击了第%lu个button",(unsigned long)buttonIndex);
    }];
}

#pragma mark --- configAlertView ---

- (void)configAlertView{
    [{{args.Prefix}}AlertView sharedInstance].maskBackgroundColor = [UIColor colorWithRGBValue:0x000000 alpha:0.7];
    [{{args.Prefix}}AlertView sharedInstance].alertBackgroundColor = [UIColor whiteColor];
    [{{args.Prefix}}AlertView sharedInstance].buttonTitleColor = [UIColor colorWithRGBValue:kAlertViewButtonTextColor];
}



@end

