//
//  {{args.Prefix}}TextSizeViewController.m
//
//  Created by {{args.Author}} on 2017/4/20.
//    Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}TextSizeViewController.h"
#import "HTControllerRouter.h"
#import "HTNavigationPanProtocol.h"
#import "{{args.Prefix}}BaseViewController+{{args.Prefix}}CustomNavigationBar.h"
#import "{{args.Prefix}}CommonSizes.h"
#import "{{args.Prefix}}CommonColors.h"
#import "UIView+Frame.h"
#import "{{args.Prefix}}TextSizeView.h"
#import "{{args.Prefix}}TextSizeViewModel.h"

const CGFloat kTextSizeViewHeight = 60;

@interface {{args.Prefix}}TextSizeViewController () <HTRouteTargetProtocol,
                                            HTContainerViewControllerProtocol,
                                            HTNavigationBackPanGestureProtocol>

@property (nonatomic, strong) NSArray<{{args.Prefix}}TextSizeViewModel *> *models;
@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation {{args.Prefix}}TextSizeViewController

@synthesize containerController;

#pragma mark - Router

+ (HTControllerRouterConfig*)configureRouter {
    HT_EXPORT();
    HTControllerRouterConfig *config = [[HTControllerRouterConfig alloc] initWithUrlPath:[self urlPath]];
    return config;
}

+ (NSString*)urlPath {
    return @"{{args.Prefix}}://textSize";
}

- (void)receiveRoute:(HTControllerRouteParam*)param {
}


#pragma mark --- Life Cycle ---

- (void)viewDidLoad {
    [super viewDidLoad];
    //to do: 设置页面title
    self.title = @"字体大小";
    [self loadDatas];
    [self loadSubviews];
    [self {{args.CategoryPrefix}}_applyDefaultNavigationBarStyle];
    [self {{args.CategoryPrefix}}_addNavigationLeftBackItem];
    // Do any additional setup after loading the view.
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    // 若要修改tableview／refreshview／loadmoreview的frame，在这里修改
}

#pragma mark --- load ---

- (void)loadDatas{
    self.models = [{{args.Prefix}}TextSizeViewModel textSizeViewModels];
}

- (void)loadSubviews{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView = scrollView;
    self.automaticallyAdjustsScrollViewInsets = NO;
    scrollView.height = SCREEN_HEIGHT - kNavigationHeight;
    scrollView.backgroundColor = [UIColor colorWithRGBValue:kDefaultBackgroundColor];
    [self.view addSubview:self.scrollView];
    
    CGFloat contentHeight = 0;
    for (int i = 0; i < [self.models count]; i ++) {
        {{args.Prefix}}TextSizeView *view = [[{{args.Prefix}}TextSizeView alloc] initWithFrame:CGRectMake(15, contentHeight+ 15, SCREEN_WIDTH -30 , kTextSizeViewHeight)
                                                                   model:self.models[i]];
        [scrollView addSubview:view];
        contentHeight += 15 + kTextSizeViewHeight;
    }
    
    contentHeight += 15;
    self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, contentHeight);
}


@end

