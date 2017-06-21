//
//  {{args.Prefix}}ToolBarViewController.m
//
//  Created by {{args.Author}} on 2017/5/10.
//    Copyright © 2017年 Netease. All rights reserved.
//

#import "{{args.Prefix}}ToolBarViewController.h"
#import "HTControllerRouter.h"
#import "HTNavigationPanProtocol.h"
#import "{{args.Prefix}}BaseViewController+{{args.Prefix}}CustomNavigationBar.h"
#import "UIView+Frame.h"
#import "HTSegmentsView.h"
#import "{{args.Prefix}}ToolBarItem.h"
#import "UIImage+ImageWithColor.h"


@interface {{args.Prefix}}ToolBarViewController () <HTSegmentsViewDelegate,
                                                HTSegmentsViewDatasource,
                                                HTRouteTargetProtocol,
                                                HTContainerViewControllerProtocol,
                                                HTNavigationBackPanGestureProtocol>

@property (nonatomic, strong) HTSegmentsView *segmentsTabbar;
@property (nonatomic, strong) UIView *tabBar;
@property (nonatomic, strong) NSMutableArray *icons;

@end

@implementation {{args.Prefix}}ToolBarViewController

@synthesize containerController;

#pragma mark - Router

+ (HTControllerRouterConfig*)configureRouter {
    HT_EXPORT();
    HTControllerRouterConfig *config = [[HTControllerRouterConfig alloc] initWithUrlPath:[self urlPath]];
    return config;
}

+ (NSString*)urlPath {
    return @"{{args.Prefix}}://ToolTabBar";
}

- (void)receiveRoute:(HTControllerRouteParam*)param {
}


#pragma mark --- Life Cycle ---

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"工具栏";
    [self loadSubviews];
    [self {{args.CategoryPrefix}}_applyDefaultNavigationBarStyle];
    [self {{args.CategoryPrefix}}_addNavigationLeftBackItem];
    // Do any additional setup after loading the view.
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    // 若要修改tableview／refreshview／loadmoreview的frame，在这里修改
    _segmentsTabbar.frame = self.tabBar.bounds;
    
}

#pragma mark --- loadSubViews ---

- (void)loadSubviews{
    self.tabBar = [[UIView alloc ] init];
    self.tabBar.width = SCREEN_WIDTH;
    self.tabBar.height = kToolBarHeight;
    self.tabBar.y = self.view.height - kToolBarHeight - kNavigationHeight;
    self.tabBar.x = 0;
    [self.view addSubview: self.tabBar];
    
    // 用户在此自定义产品对应的 tab
    _icons = [NSMutableArray arrayWithArray:@[@"widget_default_m",
                                              @"widget_default_m",
                                              @"widget_default_m",
                                              @"widget_default_m",
                                              @"widget_default_m"]];
    [self loadSegmentsView];
}

- (void)loadSegmentsView {
    _segmentsTabbar = [[HTHorizontalSegmentsView alloc] initWithSelectedIndex:0];
    _segmentsTabbar.segmentsDataSource = self;
    _segmentsTabbar.segmentsDelegate = self;
    _segmentsTabbar.backgroundColor = [UIColor colorWithRGBValue:kTabBarbackgroundColor];
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.5)];
    line.backgroundColor = [UIColor colorWithRGBValue:0xcccccc];
    [_segmentsTabbar addSubview:line];

    [self.tabBar addSubview:_segmentsTabbar];
}


#pragma mark - HTSegmentsViewDelegate

- (BOOL)segmentsView:(HTSegmentsView*)segmentsView shouldSelectedAtIndex:(NSUInteger)index {
    BOOL shouldSelected = YES;
    return shouldSelected;
}

- (void)segmentsView:(HTSegmentsView*)segmentsView didSelectedAtIndex:(NSUInteger)index {
    [_segmentsTabbar setSelectedIndex:index animated:NO];
}


#pragma mark - HTSegmentsViewDatasource

- (NSUInteger)numberOfCellsInSegementsView:(HTSegmentsView*)segmentsView {
    return _icons.count;
}

- (HTSegmentsCellView*)segmentsView:(HTSegmentsView*)segmentsView cellForIndex:(NSUInteger)index {
    {{args.Prefix}}ToolBarItem *itemCell = [[{{args.Prefix}}ToolBarItem alloc] initWithIcon:_icons[index] selectedIcon:nil];
    return itemCell;
}

- (CGSize)segmentsView:(HTSegmentsView*)segmentsView cellSizeForIndex:(NSUInteger)index {
    CGFloat screenWidth = CGRectGetWidth([UIScreen mainScreen].bounds);
    return CGSizeMake(screenWidth/_icons.count, CGRectGetHeight(self.tabBar.bounds));
}


@end

