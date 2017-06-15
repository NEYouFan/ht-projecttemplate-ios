//
//  {{args.Prefix}}RefreshViewController.m
//  {{args.Prefix}}
//
//  Created by NetEase on 2017/5/3.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}RefreshViewController.h"
#import "HTControllerRouter.h"
#import "HTNavigationPanProtocol.h"
#import "{{args.Prefix}}BaseViewController+{{args.Prefix}}CustomNavigationBar.h"
#import "{{args.Prefix}}CommonSizes.h"
#import "{{args.Prefix}}CommonColors.h"
#import "UIView+Frame.h"
#import "UIView+{{args.Prefix}}Line.h"
#import "HTRefreshView.h"
#import "HTTopLeftRefreshView.h"
#import "{{args.Prefix}}RefreshView.h"


@interface {{args.Prefix}}RefreshViewController ()<HTRouteTargetProtocol,HTContainerViewControllerProtocol,HTNavigationBackPanGestureProtocol>
@property(nonatomic, strong) UIScrollView *scrollView;
@property(nonatomic, strong) {{args.Prefix}}RefreshView *refreshView;
@end

@implementation {{args.Prefix}}RefreshViewController
@synthesize containerController;
#pragma mark - Router

+ (HTControllerRouterConfig*)configureRouter {
    HT_EXPORT();
    HTControllerRouterConfig *config = [[HTControllerRouterConfig alloc] initWithUrlPath:[self urlPath]];
    return config;
}

+ (NSString*)urlPath {
    return @"{{args.Prefix}}://refresh";
}

- (void)receiveRoute:(HTControllerRouteParam*)param {
}


#pragma mark - Life Cycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"刷新控件";
    [self loadSubviews];
    [self {{args.CategoryPrefix}}_applyDefaultNavigationBarStyle];
    [self {{args.CategoryPrefix}}_addNavigationLeftBackItem];
    
}
- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    self.scrollView.frame = self.view.bounds;
    self.refreshView.size = CGSizeMake(self.scrollView.width, kRefreshViewHeight);

}

#pragma mark - Init View

- (void)loadSubviews{
    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, 700);    
    [self.view addSubview:self.scrollView];
    self.refreshView = [[{{args.Prefix}}RefreshView alloc]initWithScrollView:self.scrollView direction:HTRefreshDirectionTop followScrollView:YES];
    
    @{{args.Prefix}}Weak(self);
    [self.refreshView addRefreshingHandler:^(HTRefreshView *_topRefreshView){
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            [NSThread sleepForTimeInterval:2];
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf.refreshView endRefresh:YES];
            });
        });
    }];
}


@end
