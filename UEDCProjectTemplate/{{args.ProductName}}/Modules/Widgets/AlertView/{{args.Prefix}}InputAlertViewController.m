//
//  {{args.Prefix}}InputAlertViewController.m
//
//  Created by {{args.Author}} on 2017/5/4.
//    Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}InputAlertViewController.h"
#import "HTControllerRouter.h"
#import "HTNavigationPanProtocol.h"
#import "{{args.Prefix}}BaseViewController+{{args.Prefix}}CustomNavigationBar.h"
#import "{{args.Prefix}}CommonSizes.h"
#import "{{args.Prefix}}CommonColors.h"
#import "UIView+Frame.h"
#import "{{args.Prefix}}AlertView.h"

@interface {{args.Prefix}}InputAlertViewController () <HTRouteTargetProtocol,
                                                HTContainerViewControllerProtocol,
                                                HTNavigationBackPanGestureProtocol>

@end

@implementation {{args.Prefix}}InputAlertViewController

@synthesize containerController;

#pragma mark - Router

+ (HTControllerRouterConfig*)configureRouter {
    HT_EXPORT();
    HTControllerRouterConfig *config = [[HTControllerRouterConfig alloc] initWithUrlPath:[self urlPath]];
    return config;
}

+ (NSString*)urlPath {
    return @"{{args.Prefix}}://InputAlertView";
}

- (void)receiveRoute:(HTControllerRouteParam*)param {
}


#pragma mark --- Life Cycle ---

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title  = @"内容型弹窗";
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
    button.height = 42;
    button.center = CGPointMake(SCREEN_WIDTH/2., (SCREEN_HEIGHT - kNavigationHeight)/2.);
    button.layer.masksToBounds = YES;
    button.backgroundColor = [UIColor whiteColor];
    button.layer.borderWidth = 0.5f;
    button.layer.borderColor = [UIColor colorWithRGBValue:kTextBorderColor].CGColor;
    [button addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"内容型弹窗" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithRGBValue:kButtonTextColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:kDefaultTitleFontSize];
    [self.view addSubview:button];
}

#pragma --- button action ---

- (void)clickButton{
    [[{{args.Prefix}}AlertView sharedInstance]   alertWithInputTitle:@"使用代金券"
                                              placeholderText:@"请输入商家代码"
                                                 buttonTitles:@[@"取消",@"确定"]
                                                andInputBlock:^(NSUInteger buttonIndex, NSString *inputText) {
        NSLog(@"点击了第%lu个button",(unsigned long)buttonIndex);
        NSLog(@"输入的内容为%@",inputText);
    }];
}

#pragma mark --- configAlertView ---

- (void)configAlertView{
    [{{args.Prefix}}AlertView sharedInstance].maskBackgroundColor = [UIColor colorWithRGBValue:0x000000 alpha:0.7];
    [{{args.Prefix}}AlertView sharedInstance].alertBackgroundColor = [UIColor whiteColor];
    [{{args.Prefix}}AlertView sharedInstance].buttonTitleColor = [UIColor colorWithRGBValue:kAlertViewButtonTextColor];
}


@end

