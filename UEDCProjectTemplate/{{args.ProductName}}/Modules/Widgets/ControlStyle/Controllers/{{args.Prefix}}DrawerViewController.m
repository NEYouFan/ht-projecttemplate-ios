//
//  {{args.Prefix}}DrawerViewController.m
//  {{args.Prefix}}
//
//  Created by NetEase on 2017/5/2.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}DrawerViewController.h"
#import "HTControllerRouter.h"
#import "HTNavigationPanProtocol.h"
#import "{{args.Prefix}}BaseViewController+{{args.Prefix}}CustomNavigationBar.h"
#import "{{args.Prefix}}CommonSizes.h"
#import "{{args.Prefix}}CommonColors.h"
#import "UIView+Frame.h"
#import "{{args.Prefix}}DrawerView.h"

@interface {{args.Prefix}}DrawerViewController ()<HTRouteTargetProtocol,
HTContainerViewControllerProtocol,
HTNavigationBackPanGestureProtocol>

@property(nonatomic, strong) {{args.Prefix}}DrawerView *drawerView;
@end

@implementation {{args.Prefix}}DrawerViewController

@synthesize containerController;

#pragma mark - Router

+ (HTControllerRouterConfig*)configureRouter {
    HT_EXPORT();
    HTControllerRouterConfig *config = [[HTControllerRouterConfig alloc] initWithUrlPath:[self urlPath]];
    return config;
}

+ (NSString*)urlPath {
    return @"{{args.Prefix}}://drawer";
}

- (void)receiveRoute:(HTControllerRouteParam*)param {
}


#pragma mark - Life Cycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"下拉控件";
    [self loadSubviews];
    [self {{args.CategoryPrefix}}_applyDefaultNavigationBarStyle];
    [self {{args.CategoryPrefix}}_addNavigationLeftBackItem];
    
}


#pragma mark - Init View

- (void)loadSubviews{
    
    self.drawerView = [[{{args.Prefix}}DrawerView alloc]initWithDefaultIndex:0 titles:@[@"默认标题",@"标题文案1",@"标题文案2"]];

    self.navigationItem.titleView = self.drawerView.titleButton;
    self.drawerView.selectedCallback = ^({{args.Prefix}}DrawerView *draeweView, NSInteger selectedIndex) {
        NSLog(@"选中了第 %ld 个按钮",(long)selectedIndex);
    };

}



@end
