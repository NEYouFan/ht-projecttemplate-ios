//
//  {{args.Prefix}}MainPageViewController.m
//  {{args.Prefix}}
//
//  Created by {{args.Author}} on 2017/4/18.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}MainPageViewController.h"
#import "HTControllerRouter.h"
#import "{{args.Prefix}}BaseViewController+{{args.Prefix}}CustomNavigationBar.h"
#import "{{args.Prefix}}MainPageSectionView.h"
#import "{{args.Prefix}}CommonSizes.h"
#import "{{args.Prefix}}CommonColors.h"
#import "UIView+Frame.h"
#import "{{args.Prefix}}MainPageHeaderView.h"
#import "{{args.Prefix}}MainPageBottomView.h"
#import "{{args.Prefix}}MainPageModel.h"


@interface {{args.Prefix}}MainPageViewController ()   <HTRouteTargetProtocol,
                                        {{args.Prefix}}MainPageSectionViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, nonnull, strong){{args.Prefix}}MainPageModel *model;

@end

@implementation {{args.Prefix}}MainPageViewController

#pragma mark - Router

+ (HTControllerRouterConfig*)configureRouter {
    HT_EXPORT();
    HTControllerRouterConfig *config = [[HTControllerRouterConfig alloc] initWithUrlPath:[self urlPath]];
    return config;
}

+ (NSString*)urlPath {
    return @"{{args.Prefix}}://mainPage";
}

- (void)receiveRoute:(HTControllerRouteParam*)param {
}


#pragma mark - Life cycle.

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadSubviews];
    [self {{args.CategoryPrefix}}_applyDefaultNavigationBarStyle];
    self.title = @"NetEase UI";
}

- (void)loadSubviews{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView = scrollView;
    self.automaticallyAdjustsScrollViewInsets = NO;
    scrollView.height = SCREEN_HEIGHT - kNavigationHeight - kTabHeight;
    scrollView.backgroundColor = [UIColor colorWithRGBValue:kDefaultBackgroundColor];
    
    
    CGFloat contentHeight = 0;
    
    for (int index = 0; index < [self.model.sectionTitles count]; index ++) {
        {{args.Prefix}}MainPageSectionView * sectionView = [[{{args.Prefix}}MainPageSectionView alloc] initWithTitle:self.model.sectionTitles[index]
                                                                                      iconName:self.model.sectionIcons[index]
                                                                                     cellNames:self.model.sectionCellNames[index]
                                                                                    routerURLs:self.model.sectionCellUrls[index]];
        sectionView.delegate = self;
        sectionView.y = contentHeight + 15;
        [scrollView addSubview:sectionView];
        contentHeight = contentHeight + 15 + sectionView.height;
    }
    
    {{args.Prefix}}MainPageBottomView *bottomView = [[{{args.Prefix}}MainPageBottomView alloc] init];
    if (contentHeight > scrollView.height - 82.5) {
        bottomView.y = contentHeight;
        contentHeight = contentHeight + bottomView.height;
    }else{
        bottomView.y = scrollView.height - 82.5;
        contentHeight = scrollView.height;
    }
    [scrollView addSubview:bottomView];
    
    scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, contentHeight);
    [self.view addSubview:scrollView];
}


#pragma mark - {{args.Prefix}}MainPageSectionViewDelegate
- (void)jumpWithRouterURL:(NSString *)url{
    if (url.length <= 0) {
        return;
    }
    HTControllerRouteParam *param = [[HTControllerRouteParam alloc] init];
    param.url = url;
    param.launchMode = HTControllerLaunchModePushNavigation;
    param.fromViewController = [APPDELEGATE() rootNavigationController];
    param.delegate = self;
    [[HTControllerRouter sharedRouter] route:param];
}

#pragma mark - setModel
- (void)setModel:({{args.Prefix}}MainPageModel *)model{
    _model = model;
}

@end
