//
//  ___VARIABLE_Prefix:identifier___GuidePageViewController.m
//  ___VARIABLE_Prefix:identifier___
//
//  Created by shoulei ma on 2017/5/26.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "___VARIABLE_Prefix:identifier___GuidePageViewController.h"
#import "HTControllerRouter.h"
#import "HTNavigationPanProtocol.h"
#import "___VARIABLE_Prefix:identifier___BaseViewController+___VARIABLE_Prefix:identifier___CustomNavigationBar.h"
#import "UIView+Frame.h"
#import "___VARIABLE_Prefix:identifier___GuidePageView.h"
#import "___VARIABLE_Prefix:identifier___GuidePageModel.h"

@interface ___VARIABLE_Prefix:identifier___GuidePageViewController () <HTRouteTargetProtocol,
                                           HTContainerViewControllerProtocol,
                                           HTNavigationBackPanGestureProtocol,
                                           ___VARIABLE_Prefix:identifier___GuidePageViewDelegate>

@property (nonatomic, strong) NSMutableArray <___VARIABLE_Prefix:identifier___GuidePageModel *>*models;

@property (nonatomic, strong) ___VARIABLE_Prefix:identifier___GuidePageView *guidePageView;

@end

@implementation ___VARIABLE_Prefix:identifier___GuidePageViewController
@synthesize containerController;

#pragma mark - Router

+ (HTControllerRouterConfig*)configureRouter {
    HT_EXPORT();
    HTControllerRouterConfig *config = [[HTControllerRouterConfig alloc] initWithUrlPath:[self urlPath]];
    return config;
}

+ (NSString*)urlPath {
    return @"___VARIABLE_Prefix:identifier___://guidepage";
}

- (void)receiveRoute:(HTControllerRouteParam*)param {
}


#pragma mark - Life Cycle.

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self ___VARIABLE_CategoryPrefix:identifier____applyTransparentNavigationBarWhiteStatus];
    
    [self loadData];
    [self loadSubViews];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    _guidePageView.frame = self.view.frame;
}


#pragma mark - Load Data.

- (void)loadData {
    ___VARIABLE_Prefix:identifier___GuidePageModel *firstPageModel = [[___VARIABLE_Prefix:identifier___GuidePageModel alloc] init];
    firstPageModel.title = @"主标题1";
    firstPageModel.subTitle = @"这是一段副标题或描述";
    firstPageModel.isShowButton = NO;
    
    ___VARIABLE_Prefix:identifier___GuidePageModel *secondPageModel = [[___VARIABLE_Prefix:identifier___GuidePageModel alloc] init];
    secondPageModel.title = @"主标题2";
    secondPageModel.subTitle = @"这是一段副标题或描述";
    secondPageModel.isShowButton = NO;
    
    ___VARIABLE_Prefix:identifier___GuidePageModel *thirdPageModel = [[___VARIABLE_Prefix:identifier___GuidePageModel alloc] init];
    thirdPageModel.title = @"主标题3";
    thirdPageModel.subTitle = @"这是一段副标题或描述";
    thirdPageModel.isShowButton = YES;
    
    _models = [NSMutableArray arrayWithObjects:firstPageModel, secondPageModel, thirdPageModel, nil];
}


#pragma mark - Load views.

- (void)loadSubViews {
    _guidePageView = [[___VARIABLE_Prefix:identifier___GuidePageView alloc] init];
    [self.view addSubview:_guidePageView];
    _guidePageView.models = _models;
    _guidePageView.delegate = self;
}


#pragma mark - ___VARIABLE_Prefix:identifier___GuidePageViewDelegate.

- (void)enterButtonClicked:(___VARIABLE_Prefix:identifier___GuidePageView *)view type:(___VARIABLE_Prefix:identifier___GuidePageItemType)type {
    [self ht_back];
}

@end
