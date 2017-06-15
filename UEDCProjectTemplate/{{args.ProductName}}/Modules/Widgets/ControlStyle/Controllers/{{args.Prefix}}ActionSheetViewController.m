//
//  {{args.Prefix}}ActionSheetViewController.m
//  {{args.Prefix}}
//
//  Created by NetEase on 2017/4/27.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}ActionSheetViewController.h"
#import "HTControllerRouter.h"
#import "HTNavigationPanProtocol.h"
#import "{{args.Prefix}}BaseViewController+{{args.Prefix}}CustomNavigationBar.h"
#import "{{args.Prefix}}CommonSizes.h"
#import "{{args.Prefix}}CommonColors.h"
#import "UIView+Frame.h"
#import "{{args.Prefix}}ActionSheet.h"

@interface {{args.Prefix}}ActionSheetViewController ()<HTRouteTargetProtocol,
HTContainerViewControllerProtocol,
HTNavigationBackPanGestureProtocol>

@end

@implementation {{args.Prefix}}ActionSheetViewController
@synthesize containerController;

#pragma mark - Router
+ (HTControllerRouterConfig*)configureRouter {
    HT_EXPORT();
    HTControllerRouterConfig *config = [[HTControllerRouterConfig alloc] initWithUrlPath:[self urlPath]];
    return config;
}

+ (NSString*)urlPath {
    return @"{{args.Prefix}}://actionSheet";
}

- (void)receiveRoute:(HTControllerRouteParam*)param {
}


#pragma mark - Life Cycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"上拉菜单";
    [self {{args.CategoryPrefix}}_applyDefaultNavigationBarStyle];
    [self {{args.CategoryPrefix}}_addNavigationLeftBackItem];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    {{args.Prefix}}ActionSheet * actionsheet = [[{{args.Prefix}}ActionSheet alloc]initWithCancelButtonTitle:@"取消" otherButtonTitles:@[@"功能一",@"功能二",@"功能三",@"功能四"]];

    [actionsheet show];

}




@end
