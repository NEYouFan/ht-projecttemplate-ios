//
//  {{args.Prefix}}TextColorViewController.m
//
//  Created by {{args.Author}} on 2017/4/20.
//    Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}TextColorViewController.h"
#import "HTControllerRouter.h"
#import "HTNavigationPanProtocol.h"
#import "{{args.Prefix}}BaseViewController+{{args.Prefix}}CustomNavigationBar.h"
#import "{{args.Prefix}}CommonSizes.h"
#import "{{args.Prefix}}CommonColors.h"
#import "UIView+Frame.h"
#import "{{args.Prefix}}TextColorView.h"
#import "{{args.Prefix}}TextColorViewModel.h"

const CGFloat kTextColorViewHeight = 60;


@interface {{args.Prefix}}TextColorViewController () <HTRouteTargetProtocol,
                                                HTContainerViewControllerProtocol,
                                                HTNavigationBackPanGestureProtocol>

@property (nonatomic, strong) NSArray <{{args.Prefix}}TextColorViewModel *> *models;
@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation {{args.Prefix}}TextColorViewController

@synthesize containerController;

#pragma mark - Router

+ (HTControllerRouterConfig*)configureRouter {
    HT_EXPORT();
    HTControllerRouterConfig *config = [[HTControllerRouterConfig alloc] initWithUrlPath:[self urlPath]];
    return config;
}

+ (NSString*)urlPath {
    return @"{{args.Prefix}}://textColor";
}

- (void)receiveRoute:(HTControllerRouteParam*)param {
}


#pragma mark --- Life Cycle ---

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"字体颜色";
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

#pragma mark --- loadSubViews ---

- (void)loadDatas{
    self.models = [{{args.Prefix}}TextColorViewModel textColorViewModels];
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
        {{args.Prefix}}TextColorView *view = [[{{args.Prefix}}TextColorView alloc] initWithFrame:CGRectMake(15, contentHeight+ 15, SCREEN_WIDTH -30 , kTextColorViewHeight)
                                                                   model:self.models[i]];
        [scrollView addSubview:view];
        contentHeight += 15 + kTextColorViewHeight;
    }
    
    contentHeight += 15;
    self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, contentHeight);
}


@end

