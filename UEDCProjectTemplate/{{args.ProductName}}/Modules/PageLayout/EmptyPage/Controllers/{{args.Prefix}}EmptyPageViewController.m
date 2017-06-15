//
//  {{args.Prefix}}EmptyPageViewController.m
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 2017/5/18.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}EmptyPageViewController.h"
#import "HTControllerRouter.h"
#import "HTNavigationPanProtocol.h"
#import "{{args.Prefix}}BaseViewController+{{args.Prefix}}CustomNavigationBar.h"
#import "UIView+{{args.Prefix}}Loading.h"

@interface {{args.Prefix}}EmptyPageViewController () <HTRouteTargetProtocol,
                                           HTContainerViewControllerProtocol,
                                           HTNavigationBackPanGestureProtocol,
                                           UINavigationControllerDelegate>
@end

@implementation {{args.Prefix}}EmptyPageViewController
@synthesize containerController;

#pragma mark - Router

+ (HTControllerRouterConfig*)configureRouter {
    HT_EXPORT();
    HTControllerRouterConfig *config = [[HTControllerRouterConfig alloc] initWithUrlPath:[self urlPath]];
    return config;
}

+ (NSString*)urlPath {
    return @"{{args.Prefix}}://empty";
}

- (void)receiveRoute:(HTControllerRouteParam*)param {
}


#pragma mark --- Life Cycle ---

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"空状态页面布局";
    
    [self {{args.CategoryPrefix}}_applyDefaultNavigationBarStyle];
    [self {{args.CategoryPrefix}}_addNavigationLeftBackItem];
    
    [self.view {{args.CategoryPrefix}}_showLoadingEmpty:^{
        //Button click.
    }];
}

@end
