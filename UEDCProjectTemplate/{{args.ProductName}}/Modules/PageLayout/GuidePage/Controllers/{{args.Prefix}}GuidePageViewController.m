//
//  {{args.Prefix}}GuidePageViewController.m
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 2017/5/26.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}GuidePageViewController.h"
#import "HTControllerRouter.h"
#import "HTNavigationPanProtocol.h"
#import "{{args.Prefix}}BaseViewController+{{args.Prefix}}CustomNavigationBar.h"
#import "UIView+Frame.h"
#import "{{args.Prefix}}GuidePageView.h"
#import "{{args.Prefix}}GuidePageModel.h"

@interface {{args.Prefix}}GuidePageViewController () <HTRouteTargetProtocol,
                                           HTContainerViewControllerProtocol,
                                           HTNavigationBackPanGestureProtocol,
                                           {{args.Prefix}}GuidePageViewDelegate>

@property (nonatomic, strong) NSMutableArray <{{args.Prefix}}GuidePageModel *>*models;

@property (nonatomic, strong) {{args.Prefix}}GuidePageView *guidePageView;

@end

@implementation {{args.Prefix}}GuidePageViewController
@synthesize containerController;

#pragma mark - Router

+ (HTControllerRouterConfig*)configureRouter {
    HT_EXPORT();
    HTControllerRouterConfig *config = [[HTControllerRouterConfig alloc] initWithUrlPath:[self urlPath]];
    return config;
}

+ (NSString*)urlPath {
    return @"{{args.Prefix}}://guidepage";
}

- (void)receiveRoute:(HTControllerRouteParam*)param {
}


#pragma mark - Life Cycle.

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self {{args.CategoryPrefix}}_applyTransparentNavigationBarWhiteStatus];
    
    [self loadData];
    [self loadSubViews];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    _guidePageView.frame = self.view.frame;
}


#pragma mark - Load Data.

- (void)loadData {
    {{args.Prefix}}GuidePageModel *firstPageModel = [[{{args.Prefix}}GuidePageModel alloc] init];
    firstPageModel.title = @"主标题1";
    firstPageModel.subTitle = @"这是一段副标题或描述";
    firstPageModel.isShowButton = NO;
    
    {{args.Prefix}}GuidePageModel *secondPageModel = [[{{args.Prefix}}GuidePageModel alloc] init];
    secondPageModel.title = @"主标题2";
    secondPageModel.subTitle = @"这是一段副标题或描述";
    secondPageModel.isShowButton = NO;
    
    {{args.Prefix}}GuidePageModel *thirdPageModel = [[{{args.Prefix}}GuidePageModel alloc] init];
    thirdPageModel.title = @"主标题3";
    thirdPageModel.subTitle = @"这是一段副标题或描述";
    thirdPageModel.isShowButton = YES;
    
    _models = [NSMutableArray arrayWithObjects:firstPageModel, secondPageModel, thirdPageModel, nil];
}


#pragma mark - Load views.

- (void)loadSubViews {
    _guidePageView = [[{{args.Prefix}}GuidePageView alloc] init];
    [self.view addSubview:_guidePageView];
    _guidePageView.models = _models;
    _guidePageView.delegate = self;
}


#pragma mark - {{args.Prefix}}GuidePageViewDelegate.

- (void)enterButtonClicked:({{args.Prefix}}GuidePageView *)view type:({{args.Prefix}}GuidePageItemType)type {
    [self ht_back];
}

@end
