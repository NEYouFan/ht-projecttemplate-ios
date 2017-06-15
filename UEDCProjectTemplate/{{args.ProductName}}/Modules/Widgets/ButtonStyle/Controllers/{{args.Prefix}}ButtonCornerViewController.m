//
//  {{args.Prefix}}ButtonCornerViewController.m
//
//  Created by {{args.Author}} on 2017/4/21.
//    Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}ButtonCornerViewController.h"
#import "HTControllerRouter.h"
#import "HTNavigationPanProtocol.h"
#import "{{args.Prefix}}BaseViewController+{{args.Prefix}}CustomNavigationBar.h"
#import "{{args.Prefix}}CommonSizes.h"
#import "{{args.Prefix}}CommonColors.h"
#import "UIView+Frame.h"
#import "{{args.Prefix}}ButtonCornerModel.h"
#import "{{args.Prefix}}ButtonCornerSectionView.h"

@interface {{args.Prefix}}ButtonCornerViewController () <HTRouteTargetProtocol,
                                                HTContainerViewControllerProtocol,
                                                HTNavigationBackPanGestureProtocol>
@property (nonatomic, strong) NSArray<{{args.Prefix}}ButtonCornerModel *> *models;
@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation {{args.Prefix}}ButtonCornerViewController

@synthesize containerController;

#pragma mark - Router

+ (HTControllerRouterConfig*)configureRouter {
    HT_EXPORT();
    HTControllerRouterConfig *config = [[HTControllerRouterConfig alloc] initWithUrlPath:[self urlPath]];
    return config;
}

+ (NSString*)urlPath {
    return @"{{args.Prefix}}://buttonCorner";
}

- (void)receiveRoute:(HTControllerRouteParam*)param {
}


#pragma mark --- Life Cycle ---

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"直角与圆角按钮";
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
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView = scrollView;
    self.automaticallyAdjustsScrollViewInsets = NO;
    scrollView.height = SCREEN_HEIGHT - kNavigationHeight;
    scrollView.backgroundColor = [UIColor colorWithRGBValue:kDefaultBackgroundColor];
    [self.view addSubview:self.scrollView];
    
    CGFloat contentHeight = 0;
    {{args.Prefix}}ButtonCornerSectionView *section1 = [[{{args.Prefix}}ButtonCornerSectionView alloc] initWithTitle:@"直角按钮"
                                                                                        Models:[{{args.Prefix}}ButtonCornerModel rightAngleButtonModels]];
    section1.y = 0;
    [scrollView addSubview:section1];
    contentHeight += section1.height;
    
    {{args.Prefix}}ButtonCornerSectionView *section2 = [[{{args.Prefix}}ButtonCornerSectionView alloc] initWithTitle:@"圆角按钮"
                                                                                        Models:[{{args.Prefix}}ButtonCornerModel roundCornerButtonModels]];
    section2.y = contentHeight;
    [scrollView addSubview:section2];
    contentHeight += section2.height + 70;

    self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, contentHeight);
}


@end

